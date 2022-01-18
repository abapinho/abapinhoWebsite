---
title: 'DELETE vs CLEAR vs REFRESH vs FREE'
slug: delete-vs-clear-vs-refresh-vs-free
date: 2015-07-27 09:00:01
tags: [estilo, performance]
categories: [artigos]
wordpressId: 3169
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
DELETE
CLEAR
REFRESH
FREE

São várias maneiras de limpar os dados de uma tabela interna.
À partida parecem iguais.
Mas não são.

<!--more-->

A imagem seguinte mostra a análise de memória de 4 tabelas internas iguaizinhas. Os nomes delas são sugestivos e devem dar para perceberes o que vai acontecer a cada uma. Se não perceberes liga para alguém amigo que não sabia ABAP e diz-lhe que precisas de ajuda:

[![delete_refresh_clear_free_antes][1]][1]

Agora repara no resultado depois de aplicar cada um dos comandos acima referidos:

[![delete_refresh_clear_free_depois][2]][2]

Como vês, só o FREE é que rapou o tacho. O CLEAR e o REFRESH ainda limparam qualquer coisa. O DELETE nem se esforçou.

Parece-me que, a julgar pelo que aqui se viu, é de usares sempre o FREE para apagares os dados de uma tabela, pelo menos nos casos em que já não precises mais dela.

Obrigado Fábio Branquinho pela dica.

Obrigado Aaron Webb pela [foto][3].

O Abapinho saúda-vos.

   [1]: images/delete_refresh_clear_free_antes.png
   [2]: images/delete_refresh_clear_free_depois.png
   [3]: https://www.flickr.com/photos/aaronw79/7811953832
