---
title: 'Relatório de consistência da SALV'
slug: relatorio-consistencia-salv
date: 2017-07-18 09:00:08
tags: [salv, segredo]
categories: [dicas]
wordpressId: 3822
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Às vezes uma SALV pode ter inconsistências que passam despercebidas a quem as programa. Um exemplo é uma estrutura com um campo WRBTR sem um campo de moeda associado:

<!--more-->


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_s_data,
         bukrs TYPE bukrs,
         wrbtr TYPE wrbtr,
       END OF ty_s_data.

DATA: o_salv TYPE REF TO cl_salv_table,
      t_data TYPE STANDARD TABLE OF ty_s_data.

START-OF-SELECTION.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = o_salv
    CHANGING
      t_table        = t_data ).

  o_salv->display( ).
{{< /highlight >}}

Embora quase ninguém saiba, a própria SALV faz um relatório das suas inconsistências. Para o ver basta carregar em SHIFT+DUPLO_CLIQUE_DIREITO num espaço em branco do ecrã:

[![Relatório SALV][1]][1]

Agora que já sabes, não vás para aí digar que a tua SALV está pronta antes de correres o seu relatório de consistência.

Obrigado Pierre Ameye pela dica.

A foto está desfocada, eu sei, mas achei giro.

O Abapinho saúda-vos.

   [1]: images/salv_relatorio.jpg
