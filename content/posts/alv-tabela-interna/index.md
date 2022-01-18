---
title: 'Conteúdo de tabela interna numa ALV'
slug: alv-tabela-interna
date: 2019-09-30 09:00:54
tags: [alv, debug]
categories: [dicas]
wordpressId: 4279
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['tabela interna alv debug']
description: 'Como ver o conteúdo de uma tabela interna numa ALV durante o debug para poder filtrar, ordenar e manipular o seu conteúdo de forma mais práctica.'
---
Não sei há quanto tempo é que isto está disponível mas só agora descobri que é muito fácil ver numa ALV o conteúdo de uma tabela interna durante debug.

<!--more-->

Lembro-me que, quando precisava de fazer algo mais complicado com os dados de uma tabela interna, costumava exportá-la e tratá-la num Excel. Uma seca. E afinal... dá para usar uma ALV clicando num simples botão:

[![][1]][2]

Lá está o botão mágico que ou eu não tinha reparado ou então apareceu desde que aqui fizeram upgrade para a 7.50. Carrega-se nele e o conteúdo aparece numa ALV, pronto a ser reordenado e filtrado e tudo o mais. Fantástico.

O Abapinho saúda-vos.

   [1]: images/debug_table_alv.jpg
   [2]: http://abapinho.com/wp-content/uploads/2019/09/debug_table_alv.jpg
