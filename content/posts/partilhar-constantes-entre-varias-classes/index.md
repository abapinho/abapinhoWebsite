---
title: 'Partilhar constantes entre várias classes'
slug: partilhar-constantes-entre-varias-classes
date: 2013-03-25 09:00:35
tags: [estilo, oo]
categories: [dicas]
wordpressId: 2196
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Imagina que tens uma manada de classes relacionadas as quais partilham entre elas uma manada de constantes. Dizendo a mesma coisa de outra forma, gostavas que todas as classes da manada tivessem acesso de forma simples à manada de constantes.

(Se estás baralhado, fica sabendo que a manada era só para baralhar)

Continuando.

<!--more-->

Uma forma de conseguir isto é declarando as constantes todas (como PROTECTED ou PUBLIC, claro) numa classe superior (que não faz senão isso, declarar constantes) e depois declarar todas as outras classes como herdando dessa superior dessa. Assim todas as classes têm acesso às constantes.

(Afinal aquilo da manada não era só para baralhar. Repara como na etimologia da palavra herdar é partilhada com a palavra inglesa "herd". Herdar, herd, manada, vês? interessante, não?)

Continuando.

Mas nem sempre é possível ter todas as classes a herdar de uma mesma super-classe. Nesse caso apresento-te outra solução bem mais simples, flexível e engenhosa.

Cria um interface, declara as constantes todas nesse interface e depois associa o interface a todas as classes que queres que tenham acesso às constantes.

Que solução tão simples, flexível e engenhosa. Como se quer.

Se não percebeste bem, não vou fazer aqui um exemplo. Aponto-te antes para o exemplo onde o Sérgio Fraga descobriu o engenho: IF_SALV_C_AGGREGATION (na SE24, claro).

Obrigado Sérgio Fraga pela dica.

Obrigado Câmara Municipal de Castelo de Vide pela [foto][1]

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/cm_castelo_vide/
