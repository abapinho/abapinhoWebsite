---
title: 'Parâmetros não parametrizáveis'
slug: parametros-nao-parametrizaveis
date: 2011-09-12 10:00:52
tags: [estilo]
categories: [dicas]
wordpressId: 995
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Volta não volta aparece um cliente que pede a um funcional que pede a um programador que crie um parâmetro protegido contra escrita no ecrã de selecção de um programa. É um bocado cretino visto que a ideia dos parâmetros é serem parametrizáveis.

Mas enfim, vê-se de tudo.

Os clientes têm tanta imaginação que a SAP devia criar um módulo de cinema, SAP CI, especialmente para eles poderem realizar os tantos filmes que lhes vão na cabeça. Estou certo de que se criariam grandes sucessos de ficção científica. E muitas comédias também.

Bem, caso alguém te peça para fazer isto, faz-se assim:


{{< highlight ABAP >}}
REPORT ZTEST1.
PARAMETERS: nao_mexe LIKE mara-matnr DEFAULT '220705' MODIF ID ro.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF SCREEN-GROUP1 = 'RO' .
      SCREEN-INPUT = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.
  WRITE: / nao_mexe.
{{< /highlight >}}

Agora falando mais a sério, a ideia de proteger parâmetros contra escrita é interessante se isso depender dos valores de outros parâmetros. Por exemplo, se o pisco "gravar ficheiro" estiver ligado, permite introduzir o nome do ficheiro, caso contrário, este último fica protegido contra escrita. Fica a sugestão. É só adicionar ao código as condições desejadas.

O Abapinho saúda-vos.
