---
title: 'SAT - A nova ferramenta de análise de execução'
slug: sat
date: 2011-02-16 14:31:40
tags: [debug, performance]
categories: [dicas]
wordpressId: 637
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Desde pequenino que uso a transacção SE30 para duas coisas diferentes:

  * Analisar um programa que desconheço (normalmente standard) para saber que funções usa, que BADIs disponibiliza, etc;

  * Analisar um programa meu em busca de problemas de performance.

A verdade, nua e crua, é que a transacção SE30 é uma porcaria pegada. Extremamente limitada e inflexível, não dá jeito nenhum para qualquer análise mais complexa.

Aparentemente os senhores da SAP concordam e resolveram substitui-la pela fantástica nova ferramenta _SAT - ABAP Runtime Analysis_ , em tudo mais sofisticada. Pode ser acedida, como seria de esperar, através da transacção SAT.

Se ainda não existir no teu sistema, terás de esperar por um _upgrade_. Se já existir, boas investigações.

Aqui está um [conjunto de _screencasts_][1] da SAP a ensinar a usar a nova SAT.

O Abapinho saúda-vos.

   [1]: http://www.sdn.sap.com/irj/scn/elearn?rid=/library/uuid/d0c750c1-7d04-2e10-8492-a11b9219371d&overridelayout=true
