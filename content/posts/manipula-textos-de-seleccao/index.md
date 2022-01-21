---
title: 'Manipula textos de selecção sem os fixar no programa'
slug: manipula-textos-de-seleccao
date: 2021-05-24 09:00:11
tags: [ddic, i18n, segredo]
categories: [dicas]
wordpressId: 4653
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
description: 'Manipula os textos de selecção de um relatório podendo continuar a traduzi-los sem problemas.'
---
Embora muitos ABAPers ainda se esqueçam disto, quanto menos textos forem fixados no programa mais fácil será traduzi-lo.

Aqui está uma forma simples mas relativamente obscura de alterar os textos para, por exemplo, adicionar-lhes ícones, mantendo-os traduzíveis.

<!--more-->

A magia acontece no INITIALIZATION.


{{< highlight ABAP >}}
PARAMETERS: p_erdat TYPE erdat.

INITIALIZATION.
  %_P_ERDAT_%_APP_%-TEXT = icon_date && %_P_ERDAT_%_APP_%-TEXT.
{{< /highlight >}}

E aqui está o resultado (nota o ícone do calendário à esquerda do texto):
[![][1]][2]

O ABAP está cheio de truques bizarros como este.

O Abapinho saúda-vos.

   [1]: images/texto-seleccao-com-icon-300x87.png
   [2]: images/texto-seleccao-com-icon.png
