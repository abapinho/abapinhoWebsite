---
title: 'Stand up, all victims of oppression'
slug: importar-classes-locais
date: 2011-10-11 10:55:54
tags: [estilo]
categories: [dicas]
wordpressId: 1038
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Classes. They have always existed among people. But there are still few who take them into consideration in ABAP. While being a supporter of classes in society can result in pedantry, the only class struggle in ABAP is that some fight for them to be used more.

There are two types of classes: global and local. The global ones are created in the SE24 transaction. Local classes, which by the way I find myself using more and more, are done declaratively in SE38. If we know that our class is going to be frequently used it makes sense to create it globally. If, on the other hand, the class is specific to a program, it is not worth making it an autonomous object, it just needs to be built locally for the program that is going to use it.

It is not impossible that a local class may later on prove to be useful elsewhere. The stupidest option, though not unheard of, would be to copy the code from one program to another. Another possibility is to insert it in an "include" shared by the various programs using it. But even this is also shoddy. If it is used in more than one place then it will always be better as a global object of SE24.

The people at SAP have already covered the possibility of a local class emancipating itself, and they have created a tool for this. It works as follows:

  1. Go to SE24

  2. Select the "Import" option and then "local class in program" in the "Object type" menu

  3. Select the program

  4. A list of local classes of that program appears

  5. Select the local classes you want to make into global classes

  6. Give them a name

  7. And voilá!

If you don’t think this tool is useful, then go and buy the ABAP for Dummies book.

Greetings from Abapinho.
