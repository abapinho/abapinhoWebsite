---
title: 'Get the deepest text of chained exceptions'
slug: texto-mais-profundo-de-cadeia-de-excepcoes
date: 2017-01-16 10:34:04
tags: [estilo, oo]
categories: [artigos]
wordpressId: 3703
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['texto de cadeia de excepções']
description: 'Como conseguir obter automaticamente o texto da excepção mais profunda de uma cadeia de excepções sem que o programa cliente precise de código específico'
---
If you're not already using ABAP Objects you're [chicken][1].

If you use them, I do hope you're following the [best practice][2] of using class exceptions.

And if you're using class exceptions you better understand the best way of using them, particularly the [advantages of chaining them][3].

This said, here's what brings us here today. In the post about [chained exceptions][4] I showed a way to get the text of the deepest exception in the chain by using a WHILE loop:

<!--more-->


{{< highlight ABAP >}}
DATA: text TYPE string,
      o_exp TYPE REF TO cx_root.
(…)
CATCH cx_fruit INTO o_exp.
    WHILE o_exp->previous IS BOUND.
        o_exp = o_exp->previous.
    ENDWHILE.
    text = o_exp->get_text( ).
ENDTRY.
{{< /highlight >}}

But in a scenario of an application with many exceptions, all deriving from the same, you can do something much more interesting:

  1. Create a root exception for the application: ZCX_FRUIT

  2. All the application's exceptions should inherit from this one: ZCX_FRUIT_BANANA, ZCX_FRUIT_PINEAPPLE, etc.)

  3. In the root exception ZCX_FRUIT override method GET_TEXT() and add there the logic which was previously done outside, in the CATCH statement

The ZCX_FRUIT->GET_TEXT() code should be something like this:


{{< highlight ABAP >}}
METHOD GET_TEXT.
  if me->previous is bound.
    result = me->previous->get_text( ).
  else.
    result = super->if_message~get_text( ).
  endif.
ENDMETHOD.
{{< /highlight >}}

You may consider doing the same to method GET_LONG_TEXT() if you're planning on using it.

The code is ever nicer because it's recursive.

And now you no longer need to worry about the WHILE loop when you handle the exceptions. They now know how to take care of themselves. You just need to call GET_TEXT() on a chained exception and you'll always be sure to get the text of the deepest one, which is usually the one better describing what happened.

Note 1: This just makes sense when you don't care for the rest of the exceptions in the chain, which should be the most common scenario. I've needed them for logging purposes in the past. If that's the case, this approach will not work.

Note 2: Unfortunately this technique is not compatible with the command _MESSAGE o_exp TYPE 'E'_. For some reason, it will always give you the text of the top expression. It's a shame.

Photo via [JanDix][5] via [Visualhunt][6]

Greetings from Abapinho.

   [1]: https://abapinho.com/en/2012/10/mariquinhas-pe-de-salsa/
   [2]: https://abapinho.com/en/2015/01/usaras-classes-de-excepcao/
   [3]: https://abapinho.com/en/2015/02/cadeias-de-excepcoes/
   [4]: {{< ref "cadeias-de-excepcoes" >}}
   [5]: https://visualhunt.com/profile/jandix/
   [6]: https://visualhunt.com/
