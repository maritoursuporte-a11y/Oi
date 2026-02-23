#!/bin/bash

# ==============================================================================
# Script para Criar uma ISO Live do Ubuntu Customizada
# ==============================================================================
#
# Mantenedor: Manus AI
# Descrição:  Este script automatiza a criação de uma ISO live do Ubuntu 24.04
#             (Noble Numbat) com pacotes e configurações pré-instalados,
#             incluindo LibreOffice, WPS Office e um atalho para WhatsApp Web.
#
# ==============================================================================

# --- Configurações Iniciais ---
set -e

# Nome da ISO e diretórios de trabalho
export LIVE_BUILD_DIR="$HOME/live-ubuntu-from-scratch"
export CHROOT_DIR="$LIVE_BUILD_DIR/chroot"
export IMAGE_DIR="$LIVE_BUILD_DIR/image"
export ISO_NAME="Ubuntu_Custom_Live.iso"

# Versão do Ubuntu a ser usada como base
export UBUNTU_VERSION="noble"

# --- Funções Auxiliares ---

# Função para exibir mensagens de log
log() {
    echo -e "\n[INFO] $1\n"
}

# Função para limpar o ambiente antes de sair
cleanup() {
    log "Limpando o ambiente..."
    if sudo umount "$CHROOT_DIR/dev"; then log "Desmontado /dev"; fi
    if sudo umount "$CHROOT_DIR/run"; then log "Desmontado /run"; fi
    # Adicionar outros pontos de montagem se necessário
}

trap cleanup EXIT

# --- Etapa 1: Preparação do Ambiente ---

log "Iniciando a preparação do ambiente..."

# Instalar dependências necessárias no sistema host
sudo apt-get update
sudo apt-get install -y debootstrap squashfs-tools xorriso

# Criar diretórios de trabalho
log "Criando diretórios de trabalho em $LIVE_BUILD_DIR..."
mkdir -p "$LIVE_BUILD_DIR"

# Limpar diretórios de compilações anteriores
if [ -d "$CHROOT_DIR" ]; then
    log "Removendo diretório chroot antigo..."
    sudo rm -rf "$CHROOT_DIR"
fi
if [ -d "$IMAGE_DIR" ]; then
    log "Removendo diretório de imagem antigo..."
    sudo rm -rf "$IMAGE_DIR"
fi

# --- Etapa 2: Bootstrap do Sistema Base com Debootstrap ---

log "Executando debootstrap para criar o sistema base do Ubuntu $UBUNTU_VERSION..."
sudo debootstrap \
    --arch=amd64 \
    --variant=minbase \
    "$UBUNTU_VERSION" \
    "$CHROOT_DIR" \
    http://archive.ubuntu.com/ubuntu/

# Montar sistemas de arquivos essenciais para o ambiente chroot
log "Montando /dev e /run no ambiente chroot..."
sudo mount --bind /dev "$CHROOT_DIR/dev"
sudo mount --bind /run "$CHROOT_DIR/run"

log "Ambiente de bootstrap e montagens concluídos."


# --- Etapa 3: Configuração do Ambiente Chroot ---

log "Iniciando a configuração dentro do ambiente chroot..."

sudo chroot "$CHROOT_DIR" /bin/bash <<'EOF'

set -e

# Montar sistemas de arquivos virtuais
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

# Configurar variáveis de ambiente essenciais
export HOME=/root
export LC_ALL=C

# Configurar hostname
echo "ubuntu-custom-live" > /etc/hostname

# Configurar sources.list para o Ubuntu Noble Numbat
cat <<EOT > /etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse
EOT

# Atualizar lista de pacotes
apt-get update

# Instalar systemd e resolver problemas de machine-id
apt-get install -y systemd-sysv
dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id

# Evitar problemas com initctl
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

# Atualizar todos os pacotes do sistema base
apt-get -y upgrade

# Instalar o kernel do Linux e pacotes essenciais para o live system
apt-get install -y --no-install-recommends linux-generic
apt-get install -y \
    sudo \
    ubuntu-standard \
    casper \
    discover \
    laptop-detect \
    os-prober \
    network-manager \
    net-tools \
    wireless-tools \
    wpagui \
    locales \
    grub-common \
    grub-gfxpayload-lists \
    grub-pc \
    grub-pc-bin \
    grub2-common \
    grub-efi-amd64-signed \
    shim-signed

# Instalar um ambiente de desktop leve (XFCE) e um navegador
apt-get install -y xfce4 xfce4-goodies chromium-browser

EOF

log "Configuração do ambiente chroot concluída."

# --- Etapa 4: Instalação de Aplicativos Customizados (dentro do chroot) ---

log "Instalando aplicativos customizados..."

sudo chroot "$CHROOT_DIR" /bin/bash <<'EOF'

set -e

# Instalar LibreOffice completo
apt-get install -y libreoffice

# Instalar WPS Office
# Baixar o pacote .deb do site oficial
apt-get install -y wget
wget -O /tmp/wps-office.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11720/wps-office_11.1.0.11720.XA_amd64.deb

# Instalar o pacote .deb (e suas dependências)
apt-get install -y /tmp/wps-office.deb
rm /tmp/wps-office.deb

# Criar atalho para o WhatsApp Web no Desktop
mkdir -p /etc/skel/Desktop
cat <<EOT > /etc/skel/Desktop/WhatsApp.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp Web
Comment=Acessar WhatsApp Web no navegador
Exec=chromium-browser https://web.whatsapp.com
Icon=chromium-browser
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOT

chmod +x /etc/skel/Desktop/WhatsApp.desktop

EOF

log "Instalação de aplicativos customizados concluída."

# --- Etapa 5: Finalização e Limpeza do Chroot ---

log "Finalizando e limpando o ambiente chroot..."

sudo chroot "$CHROOT_DIR" /bin/bash <<'EOF'

set -e

# Limpar o cache do apt
apt-get clean

# Remover arquivos de configuração de rede e outros temporários
rm -rf /tmp/*
rm /etc/resolv.conf

# Desmontar sistemas de arquivos virtuais
umount /proc
umount /sys
umount /dev/pts

EOF

# Desmontar os pontos de montagem principais
sudo umount "$CHROOT_DIR/dev"
sudo umount "$CHROOT_DIR/run"

log "Limpeza do chroot concluída."

# --- Etapa 6: Criação da Imagem ISO Bootável ---

log "Iniciando a criação da imagem ISO..."

# Criar diretórios para a imagem ISO
export IMAGE_DIR="$LIVE_BUILD_DIR/image"
mkdir -p "$IMAGE_DIR/casper" "$IMAGE_DIR/isolinux" "$IMAGE_DIR/boot/grub"

# Copiar o kernel e o initrd do chroot para a imagem
sudo cp "$CHROOT_DIR/boot/vmlinuz"* "$IMAGE_DIR/casper/vmlinuz"
sudo cp "$CHROOT_DIR/boot/initrd.img"* "$IMAGE_DIR/casper/initrd"

# Criar o filesystem SquashFS a partir do chroot
log "Criando o filesystem SquashFS..."
sudo mksquashfs "$CHROOT_DIR" "$IMAGE_DIR/casper/filesystem.squashfs" -e boot

# Criar o arquivo de manifesto
log "Criando o arquivo de manifesto..."
sudo sh -c 'chroot "$CHROOT_DIR" dpkg-query -W --showformat='${Package} ${Version}\n' > "$IMAGE_DIR/casper/filesystem.manifest"'

# Criar o arquivo de tamanho do disco
sudo sh -c 'du -sx --block-size=1 "$CHROOT_DIR" | cut -f1 > "$IMAGE_DIR/casper/filesystem.size"'

# Criar o arquivo de configuração do GRUB
log "Configurando o bootloader GRUB..."
cat <<EOT > "$IMAGE_DIR/boot/grub/grub.cfg"
set timeout=10
set default="0"

menuentry "Iniciar Ubuntu Custom Live" {
    linux /casper/vmlinuz boot=casper quiet splash persistence ---
    initrd /casper/initrd
}

menuentry "Modo de Recuperação (Safe Graphics)" {
    linux /casper/vmlinuz boot=casper xforcevesa nomodeset quiet splash persistence ---
    initrd /casper/initrd
}

menuentry "Verificar Integridade do Disco" {
    linux /casper/vmlinuz boot=casper integrity-check quiet splash ---
    initrd /casper/initrd
}
EOT

# Criar o arquivo de boot isolinux (para compatibilidade)
cat <<EOT > "$IMAGE_DIR/isolinux/isolinux.cfg"
default vesamenu.c32
prompt 0
timeout 100

label ubn-live
menu label ^Iniciar Ubuntu Custom Live
kernel /casper/vmlinuz
append file=/cdrom/preseed/ubuntu.seed boot=casper initrd=/casper/initrd quiet splash persistence ---

label ubn-recovery
menu label ^Modo de Recuperação (Safe Graphics)
kernel /casper/vmlinuz
append file=/cdrom/preseed/ubuntu.seed boot=casper xforcevesa nomodeset quiet splash persistence ---
initrd /casper/initrd

label ubn-check
menu label ^Verificar Integridade do Disco
kernel /casper/vmlinuz
append file=/cdrom/preseed/ubuntu.seed boot=casper integrity-check quiet splash ---
initrd /casper/initrd
EOT

# Gerar a imagem ISO final com xorriso
log "Gerando a imagem ISO final com xorriso..."
sudo xorriso -as mkisofs -r \
  -V "UBUNTU_CUSTOM" \
  -o "$LIVE_BUILD_DIR/$ISO_NAME" \
  -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot \
  -boot-load-size 4 -boot-info-table \
  -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot \
  -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
  -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
  "$IMAGE_DIR"

log "ISO '$ISO_NAME' criada com sucesso em '$LIVE_BUILD_DIR'"
log "Para usar, grave a ISO em um pendrive com uma ferramenta como o Balena Etcher ou o Rufus."

