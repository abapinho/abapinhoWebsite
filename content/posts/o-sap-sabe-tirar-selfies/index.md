---
title: 'O SAP sabe tirar <i>selfies</i>!'
slug: o-sap-sabe-tirar-selfies
date: 2015-12-28 09:00:35
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 3352
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Acabei de descobrir que o SAP consegue tirar selfies. Ainda não estou a ver para que é que isto possa servir. Mas não é grave porque na verdade também nunca vi para que é que servem as selfies tiradas por nós os humanos.

Faz-se assim:

<!--more-->


{{< highlight ABAP >}}

CL_GUI_FRONTEND_SERVICES=>GET_SCREENSHOT().

{{< /highlight >}}

Sorri!

O Abapinho saúda-vos.
