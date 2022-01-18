---
title: "You don't encapsulate for it to be reused"
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
Since 1998, I hear some ABAPer colleagues saying that it's not worth encapsulating a particular piece of code in a function or method because it will never be reused again. And then they go to SE38 and create yet another report full of includes.

The idea that you should encapsulate your code for it to be reused by you or by others is one of the biggest misunderstandings of the history of our planet.

<!--more-->

Don't misunderstand me. I love making and reusing reusable code and, every time I identify something that may be reusable, I try to create it as generic and contained and autonomous as possible to simplify its reuse.

Yet, I believe that every piece of code, regardless of its potential to be reused, ought to always be encapsulated and modularized and [liskovized][1] and [uniresponsibilized][2] and [packaged][3] and all the other -eds you can find. Because the main motivation for all this is creating code which is robust, simple to test, resilient to bugs and, above all, easy to maintain.

And the proof is Ratatouille. Anyone who wants to make proper Ratatouille knows that 4 pots must be used. And then you mix everything. And then you eat it. Many will chose to use only one pot, since everything will end up being mixed together anyway. But if you choose to do it this way you'll end up with something that seems to be Ratatouille but really isn't. So, modularization and encapsulation are essential to Ratatouille and, if you use them, it will be so good that everything will be eaten and there will be no left overs to reuse. It is thus proved that you don't encapsulation to reuse.

Photo by [stijn][4].

Greetings from Abapinho.

   [1]: https://en.wikipedia.org/wiki/Liskov_substitution_principle
   [2]: https://en.wikipedia.org/wiki/Single_responsibility_principle
   [3]: https://abapinho.com/en/2014/07/pacotes-2-0/
   [4]: https://www.flickr.com/photos/stijnnieuwendijk/28272343341/
