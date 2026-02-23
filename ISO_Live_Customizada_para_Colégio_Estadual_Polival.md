# ISO Live Customizada para Colégio Estadual Polivalente de Conceição do Coité de Tempo Integral

![Logo Completa](https://private-us-east-1.manuscdn.com/sessionFile/7hq7dJdfL3BXvjQqyjwbE5/sandbox/HT3leStIPB1JLrTupZQemV-images_1771806082478_na1fn_L2hvbWUvdWJ1bnR1L2RvY3MvaW1hZ2VzL2xvZ29fY29tcGxldG8.png?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9wcml2YXRlLXVzLWVhc3QtMS5tYW51c2Nkbi5jb20vc2Vzc2lvbkZpbGUvN2hxN2RKZGZMM0JYdmpRcXlqd2JFNS9zYW5kYm94L0hUM2xlU3RJUEIxSkxyVHVwWlFlbVYtaW1hZ2VzXzE3NzE4MDYwODI0NzhfbmExZm5fTDJodmJXVXZkV0oxYm5SMUwyUnZZM012YVcxaFoyVnpMMnh2WjI5ZlkyOXRjR3hsZEc4LnBuZyIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTc5ODc2MTYwMH19fV19&Key-Pair-Id=K2HSFNDJXOU9YS&Signature=ZnshUMZZ6SI500MXz7lq3wF4bGmiW~Le~nwdD88gm--D9iOYJwy5syiAxmlB~ME20rOolN8ZI5v-E2tj41js7SqiJrsfwE5yBlwvMf1vY7haSejSaCjqza1y1PC4ImkAC8UVSmncXkgXZNPqmlVmrypppL2gxk7zN6oOhiXQZ3ty3adFz3mXKeKRoBQGOoe2dePOVzHC4l~oH4pY9pg~UXCSOjawZ4GsL2skh9eZohquCqSRDmUJYcUJgy~80OcJJUq8gYjNPHVtqG5a~qy1GBk6jsW88Stqng~1uBQI2-HA9u-yA~whYO4lAgE3yU8Xn2qEeNoX540r6N5DZfofOA__)
![Logo Simples](https://private-us-east-1.manuscdn.com/sessionFile/7hq7dJdfL3BXvjQqyjwbE5/sandbox/HT3leStIPB1JLrTupZQemV-images_1771806082478_na1fn_L2hvbWUvdWJ1bnR1L2RvY3MvaW1hZ2VzL2xvZ29fc2ltcGxlcw.png?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9wcml2YXRlLXVzLWVhc3QtMS5tYW51c2Nkbi5jb20vc2Vzc2lvbkZpbGUvN2hxN2RKZGZMM0JYdmpRcXlqd2JFNS9zYW5kYm94L0hUM2xlU3RJUEIxSkxyVHVwWlFlbVYtaW1hZ2VzXzE3NzE4MDYwODI0NzhfbmExZm5fTDJodmJXVXZkV0oxYm5SMUwyUnZZM012YVcxaFoyVnpMMnh2WjI5ZmMybHRjR3hsY3cucG5nIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNzk4NzYxNjAwfX19XX0_&Key-Pair-Id=K2HSFNDJXOU9YS&Signature=ONDQVzld5SACJzHBNnY0R8WNFQhdua9D-Ue-Cz3UxW1kco6XtG--juUSNcYvKOO5YaSxtTGpMo5D63l08A3~obaa1XrQkGvClED6m9yAVvU4ZmdwTCFLr3X8uSq-hg3J6g5VbuCc9Km5NcTGlrHsJ6~jhGhBdOhIPKvCx4Vz4i1dJ3zJNgoT-NE2CZcAdlanCeFxT5HOIpL0KOb8QvShW3tAUkqJv46cRQJq1O8Yj4TiKtii64ToAVBZz38gd8-JJSjPZRYr9Ze-RO6Gu~NzGTx-LNk6hka0EOIc~VYuMQQFElZo5sNh0BtuizWrCrDVCPBcn9A0sOAFyPHkeVpX7g__)

Este documento fornece as instruções para criar e utilizar uma imagem ISO Live do Ubuntu 24.04 LTS (Noble Numbat) customizada, otimizada para notebooks Samsung com processadores Intel. Esta ISO foi desenvolvida para facilitar apresentações de trabalho e uso diário, incluindo aplicativos essenciais como processadores de texto, planilhas, apresentações e acesso rápido ao WhatsApp Web, tudo sem a necessidade de instalação permanente no hardware.

## Conteúdo da ISO Customizada

A ISO inclui os seguintes softwares e configurações:

*   **Sistema Operacional:** Ubuntu 24.04 LTS (Noble Numbat) - uma distribuição Linux robusta e amigável, com suporte de longo prazo.
*   **Ambiente de Desktop:** XFCE - um ambiente de desktop leve e eficiente, ideal para notebooks com recursos limitados, garantindo fluidez e responsividade.
*   **Pacotes de Escritório:**
    *   **LibreOffice:** Suíte de escritório completa e gratuita, compatível com os formatos de arquivo do Microsoft Office (.docx, .pptx, .xlsx).
    *   **WPS Office:** Suíte de escritório com interface e funcionalidades muito similares ao Microsoft Office, oferecendo alta compatibilidade com os formatos da Microsoft.
*   **Navegador Web:** Chromium - navegador rápido e seguro, base do Google Chrome.
*   **WhatsApp Web:** Atalho direto no desktop para acesso rápido ao WhatsApp via navegador, sem a necessidade de instalação de aplicativos adicionais.
*   **Drivers:** Suporte abrangente para hardware Intel, garantindo compatibilidade com notebooks Samsung.

## Como Gerar a Imagem ISO (Para Usuários Avançados)

Para gerar a imagem ISO customizada, você precisará de um sistema Linux (preferencialmente Ubuntu) e o script `build_iso.sh` fornecido. Siga os passos abaixo:

1.  **Baixe o script:** Certifique-se de ter o arquivo `build_iso.sh` em seu sistema.

2.  **Torne o script executável:** Abra um terminal e execute o comando:
    ```bash
    chmod +x build_iso.sh
    ```

3.  **Execute o script:** Inicie o processo de criação da ISO com:
    ```bash
    ./build_iso.sh
    ```
    Este processo pode levar um tempo considerável, dependendo da velocidade da sua internet e do poder de processamento do seu computador, pois ele baixará e configurará todos os pacotes necessários.

4.  **Localização da ISO:** Ao final do processo, a imagem ISO (`Ubuntu_Custom_Live.iso`) será criada no diretório `~/live-ubuntu-from-scratch/`.

## Como Usar a ISO (Criar um Pendrive Bootável)

Para utilizar a ISO gerada, você precisará criar um pendrive bootável. Recomendamos as seguintes ferramentas:

*   **Balena Etcher:** Ferramenta gráfica e fácil de usar, disponível para Windows, macOS e Linux. Baixe em [balenaEtcher](https://www.balena.io/etcher/).
*   **Rufus:** Ferramenta popular para Windows, conhecida por sua eficiência. Baixe em [Rufus](https://rufus.ie/pt/).

### Passos para Criar o Pendrive Bootável (Exemplo com Balena Etcher):

1.  **Baixe e instale o Balena Etcher.**
2.  **Abra o Balena Etcher.**
3.  Clique em "Flash from file" e selecione o arquivo `Ubuntu_Custom_Live.iso`.
4.  Clique em "Select target" e escolha o seu pendrive (ATENÇÃO: certifique-se de selecionar o dispositivo correto para não apagar dados importantes).
5.  Clique em "Flash!" e aguarde o processo ser concluído.

## Como Iniciar o Notebook pelo Pendrive (Modo Live)

1.  **Conecte o pendrive bootável** no notebook Samsung.
2.  **Ligue ou reinicie o notebook.**
3.  Durante a inicialização, pressione a tecla de atalho para acessar o **Menu de Boot** ou a **BIOS/UEFI**. As teclas comuns para notebooks Samsung são `F2`, `F10`, `F12` ou `Esc`. Consulte o manual do seu modelo específico se tiver dificuldades.
4.  No Menu de Boot, selecione o seu pendrive (geralmente listado como "USB HDD" ou o nome do fabricante do pendrive).
5.  Aguarde o sistema carregar. Você será levado diretamente para o ambiente Live do Ubuntu customizado, pronto para uso.

## Persistência de Dados (Salvando suas Alterações)

Para que suas alterações (documentos criados, configurações, histórico do WhatsApp Web, etc.) sejam salvas permanentemente no pendrive, você precisará configurar a **persistência** ao criar o pendrive bootável. Recomendamos o uso do Rufus para isso:

### Configurando Persistência com Rufus (Windows)

1.  Após selecionar o arquivo `Ubuntu_Custom_Live.iso` no Rufus, localize a opção **"Persistent partition size"** (Tamanho da partição persistente).
2.  Arraste o controle deslizante para definir o tamanho desejado para a partição de persistência (por exemplo, **30 GB**). Este espaço será usado para armazenar seus dados e configurações.
3.  Prossiga com a criação do pendrive. O Rufus cuidará de criar a partição de persistência automaticamente.

## Menu de Inicialização (Opções de Boot)

Ao iniciar o notebook pelo pendrive, você verá um menu com as seguintes opções:

*   **Iniciar Ubuntu Custom Live:** Inicia o sistema operacional no modo Live com suporte a persistência. Esta é a opção padrão para uso diário.
*   **Modo de Recuperação (Safe Graphics):** Se você encontrar problemas gráficos (tela preta, travamentos visuais), selecione esta opção. Ela inicia o sistema com drivers gráficos genéricos, permitindo que você acesse o ambiente e tente resolver o problema.
*   **Verificar Integridade do Disco:** Esta opção verifica se o pendrive bootável possui arquivos corrompidos. Útil se o sistema não iniciar corretamente ou apresentar erros inesperados.

## Observações Importantes

*   **Modo Live (sem persistência):** Se você não configurar a persistência, nenhuma alteração é salva permanentemente no notebook. Ao reiniciar ou desligar, todas as modificações feitas no sistema (arquivos criados, configurações alteradas) serão perdidas. Para salvar trabalhos, utilize um pendrive externo ou serviço de armazenamento em nuvem.
*   **Desempenho:** O desempenho no modo Live pode ser ligeiramente inferior a uma instalação permanente, pois o sistema está sendo lido diretamente do pendrive.
*   **Conectividade:** Certifique-se de que o notebook tenha acesso à internet (Wi-Fi ou cabo) para o funcionamento do WhatsApp Web e atualizações.

Esperamos que esta ISO customizada seja uma ferramenta útil para as atividades do Colégio Estadual Polivalente de Conceição do Coité de Tempo Integral!
