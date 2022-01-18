---
title: 'Obtém valores únicos de campo de tabela interna'
slug: obtem-valores-unicos-de-campo-de-tabela-interna
date: 2020-03-16 09:00:08
tags: []
categories: [dicas]
wordpressId: 4423
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['valores únicos de campo']
description: 'Como obter os valores únicos de um campo de uma tabela interna usando apenas um único comando em vez dos clássicos LOOP e COLLECT.'
---
Em SQL consegue-se obter os valores únicos de um campo recorrendo ao DISTINCT. Quando os dados já estão numa tabela interna, antes do ABAP 7.40 tinha de se fazer um LOOP e um COLLECT.

Mas agora que vivemos em tempos mais modernos, há uma forma simples e elegante que consegue o mesmo com um único comando.

<!--more-->

Assim:


{{< highlight ABAP >}}
TYPES ty_t_land1 TYPE STANDARD TABLE OF land1 WITH KEY table_line.

SELECT * FROM kna1 INTO TABLE @data(t_kna1).

DATA(t_land1) =  VALUE ty_t_land1(
    FOR GROUPS land1 OF wa IN t_kna1
    GROUP BY wa-land1 ASCENDING
    WITHOUT MEMBERS
    ( land1 ) ).
{{< /highlight >}}

Bonito? Bonito!

Actualizaçõa: o Vasco Nascimento notou que o código acima só funciona com estruturas simples (flat) e propôs uma alternativa que também funciona com estruturas complexas (deep):


{{< highlight ABAP >}}
TYPES:
  BEGIN OF ty_land1,
    land1 TYPE land1,
  END OF ty_land1.
TYPES ty_t_land1 TYPE STANDARD TABLE OF ty_land1.

SELECT * FROM kna1 INTO TABLE @data(t_kna1).

DATA(lt_land1) = VALUE ty_t_land1(
  FOR GROUPS land1 OF wa IN t_kna1
  GROUP BY wa-land1 ASCENDING
  WITHOUT MEMBERS
  ( land1 = land1 ) ).
{{< /highlight >}}

Obrigado Vasco!

O Abapinho saúda-vos.
