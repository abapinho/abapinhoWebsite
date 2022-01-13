---
title: '<!--:pt-->Um mal que veio por bem<!--:-->'
slug: um-mal-que-veio-por-bem
date: 2010-11-07 03:29:07
tags: []
categories: [historias]
wordpressId: 469
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Era uma vez um cliente com um sistema produtivo com 9 servidores mais rápidos que a própria sombra. Esses 9 servidores eram geridos por 4 administradores de sistema muito bons que os mantinham sempre oleados e a fluírem à velocidade máxima. Um dia tive de desenvolver um carregamento muito complexo que criava milhões de classificações. Quando se começou a testar o programa, constatou-se que algo estava muito lento, lento demais. Na maior parte do tempo o programa estava encalhado à espera de SELECTs sequenciais à tabela INOB, que era gigante. Como o meu programa não usava a INOB estranhámos. Depois de alguma investigação descobriu-se um SELECT desnecessário e ainda por cima mal feito (sem usar nem a chave primária nem um índice) que alguém deixou num user-exit amplamente utilizado. Comentou-se o SELECT e de repente o meu programa ficou centenas de vezes mais rápido. Eu fiquei feliz mas quem ficou mesmo a ganhar foram os administradores de sistema que tiveram um inesperado upgrade grátis a todas as 9 máquinas!

O Abapinho saúda-vos.
