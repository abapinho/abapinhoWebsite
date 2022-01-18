---
title: 'Copy a Code Inspector variant to another system'
slug: copiar-variante-do-code-inspector
date: 2017-05-08 09:00:09
tags: [qc, sapgui]
categories: [dicas]
wordpressId: 3808
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'copiar variante do code inspector'
description: 'Há uma forma de exportar variantes do Code Inspector para as poder importar noutro sistema. Aprende neste artigo como se faz.'
---
In my current customer, I have three development systems. There used to be only one. And that's where I customized and fine tuned the Code Inspector_ variant I use to run _Abap Test Cockpit_.

When the other two appeared, before manually copying the variant into them, I decided to investigate a little bit. Much to my surprise, I found in GitHun project [upDOWNci][1] which does exactly what I needed: export and import _Code Inspector_
Now, copying the variant was a piece of cake.

Thank you, [Lars][2] for making this small but useful tool. Actually, thank you for the dozens of useful tools you've already given us. They're quite impressive.

Greetings from Abapinho.

   [1]: https://github.com/larshp/upDOWNci
   [2]: https://github.com/larshp
