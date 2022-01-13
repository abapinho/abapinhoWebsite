---
title: 'Nunca te lembras do código ASCII do CR_LF e seus amigos?'
slug: nunca-te-lembras-do-codigo-ascii-do-cr_lf-e-seus-amigos
date: 2015-12-21 09:00:56
tags: []
categories: [dicas]
wordpressId: 3348
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Eu também não.

Nem quero lembrar-me. Para quê gastar memória com códigos obtusos?

E não é preciso porque o ABAP tem uma classe que ajuda.

<!--more-->

Chama-se **CL_ABAP_CHAR_UTILITIES**. Tem uns métodos para converter de ENDIAN para número e vice-versa e tal, mas não é por isso que estou a falar dela. Trago-a à baila por causa das constantes que nela estão definidas:

  * HORIZONTAL_TAB

  * VERTICAL_TAB

  * NEWLINE

  * CR_LF

  * FORM_FEED

  * BACKSPACE

  * e mais umas

Quando precisares de um CR_LF em vez de ires à procura do seu código ASCII só tens de usar CL_ABAP_CHAR_UTILITIES=>CR_LF e aí o tens.

Obrigado Sérgio Serra pela dica.

O Abapinho saúda-vos.
