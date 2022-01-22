---
title: 'Add parameters to standard methods and functions'
slug: acrescenta-parametros-a-metodos-e-funcoes-standard
date: 2016-02-01 09:00:50
tags: [segredo]
categories: [dicas]
wordpressId: 3394
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
We are all aware of SAP implicit enhancements which allow you to add code to the top or bottom of any block of standard code (methods, functions, etc). We've all used it to make a change to a BAPI or other standard piece of code.

But only recently did I find that you can also use these implicit enhancements to add parameters to standard methods and functions.

<!--more-->

While you're in any parameter tab of SE37 or SE24 press the enhancement button (the spiral, the most beautiful SAP icon). You'll get a dialog box asking for the enhancement name. Give it a name or choose an existing one and now you're free to add whatever parameters you like. Look what I did:

![param_extra_em_fm][1]

Notice the new column on the right identifying to which enhancement the parameter belongs to.

The first thing that came to mind was adding missing parameters to a BADI buth then I remembered that, since a BADI is always invoked by standard code this would also have to be changed. Oh well.

And now off you go to add your own parameters to as many standard functions as you can.

Thank you Pierre Ameye for the tip.

Photo: [James Marvin Phelps][2] via [Visual hunt][3] / [CC BY-NC][4]

Greetings from Abapinho.

   [1]: images/param_extra_em_fm.png
   [2]: https://www.flickr.com/photos/mandj98/501413295/
   [3]: https://visualhunt.com
   [4]: https://creativecommons.org/licenses/by-nc/2.0/
