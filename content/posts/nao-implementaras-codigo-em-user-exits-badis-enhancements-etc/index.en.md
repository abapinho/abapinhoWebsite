---
title: 'Thou shalt not use direct code in user-exits'
slug: nao-implementaras-codigo-em-user-exits-badis-enhancements-etc
date: 2014-06-26 09:00:47
tags: [estilo, oo]
categories: [boaspracticas]
wordpressId: 2713
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
All code to be put in user-exits (BADIs, enhancements, SMOD, etc.) should be encapsulated.

  * It’s common for an user-exit to include multiple independent parts. Each of these parts should be encapsulated in its own method. Even if it is only one line;

  * This should apply to both new implementations and changes to existing code;

  * A change to existing code should always be seen as an opportunity to organize existing code into methods, since it will have to be tested again anyway;

  * If a class associated to the respective user-exit still doesn’t exist, one should be created;

  * The name of the class should be clearly related to the name of the user-exit. Ex: for user-exit ZXF01U01 uses class Z3F_CL_ZXF01U01.

[https://abapinho.com/en/2012/03/metodos-privados-em-badis/][1]
<{{< ref "melhorar-os-melhoramentos" >}}> (in portuguese)

   [1]: {{< ref "metodos-privados-em-badis" >}} (Implementar métodos privados em BADIs)
