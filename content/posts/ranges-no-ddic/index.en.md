---
title: 'Create RANGEs in DDIC without getting all wound up'
slug: ranges-no-ddic
date: 2013-03-04 18:26:40
tags: [ddic, estilo]
categories: [dicas]
wordpressId: 2164
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
I am using RANGEs more and more. I use them at breakfast, lunch, and dinner and outside meal times. It’s like soy sauce. A few spoonfuls and everything is instantly tastier.

<!--more-->

But their declaration has always given me some work. For example, I need a ZS_RANGE_ABC structure (with the OPTION, SIGN, LOW, HIGH fields) if I want to use a range of a ZABC field, and then I need an ZT_RANGE_ABC table type that has ZS_ABC as its "row type". Doing all this manually is quite annoying.

I recently found out that DDIC has a feature that simplifies this process. This simplification consists of automatically maintaining the "row type". It works like this:

  1. Let’s take it for granted that you have the ZABC data element;

  2. In SE11, insert the name of the RANGE data type at "Data type”: ZT_RANGE_ABC;

  3. Press F5 to create it and select the "table type" option;

  4. Give it a description or else you cannot advance;

  5. (now here comes the trick!!)

  6. In the "Process" menu select the "Define as range table type" option;

  7. (Kaboom! The screen has changed!)

  8. Add ZABC as the "data element";

  9. Add ZS_RANGE_ABC as the "structured row type" (don’t press "create" yet);

  10. Save;

  11. Have you saved it? Now press "create";

  12. (the DDIC automatically creates a structure that already has SIGN, OPTION, LOW and HIGH!)

  13. Save and activate the structure as you would with any other structure and go back;

  14. Activate the table type and voilà: you now have a ZT_RANGE_ABC table type that is a RANGE of type ZABC.

Very interesting, wouldn’t you say?

Thank you José Faria for showing me this very handy feature.

Greetings from Abapinho.
