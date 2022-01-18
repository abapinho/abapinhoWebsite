---
title: 'Create test variants within functions from the debugger'
slug: variantes-de-teste-em-debug
date: 2012-02-20 10:00:42
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1447
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Imagine that you are debugging a transaction, you enter into a function and find something interesting. So interesting that you have to debug it several times. The conventional way is to start the debug of the transaction again from the beginning. How tedious.

But there is a more direct route. When you are debugging a function you can create test data for this function directly from the debugger, using the values with which the function had been called at that time. For instance:

<!--more-->

1\. Debug and enter a function. In this case we entered into DD_SHLP_CALL_FROM_DYNP:

![][1]

2\. Then click on the tools icon highlighted in red in the previous image. An options menu appears:

![][2]

3\. Select "Save parameters as test data (SE37). The following dialog box appears requesting you name the test data variant:

![][3]

Now just go to SE37, press F8 to test the function, click on the "Test Data Directory" button at the top of the screen and you will note with joy that the new variant you have just created in the debugger is there waiting for you.

Now you can directly debug the function without having to debug the entire transaction. Much more practical, don't you think?

Note that this will not work with status-dependent functions, i.e. those that depend on data created by other functions of the same function group. One example of this is the WRITE_FORM function that can only be called after the OPEN_FORM function.

Thanks to Sérgio Fraga for the valuable tip.

Greetings from Abapinho.

   [1]: images/debugger_grava_variante_fm.png (Grava variante de módulo de função 1)
   [2]: images/debugger_grava_variante_fm2.png (Grava variante de módulo de função 2)
   [3]: images/debugger_grava_variante_fm3.png (Grava variante de módulo de função 3)
