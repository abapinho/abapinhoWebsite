---
title: '<!--:pt-->Pesquisar em tabelas internas simplórias<!--:-->'
slug: tabelas-internas-simplorias
date: 2010-09-21 10:36:51
tags: []
categories: [dicas]
wordpressId: 442
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Imagina uma tabela interna tão simplória que nem sequer tem uma estrutura de dados com campos:


{{< highlight ABAP >}}
DATA: t_simploria TYPE STANDARD TABLE OF char30.
{{< /highlight >}}

Agora imagina que queres fazer uma pesquisa nessa tabela para saber se contém o valor 'sumo de melão'. mas como não tem campos, como a fazes? Normalmente usarias algo tipo WITH KEY campo = valor. Mas ela não tem campos. O ABAP disponibiliza uma palavra especial que resolve este problema: TABLE_LINE. Na prática com o TABLE_LINE acede-se à linha toda de uma só vez. E a solução é:


{{< highlight ABAP >}}
READ TABLE t_simploria 
  TRANSPORTING NO FIELDS 
  WITH KEY table_line = 'sumo de melão'.
{{< /highlight >}}

O Abapinho saúda-vos.
