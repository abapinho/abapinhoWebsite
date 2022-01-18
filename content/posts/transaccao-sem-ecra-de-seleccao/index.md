---
title: 'Entra numa transacção sem passar pelo ecrã de selecção'
slug: transaccao-sem-ecra-de-seleccao
date: 2017-07-12 09:00:53
tags: [sapgui]
categories: [dicas]
wordpressId: 3815
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['transacção sem ecrã de selecção']
description: 'Descobre o atalho secreto para entrar numa transacção se ter de passar pelo ecrã de selecção, usando os últimos dados guardados.'
---
Mais uma vez o SAPGui me surpreende com mais um atalho obscuro que desconhecia.

Usemos a transacção de visualização de clientes XD03 como exemplo:

  1. Entras no ecrã de selecção da transacção escrevendo lá em cima /NXD03

  2. Introduzes o número do cliente que queres visualizar e carregas em ENTER

  3. Fazes lá o que tens a fazer e depois sais da transacção

  4. Mas... de repente... precisas de ver mais qualquer coisa desse cliente

  5. Em vez de /NXD03 fazes /*XD03

  6. Como que por magia apareces dentro da transacção já mostrando os detalhes do último cliente

É extraordinário como até hoje nunca ninguém me falou nisto.

Também já experimentei na FB03 por isso deve funcionar numa boa parte das transacções funcionais. Infelizmente já constatei que não funciona na que uso mais: SE24, SE38 e SE11. Pena.

Ide e espalhai a notícia!

Obrigado Sérgio Fraga pela dica.

Foto: [Leonard J Matthews][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/mythoto/9720925815/
