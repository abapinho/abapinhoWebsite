---
title: 'Usarás uma tabela de constantes'
slug: usa-uma-tabela-de-constantes
date: 2014-08-28 09:00:45
tags: [ddic, estilo]
categories: [boaspracticas]
wordpressId: 2733
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Sempre que achares que um valor que estás a usar num programa pode mudar e não o puderes tornar um parâmetro de entrada ou do ecrã de seleccção, guarda-o numa tabela de constantes (ex: ZCONSTS). Esta tabela nunca deverá ser usada directamente. Em vez disso, cria uma classe ZCL_CONSTS que aceda a ela e usa sempre esta classe para obter as tuas constantes. Como é mostrado neste artigo:
<{{< ref "constantes" >}}>

Não caias na tentação de usar a T900 ou outras tabelas do género para este propósito. É certo que muita gente faz isso. Mas é feio, sujo e essas tabelas nem sequer têm uma chave adequada porque não foram pensadas para isso.
