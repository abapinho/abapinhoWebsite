---
title: 'De pé ó vítimas da fome'
slug: importar-classes-locais
date: 2011-10-11 10:55:54
tags: [estilo]
categories: [dicas]
wordpressId: 1038
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Classes. Sempre as houve entre as pessoas. Mas no ABAP ainda há poucos que as tenham em conta. Se ser classicista na sociedade pode resultar em pedantismo, no ABAP, a única luta de classes é a que alguns travam para que estas sejam mais usadas.

Há dois tipos de classes: as globais e as locais. As globais são criadas na transacção SE24. As locais, que por sinal dou por mim a usar cada vez mais, são feitas declarativamente na SE38. Se soubermos que a nossa classe vai ser usada amiúde, faz sentido criá-la global. Se, pelo contrário, a classe for particular a um programa, não há porque fazer dela um objecto autónomo, bastando assim criá-la local ao programa que a vai usar.

Não é impossível que uma classe local se venha mais tarde a revelar útil noutro sítio. A hipótese mais estúpida, ainda que não inédita, é copiar o código de um programa para outro. Outra hipótese é colocá-la num "include" partilhado pelos vários programas que a usem. Mas mesmo isto também foleiro. Se é usada em mais que um sítio, ficará sempre mellhor como objecto global da SE24.

Os senhores da SAP, pensando já na possibilidade de uma classe local se emancipar, criaram uma ferramenta para isto. Funciona assim:

  1. Vai à SE24

  2. No menu "Tipo de objecto" escolhe a opção "Importar" e depois "classe local de programa"

  3. Escolhe o programa

  4. Aparece uma lista das classes locais desse programa

  5. Escolhe as classes locais que queres tornar globais

  6. Dá-lhes um nome

  7. E pimbas

Se esta ferramenta não te parecer útil, vai comprar o livro ABAP para totós.

O Abapinho saúda-vos.
