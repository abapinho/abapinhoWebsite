---
title: 'How many includes is a class made of?'
slug: de-quantos-includes-e-feita-uma-classe
date: 2015-02-23 09:00:55
tags: [segredo]
categories: [dicas]
wordpressId: 3002
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
No matter how many times things go around in ABAP, everything ends up in SE38. Even the methods of the ABAP classes are saved in includes.

Sometimes, when there is a dump, it says the problem is, for example, here: CL_MESSAGE_HELPER=============CM001.

<!--more-->

When something like this comes up you know it involves a method of the class CL_MESSAGE_HELPER, but you don’t know which method. But this strange name is actually an include which can be accessed directly via SE38.

If you want to do the opposite, i.e. know which includes are in a method, you can use the following function: SEO_CLASS_GET_METHOD_INCLUDES. Give it the name of a class and it returns the list of methods and the respective include.

Thanks to Ricardo Monteiro for the tip.
Thanks to Rochelle for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/anamnesiss/8457324603
