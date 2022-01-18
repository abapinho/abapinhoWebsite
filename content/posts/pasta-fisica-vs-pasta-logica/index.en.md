---
title: 'Physical vs logical folders'
slug: pasta-fisica-vs-pasta-logica
date: 2017-03-20 09:00:30
tags: []
categories: [dicas]
wordpressId: 3773
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['pastas lógicas']
description: 'Como usar pastas lógicas em vez de pastas físicas para evitar ter de alterar o programa caso um dia alguém decida alterar a localização da pasta.'
---
If in your report called APP1 you need to save a file in a server folder (ex.: /export/app1/) and you don't want it to be a selection screen parameter, how do you do it?

<!--more-->

The simplest is to create a constant with the folder's physical name: /export/app1.

But... what if tomorrow someone decides to change the folder location?

To avoid having to change your program in case this happen you can do this:

  1. create a logical folder in AL1 (ex.: DIR_APP1) pointing at the physical folder (ask your system administrators if you don't have permissions);

  2. store the logical folder name in a program constant;

  3. use the code below to convert the logical folder into the physical folder.


{{< highlight ABAP >}}
DATA: physical_dir TYPE DIRNAME_AL11.

CALL 'C_SAPGPARAM' ID 'NAME' FIELD gc_logical_dir_app1
        ID 'VALUE' FIELD physical_dir.
{{< /highlight >}}

Thank you Nuno Morais for the tip.

Greetings from Abapinho.
