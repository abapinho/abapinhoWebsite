---
slug: eclipse-adt-rename
title: No Eclipse renomeias automaticamente
description: No Eclipse renomeias automaticamente
date: 2024-05-06T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT rename]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Quem ainda programa de forma monolítica não sente tanta necessidade disto. Mas, quem usa múltiplas classes com múltiplos métodos sabe que é normal (e até desejável) mudar de ideias em relação ao nome destas coisas. As ideias não nascem já acabadas na nossa cabeça.  Idealmente, o código é moldável e dá para ir moldando até encontrarmos a forma desejada.

<!--more-->

## No SAPGUI

Mas o SAPGUI não deixa mudar o nome a quase nada. A única forma é fazer uma cópia com o novo nome, depois ir mudar manualmente todos os sítios que lhe façam referência e finalmente apagar o antigo. Não só é trabalhoso como perigoso. Não dá vontade.

No SAPGUI o código é como o gesso. Seca rápido e depois de secar, se lhe mexeres parte-se.

## No Eclipse ADT

Classes, métodos, parâmetros e variáveis podem ser renomeados de forma totalmente automática. O Eclipse encontra e renomeia automaticamente todas as referências. Tens a opção de rever as alterações que serão feitas mas tipicamente nem é preciso porque simplesmente funciona. Depois do nome renomeado, todos os objectos envolvidos são activados. Podia ser melhor pois infelizmente ainda não dá para renomear objectos do DDIC como elementos de dados, tabelas e etc.

No Eclipse ADT o código é como plasticina. Podes sempre mudar de ideias e a qualquer momento dar-lhe uma nova forma.

Esta funcionalidade é, para mim, razão suficiente para optar pelo Eclipse ADT em vez do SAPGUI. Utilizo-a diariamente, várias vezes ao dia. Bem-hajas Eclipse ADT por ela.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

Obrigado pela [foto][1].

O Abapinho saúda-vos.

[1]: <https://pngimg.com/image/48754>
