---
title: 'Diving into Chaos with the CL_ABAP_RANDOM* classes'
slug: numeros-aleatorios
date: 2012-07-23 09:00:07
tags: []
categories: [dicas]
wordpressId: 1848
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
ABAP programs are all too well behaved, too predictable.

As demiurges, we have a moral obligation to give them a little free will, give them a scent of chaos, show them the trees of life and of knowledge, and in a passage through _kenosis_ , give them free reign to take a bite from the apple. Only in this way will we feel complete and fulfilled, only by this means will we be able to rest on the seventh day.

There is nothing better to achieve this than random numbers.

<!--more-->

Today I will show you some classes that are used to generate pseudo-random numbers: CL_ABAP_RANDOM*

Here is an example of how you can use them to generate whole numbers (almost) at random:


{{< highlight ABAP >}}
DATA: r_random TYPE REF TO cl_abap_random_int,
      calhas1   TYPE i,
      calhas2   TYPE i,
      calhas3   TYPE i,
      seed      TYPE i.

seed = cl_abap_random=>seed( ).

CALL METHOD cl_abap_random_int=>create
  EXPORTING
    seed = seed
    min  = 1
    max  = 10
  RECEIVING
    prng = r_random.

calhas1 = r_random->get_next( ).
calhas2 = r_random->get_next( ).
calhas3 = r_random->get_next( ).

WRITE: seed, calhas1, calhas2, calhas3.
{{< /highlight >}}

As you can see, this indomitable little program makes use of two classes: CL_ABAP_RANDOM_INT to generate the numbers and CL_ABAP_RANDOM to generate the initial seed.

Take note that since the CL_ABAP_RANDOM* classes are all implemented as _singleton_ , you cannot, in other words, blatantly perform CREATE OBJECT. Instead you must use the CREATE method to create instances of them.

Also note that if you don’t define the SEED you are always going to have the same sequence of numbers because the initial seed will always be the same by default. Fortunately, the CL_ABAP_RANDOM class has a SEED () method that gives quite random seeds, which should be sufficient to sow the chaos you need to generate in SAP.

Thanks to [Y.........No logro comprender.......][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/pasteldechoclo/2109468529/
