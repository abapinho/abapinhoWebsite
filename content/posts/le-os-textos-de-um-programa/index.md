---
title: 'Lê os textos de um programa'
slug: le-os-textos-de-um-programa
date: 2014-06-09 08:30:00
tags: [i18n]
categories: [dicas]
wordpressId: 2700
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Aqui está uma forma simples de programaticamente ter acesso aos textos de um programa qualquer.


{{< highlight ABAP >}}
DATA: t_textos TYPE TABLE OF textpool.
READ TEXTPOOL sy-repid INTO t_textos
  LANGUAGE sy-langu STATE 'A’.
{{< /highlight >}}

Agora tens os textos todos disponíveis na tabela interna T_TEXTOS.

Como se isto não bastasse, podes também alterar os textos programaticamente. Com os seguintes comandos:


{{< highlight ABAP >}}
INSERT TEXTPOOL sy-repid FROM t_textos LANGUAGE sy-langu.
DELETE TEXTPOOL PROGRAM LANGUAGE 'E’.
{{< /highlight >}}

A SAP diz que estes dois últimos comandos são só para uso interno. Se os quiseres usar, fá-lo por tua conta e risco. Não tenho nada a ver com isso. Eu, a não ser que me obriguem, fico-me pelo READ.

Obrigado Miguel Durão pela dica.

O Abapinho saúda-vos.
