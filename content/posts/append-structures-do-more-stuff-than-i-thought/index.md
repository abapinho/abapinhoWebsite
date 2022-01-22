---
title: 'As APPEND STRUCTUREs fazem mais do que eu pensava'
slug: append-structures-do-more-stuff-than-i-thought
date: 2016-10-17 09:00:06
tags: [ddic, segredo]
categories: [dicas]
wordpressId: 3634
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['append structure foreign key']
---
Toda a minha vida ABAPiana usei APPEND STRUCTURES para adicionar campos extra a tabelas standard.

Mas aprendi recentemente que afinal servem para mais duas coisas:

<!--more-->

  * Adicionar chaves estrangeiras a campos já existentes na tabela standard

  * Adicionar search-helps a campos já existentes na tabela standard

A SAP refere-o [aqui][1].

Para o fazer há um pequeno truque. Quando estiveres na append structure, mesmo que ela não tenha nenhum campo, vais reparar que há lá um botão que em português diz (numa tradução miserável) “Apendente ON” e que faz aparecer todos os campos da tabela original. A partir daí é só escolher o campo desejado e configurar chaves estrangeiras e search-helps.

Estamos sempre a aprender.

Foto: [Sugar Daze][2] via [VisualHunt.com][3] / [CC BY-NC-ND][4]

O Abapinho saúda-vos.

   [1]: https://help.sap.com/saphelp_nw73/helpdata/en/cf/21ebc9446011d189700000e8322d00/content.htm
   [2]: https://www.flickr.com/photos/catbeurnier/3114941639/
   [3]: https://visualhunt.com
   [4]: https://creativecommons.org/licenses/by-nc-nd/2.0/
