---
title: 'Share constants among several classes'
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
Imagine you have a herd of related classes sharing between them a whole bunch of constants. Saying the same thing a different way, would you like all the classes of the herd to have easy access to the bunch of constants?

(If you’re confused, then let me tell you that the “herd” thing was just to baffle you)

Carrying on.....

<!--more-->

One way to achieve this is to declare all the constants (as PROTECTED or PUBLIC, of course) in a higher class (which does nothing more than that, i.e. declare the constants) and then declare all the other classes as inheriting that higher level. This way all the classes have access to the constants.

But it is not always possible to have all the classes inheriting from a single super-class. That’s why I have another solution that is much simpler, more flexible and more resourceful.

Create an interface, declare all the constants in that interface and then associate the interface with all the classes that you want to have access to the constants.

It’s such a simple, flexible and ingenious solution. It’s exactly what is required.

If you didn’t understand, I'm not going to give an example here. Instead, have a look at the example where Sérgio Fraga discovered the trick: IF_SALV_C_AGGREGATION (in SE24, of course).

Thanks Sérgio Fraga for the tip.

Thanks Castelo de Vide Municipal Council for the [photo][1]

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/cm_castelo_vide/
