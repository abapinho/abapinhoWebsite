---
title: 'Cria modelos na SE80 arrastando coisas para o código'
slug: modelos-na-se80-arrastando-para-o-codigo
date: 2016-11-14 09:00:26
tags: [sapgui]
categories: [dicas]
wordpressId: 3659
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'Modelo por arrasto'
description: 'Aprende como criar modelos de código arrastando métodos (e outros) com o rato directamente para o código na transacção SE80.'
---
Quando estamos a programar é sempre bom ter formas de acelerar o que estamos a fazer. Uma delas é a geração automática de de padrões de chamadas de métodos e afins.

Conheço 3 formas de o fazer.

<!--more-->

A forma mais clássica de o fazer é utilizando o botão "Modelo", depois escolher a função/método/etc, e o SAP injecta no código um modelo da chamada à função/método/etc. Depois é só completar com as nossas variáveis e já está.

Outra forma, mais sofisticada, é utilizando o CTRL-SPACE, e foi já explicada [aqui][1].

A terceira só funciona na SE80. Tendo à esquerda o método (ou seja o que for), basta arrastá-lo com o rato para o ponto desejado no código e o ABAP Workbench gera automaticamente um modelo para esse método.

Nesta imagem fica um exemplo me que primeiro arrastei o método CONSTRUCTOR e depois o GET_COLUMN, ambos da classe CL_SALV_COLUMNS:

[![se80_drag_n_drop][2]][2]

O Abapinho saúda-vos.

   [1]: {{< ref "modelo-automatico-so-com-ctrl-space" >}}
   [2]: images/se80_drag_n_drop.jpg
