---
title: 'Always use message classes in exception classes. '
slug: classes-de-mensagens-nas-classe-de-excepcao
date: 2013-12-16 09:00:49
tags: [estilo, oo]
categories: [dicas]
wordpressId: 2511
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Exception classes let you state multiple texts describing the different possible errors that they can represent.

However, there exists an option to associate it with a message class (SE91). This allows texts to be defined as classic SE91 messages instead of being defined directly in the exception class. And it has advantages.

<!--more-->

At first, defining texts directly in the exception class sounds easier. This is what I used to do, up until recently, when I discovered the benefits of the association between the two.

For example, instead of having to use the GET_TEXT() method, put the result in a _string_ and then doing a MESSAGE of this string, you can use the exception’s instance directly with the MESSAGE command. Isn't this great?

In other words, instead of:


{{< highlight ABAP >}}
DATA: text TYPE string.
TRY.
    RAISE EXCEPTION TYPE zcx_abapinho.
  CATCH zcx_abapinho INTO o_exc.
    text = o_exc->get_text( ).
    MESSAGE text TYPE 'I'.
ENDTRY.
{{< /highlight >}}

You can just do this:


{{< highlight ABAP >}}
TRY.
    RAISE EXCEPTION TYPE zcx_abapinho.
  CATCH zcx_abapinho INTO o_exc.
    MESSAGE o_exc TYPE 'I'.
ENDTRY.
{{< /highlight >}}

This happens because when you associate an exception class with a message class, SAP automatically adds the interface _IF_T100_MESSAGE_ to the class, thereby allowing this convenient additional feature.

Another advantage is that you can continue to define errors like you always have: using SE91 message classes, thereby keeping things consistent.

Thanks to Sergio Aguirre for the [photo][1].

Greetings from Abapinho

   [1]: https://www.flickr.com/photos/sergiodjt/3928105188/
