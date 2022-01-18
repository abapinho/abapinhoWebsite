---
title: 'Programas poliglotas que sabem o que dizem'
slug: programas-poliglotas
date: 2011-11-21 10:00:20
tags: [i18n]
categories: [dicas]
wordpressId: 1140
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O SAP é um grande poliglota. Mas o ABAP nem sempre. O ABAP até tem muita facilidade em aprender e falar várias línguas, mas às vezes os programadores não o deixam.

Muitos programadores cinzelam os textos literais directamente no programa, deixando-o irremediavelmente incapaz de comunicar em vários idiomas. Imagino duas razões para se agrilhoar um programa a uma única língua:

  * A preguiça, que é a principal razão para se fazerem as coisas mal feitas;

  * A legibilidade. Realmente a forma de tornar um programa ABAP localizável é pejá-lo com referências a textos, tipo TEXT-001, o que pode torná-lo bastante ilegível.

Então aqui fica uma dica para ter o melhor dos dois mundos: um programa localizável que não perca a legibilidade:

Em vez de seres preguiçoso e fazeres:

{{< highlight ABAP >}}
WRITE: 'Eu quero ver auroras boreais'.
{{< /highlight >}}

E em vez de seres obscuro e fazeres:

{{< highlight ABAP >}}
WRITE: TEXT-001.
{{< /highlight >}}

Sê esperto e faz:

{{< highlight ABAP >}}
WRITE: 'Eu quero ver auroras boreais'(001).
{{< /highlight >}}

E já está.

Se o text TEXT-001 estiver definido na língua em que o programa estiver a correr este TEXT-001 será usado. Caso contrário, o texto literal escrito directamente no programa será usado. Assim mantém-se a legibilidade do código, pode traduzir-se os textos à vontade e ainda por cima temos a certeza de que, mesmo quando faltar traduzir algum texto, mesmo assim aparecerá o texto que está no programa.

Obrigado Sérgio Lopes pela dica.

(E obrigado [doug88888][1] pela foto)

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/doug88888/4131175353/
