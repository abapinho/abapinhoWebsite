---
title: 'Eu chamo-te e tu chamas-me'
slug: i-call-you-and-you-call-me
date: 2016-05-09 18:36:30
tags: [segredo, sysadmin]
categories: [dicas]
wordpressId: 3534
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando chamas uma função por RFC tens de lhe dar a RFC DESTINATION do sistema remoto:


{{< highlight ABAP >}}
CALL FUNCTION ‘ZESPIRREI’
  DESTINATION ’sistema_longe_daqui’.
{{< /highlight >}}

E se, por alguma razão, precisares que a função que corre no sistema remoto chame uma função no sistema original. Sabes fazê-lo?

<!--more-->

É simples. O SAP ajuda. Existe uma RFC DESTINATION pré-definida chamada BACK que representa o sistema original que invocou a função remotamente.


{{< highlight ABAP >}}
FUNCTION ZESPIRREI.
(…)
CALL FUNCTION ‘ZSANTINHO’
  DESTINATION ‘BACK’.
(…)
ENDFUNCTION.
{{< /highlight >}}

Automágico.

O Abapinho saúda-vos.
