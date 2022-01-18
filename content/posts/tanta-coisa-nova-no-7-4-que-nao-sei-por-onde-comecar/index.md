---
title: 'Tanta coisa nova no 7.4 que não sei por onde começar'
slug: tanta-coisa-nova-no-7-4-que-nao-sei-por-onde-comecar
date: 2015-08-19 09:00:19
tags: [7.4]
categories: [dicas]
wordpressId: 3192
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O Abapinho vai lentamente começar a dar dicas específicas para o AS ABAP 7.4. Lentamente porque ainda são poucas as pessoas com acesso a esse sistema. Mas são tantas as novidades que dá vontade de começar a fazê-lo rapidamente.

O ABAP era um gajo de meia idade com barriga e todo flácido. Fizeram-lhe uma operação plástica e agora parece ter 20 anos e montes de músculos, capaz de ir sair à noite até às 9 da manhã, beber 7 gins tónicos e a seguir, antes de se ir deitar, fazer 100 _burpees_ só para adormecer melhor.

Pré 7.4:

{{< highlight ABAP >}}
SELECT z1~campo1 z1~campo2 z1~campo3 z1~campo4 z1~campo5
       z2~campo6
 FROM z1
 INNER JOIN z2
 ON z1~campo1 = z2~campo1
 INTO CORRESPONDING FIELDS OF TABLE lt_data
 WHERE z1~campo2 = 'MALAQUIAS'.
{{< /highlight >}}

Pós 7.4:

{{< highlight ABAP >}}
SELECT <strong>z1~*</strong>
       z2~campo6
 FROM z1
 INNER JOIN z2
 ON z1~campo1 = z2~campo1
 INTO CORRESPONDING FIELDS OF TABLE lt_data
 WHERE z1~campo2 = 'MALAQUIAS'.
{{< /highlight >}}

O Abapinho saúda-vos.
