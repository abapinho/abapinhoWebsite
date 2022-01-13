---
title: 'Passei-me ao passar o SY-TABIX por parâmetro'
slug: sy-tabix-por-parametro
date: 2016-12-19 09:00:47
tags: []
categories: [dicas]
wordpressId: 3684
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
No outro dia aconteceu-me uma coisa muito estranha. Estava eu a passar o SY-TABIX como parâmetro para dentro de um método quando reparei que cá fora era 1 mas quando lá chegava dentro era 0.

Muitíssimo bizarro.


{{< highlight ABAP >}}
o_coisificador->que_coisa_bizarra( sy-tabix ).
{{< /highlight >}}

<!--more-->

Ouvia repetidamente gritos de “Porquê?! Porquê?!” dentro do meu cérebro.

Até que se fez luz!

Quando se passa algum campo do SYST por parâmetro tem de se passar por valor e não por referência. Eu estava a passar por referência e lá dentro o ABAP automaticamente limpava o SY-TABIX porque ao entrar no método já não considerava estar dentro de um ciclo.

Bastou ligar o pisco no parâmetro para este ser passado por valor e, alegria, acabou-se o problema.

É lógico mas não é óbvio.

Quem sabe um dia esta dica seja útil a alguém.

O Abapinho saúda-vos.
