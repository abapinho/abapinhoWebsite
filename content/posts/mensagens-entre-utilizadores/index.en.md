---
title: '<!--:pt-->Mensagens entre utilizadores<!--:-->'
slug: mensagens-entre-utilizadores
date: 2010-08-13 09:35:39
tags: []
categories: [dicas]
wordpressId: 350
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Muitas vezes precisamos de aceder aos dados de uma tabela através da SM30 ou a um qualquer documento e esbarramos com uma mensagem a dizer que os dados estão bloqueados por outro utilizador.

Há várias hipóteses:

  1. Ter muita paciência e esperar;

  2. Ter bastante paciência, enviar uma mensagem do SAPOffice e esperar que um dia o utilizador a vá ver;

  3. Ter alguma paciência, enviar um e-mail e esperar;

  4. Ser impaciente, ir ter com o outro e pedir-lhe para por favor sair dali;

  5. Ser impaciente e cruel e mandar abaixo a sessão do outro sem dizer água vai;

  6. Ser esperto e enviar uma mensagem de sistema pelo SAP Gui. Segue a explicação:

Primeiro há que identificar o utilizador, o que é fácil visto ele vir geralmente identificado na mensagem que avisa do bloqueio.

Depois é ir à transacção **SE37** e executar a função **TH_POPUP**.

![][1]

Preenche-se os seguintes campos:

  * CLIENT - é o mandante

  * USER - o utilizador destinatário

  * MESSAGE - o texto da mensagem

O resto deixa-se como está. Executa-se a função com **F8** e já está: o utilizador é imediatamente confrontado com o seguinte popup:

![][2]

Nota: Em rigor, através do SAPOffice é também possível enviar mensagens **expresso** que, quando enviadas, notificam imediatamente o utilizador. Mas este recebe apenas um aviso de que tem uma nova mensagem e depois tem de ir ao SAPOffice lê-la. Dá-lhe mais trabalho e há o risco de a ignorar sem a ler.

O Abapinho saúda-vos.

   [1]: images/se37_th_popup.png (SE37 TH_POPUP)
   [2]: images/se37_th_popup2.png (SE37 TH_POPUP - Popup)
