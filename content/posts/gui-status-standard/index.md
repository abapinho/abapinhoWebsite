---
title: 'Usa o GUI Status Standard sem o copiares'
slug: gui-status-standard
date: 2016-11-28 09:00:02
tags: [alv]
categories: [dicas]
wordpressId: 3667
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando queres usar a CL_GUI_ALV_GRID num CONTAINER tens de copiar um GUI Status standard de outro programa. Por exemplo o GUI Status “STANDARD" do grupo de funções SALV. E depois no PAI do ecrã chamas:

SET PF-STATUS ‘STANDARD’.

E lá aparecem os butõezinhos.

<!--more-->

Mas se não precisares de alterar nada no GUI Status, o que acaba por ser bastante comum, há uma forma mais práctica de fazer isto sem ter de copiar o GUI Status STANDARD para o teu grupo de funções ou programa:

SET PF-STATUS ‘STANDARD’ OF PROGRAM ‘SAPLSALV’.

Em que SAPLSALV é o nome do programa do grupo de funções SALV.

É uma dica singela, mas vem do coração.

Obrigado Nuno Morais pela dica.

O Abapinho saúda-vos.
