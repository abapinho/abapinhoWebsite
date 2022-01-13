---
title: 'A comment on comments'
slug: comentario-sobre-comentarios
date: 2018-11-26 09:00:19
tags: [estilo]
categories: [dicas]
wordpressId: 4120
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
We learn in school that all code should have comments. Then, in real life, we find that not everyone was paying attention to what was said in school. As a consequence, most code is obscure and without proper comments.

I was always careful to comment every relevant step of my code, specially the parts which are obscure or not self-explanatory.

But since I recently read [Uncle Bob][1]'s _[Clean Code][2]_ , my opinion on this changed. Today I believe that the less comments the better. And yet, I don't see this as contradictory to what I used to think.

<!--more-->

The logic I'm now adopting is: whenever I feel that a comment is needed, that means something needs to be encapsulated in a method. Let me show it to you.

This is how I used to do it:

{{< highlight ABAP >}}
METHOD process_clients.
  DATA: t_kna1 TYPE STANDARD TABLE OF kna1.
  FIELD-SYMBOLS: <s_kna1> LIKE LINE OF t_kna1.

* Select clients
  SELECT kunnr name1 
    INTO CORRESPONDING FIELDS OF TABLE t_kna1 
    FROM kna1
    WHERE kunnr IN r_kunnr.

* Display clients
  LOOP AT t_kna1 ASSIGNING <s_kna1>.
    WRITE \ <s_kna1>-name.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

And this is how I do it now:

{{< highlight ABAP >}}
METHOD process_clients.
  display_clients( select_clients( r_kunnr ) ).
ENDMETHOD.
{{< /highlight >}}

And then I create these two new methods:

{{< highlight ABAP >}}
METHOD select_clients.
  SELECT kunnr name1 
    INTO CORRESPONDING FIELDS OF TABLE rt_kna1 
    FROM kna1
    WHERE kunnr IN r_kunnr.
ENDMETHOD.

METHOD display_clients.
  FIELD-SYMBOLS: <s_kna1> LIKE LINE OF it_kna1.
  LOOP AT it_kna1 ASSIGNING <s_kna1>.
    WRITE \ <s_kna1>-name.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

As you can see, the code in these 3 methods is now self-explanatory and any comment is now unnecessary.

Thanks to this approach, nowadays my mode has much less comments and yet, is much easier to understand. I still use comments: whenever I need to explain how an algorithm is working, why I took a specific approach or whenever I find that some extra context is helpful.

I still hear a lot of people saying that a method only makes sense when it is going to be reused. Nonsense. And I still hear a lot of people saying a method with just one line of code is not worth it. More nonsense.

Greetings from Abapinho.

   [1]: https://en.wikipedia.org/wiki/Robert_C._Martin
   [2]: https://www.goodreads.com/book/show/3735293-clean-code
