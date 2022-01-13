---
title: 'Atafulha o ecrã de selecção de bonecada'
slug: bonecada-no-ecra-seleccao
date: 2012-04-09 10:00:58
tags: [ui]
categories: [dicas]
wordpressId: 1596
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Foi o SAP que nasceu tristonho ou são os SAPeiros que não o alegram?

É verdade que o SAPGui não é nenhum arco-íris nem inspira felicidade ao olhar para ele. Mas ainda assim põe uma catrefada de bonequinhos ao nosso dispôr que podemos usar para o tornar nem que seja um pouquinho mais animado.

E vê como é tão fácil.

<!--more-->

Imagina que escreves o seguinte programa:


{{< highlight ABAP >}}
REPORT  Z_ICONES_NO_ECRA_DE_SELECCAO

PARAMETERS: p_coiso TYPE char20.

START-OF-SELECTION.
  WRITE p_coiso.
{{< /highlight >}}

O próximo passo é ir aos textos de selecção definir o texto do parâmetro P_COISO. Antes de lá ires experimenta correr o report SHOWICON para veres a bonecada toda. Quando te fartares de olhar para eles escolhes um e guardas o seu nome. Eu escolhi o ICON_COLOR. Guardas o código alfa-numérico de dois caracteres que aparece lá na antepenúltima coluna chamada "interno". Por exemplo, o código do ícone chamado ICON_COLOR é o G3:

[![][1]][2]

Agora sim vais aos textos de selecção e onde quiseres que apareça o ícone escreves o código ladeado por arrobas:

[![][3]][4]

E o resultado é, como seria de esperar, animador:

[![][5]][6]

Ficas já agora a saber que os bonecos têm de estar no início da linha e que só dá para meter um (que isto não é o msn, pá!).

Obrigado a Luís Rocha pela dica.

O Abapinho saúda-vos.

   [1]: images/icones1.png (icones1)
   [2]: images/icones1.png
   [3]: images/icones2.png (icones2)
   [4]: images/icones2.png
   [5]: images/icones3.png (icones3)
   [6]: images/icones3.png
