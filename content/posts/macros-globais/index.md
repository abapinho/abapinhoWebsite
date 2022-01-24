---
title: 'Macros globais'
slug: macros-globais
date: 2011-05-19 18:02:41
tags: [estilo, segredo]
categories: [dicas]
wordpressId: 752
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
[Noutro artigo][1] falámos de macros, uma funcionalidade relativamente obscura e pouco utilizada que tanto pode ser útil como criar uma grande salganhada. Mas estas não são as únicas macros do ABAP. Há outras, ainda mais obscuras e com ainda maior potencial de enfarelhamento de um sistema: as macros globais.

Nem sei se revele isto de tão esquisito que é...
Mas também não me parece bem escondê-lo...
Seja, revelarei.

É possível definir macros a nível global do sistema que podem ser utilizadas em qualquer programa ABAP. Para isso existe a tabela TRMAC:

[![image][2]][3]

A utilização é evidente: NAME é o nome do macro, NUMM é o número da linha e LINE representa uma linha de código. Um macro com 3 linhas deverá ter 3 entradas na tabela TRMAC.

Agora que já sabes da existência destas macros, faz o favor de te esquecer delas. E se para ti o perigo da utilização destes macros não é evidente então tu também és um perigo. Porque é que me dou então ao trabalho de falar sobre esta aberração? Acima de tudo porque isto revela que o famoso comando "BREAK user" não é mais do que uma macro global, como podem ver pela imagem da tabela. Muito curioso.

_(Obrigado ao Bruno Filipa pela dica)_

O Abapinho saúda-vos.

   [1]: {{< ref "macros-velocidade-de-ponta" >}}
   [2]: images/tabela_trmac.png (Tabela TRMAC)
   [3]: images/tabela_trmac.png
