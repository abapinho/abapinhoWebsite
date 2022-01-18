---
title: 'Não é para reutilizar que se encapsula'
slug: nao-e-para-reutilizar-que-se-encapsula
date: 2019-02-18 09:00:18
tags: [estilo, qualidade]
categories: [artigos]
wordpressId: 4166
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'encapsular'
description: 'A ideia de que a principal razão para encapsular código é poder reutilizá-lo é um dos maiores mal entendidos da história do nosso planeta.'
---
Desde 1998 que oiço colegas ABAPers dizerem que não vale a pena meter determinado código numa função ou método porque não lhes parece que este vá tornar a ser reutilizado. E lá vão continuando na SE38 a fazer os seus reports cheios de includes.

A ideia de que a principal razão para encapsular código é poder reutilizá-lo é um dos maiores mal entendidos da história do nosso planeta.

<!--more-->

Que isto que eu disse não seja também mal entendido pois adoro reutilizar código e, sempre que identifico algo passível de ser reutilizado, tento criá-lo o mais genérico, contido e autónomo possível para simplificar a sua reutlização.

Mas uma coisa não invalida a outra. Todo o código, independentemente de vir a ser reutilizado, deve sempre ser encapsulado e modularizado e [liskovizado][1] e [uniresponsabilizado][2] e [empacotado][3] e todos os outros -ados que se conseguir. Porque a principal motivação para tudo isto é criar código que seja robusto, simples de testar, resiliente a erros e, acima de tudo, fácil de manter.

E a prova disso é o Ratatouille. Quem quiser fazer um Ratatouille de jeito sabe que tem de usar 4 panelas. E no fim mistura-se tudo. E depois come-se. Podes usar só uma panela visto que no fim acaba tudo junto. Se o fizeres acabas com algo que se parece com um Ratatouille mas que não é um Ratatouille. Portanto, a modularização e o encapsulamento são essenciais para o Ratatouille ainda que, se tudo correr bem e este ficar bom, vão comer tudo e não vai sobrar nada para reutilizar no dia seguinte. Está assim provado que uma coisa não tem nada a ver com a outra.

Foto por [stijn][4].

O Abapinho saúda-vos.

   [1]: https://pt.wikipedia.org/wiki/Princ%C3%ADpio_da_substitui%C3%A7%C3%A3o_de_Liskov
   [2]: https://en.wikipedia.org/wiki/Single_responsibility_principle
   [3]: {{< ref "pacotes-2-0" >}}
   [4]: https://www.flickr.com/photos/stijnnieuwendijk/28272343341/
