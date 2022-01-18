---
title: 'Pesquisa incremental'
slug: pesquisa-incremental
date: 2016-07-18 09:00:21
tags: [sapgui]
categories: [dicas]
wordpressId: 3584
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['incremental search']
---
Quando quero procurar uma determinada palavra num programa ABAP normalmente uso a função de pesquisa carregando em CTRL-F. E depois vou carregando em NEXT para ir encontrando as várias ocorrências da palavra que procuro.

Mas há outra forma. E não é melhor nem pior. É simplesmente diferente: a pesquisa incremental.

<!--more-->

Para usares essa função carregas em CTRL-I. Vais ver que o cursor do rato fica diferente. Agora, mal introduzes o primeiro caracter da palavra que queres procurar, o cursor do teclado posiciona-se imediatamente no primeiro igual que encontra. E à medida que vais introduzindo mais caracteres a pesquisa vai reposicionando o cursor na primeira ocorrência com todos os caracteres introduzidos. Se carregares novamente no CTRL-I ele salta para a próxima ocorrência, caso exista.

Podes também usar o CTRL-SHIFT-I para pesquisar na direcção oposta.

Experimenta!

O Abapinho saúda-vos.
