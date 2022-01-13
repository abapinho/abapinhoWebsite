---
title: 'Finally, expressions can be concatenated'
slug: expressoes-encadeadas
date: 2013-04-15 09:00:33
tags: [estilo]
categories: [dicas]
wordpressId: 2232
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Finally, the _SAP NetWeaver 7.0 Enhancement Package 2_ makes ABAP start to seem like a normal programming language.

It even allows expressions to be concatenated, no less!

<!--more-->

Admittedly, EhP2 was released a long time ago but there are many projects that still don’t have it. It only came to mine last month. Even among those who already have it, I believe they may have no idea of the countless possibilities now available to them in ABAP.

When you wanted to concatenate expressions in ABAP up to now, it would say: _syntax error_. And then you would have to do things in instalments. For instance:


{{< highlight ABAP >}}
x = a + b
y = c + d
IF x > y.
  z = e + f.
  DO z TIMES.
    CONCATENATE g h INTO i.
  ENDDO.
ENDIF
{{< /highlight >}}

Now (or rather when your project is upgraded to EhP2) you can do the following:


{{< highlight ABAP >}}
IF a + b > c + d.
  DO e + f TIMES.
    i = g && h.
  ENDDO.
ENDIF.
{{< /highlight >}}

And instead of having to do this:


{{< highlight ABAP >}}
DATA o_cl1 TYPE REF TO cl1.
o_cl1 = cl2=>da_cl1( ).
o_cl1->faz_algo( ).
{{< /highlight >}}

you can do:


{{< highlight ABAP >}}
cl2=>da_cl1( )->faz_algo( ).
{{< /highlight >}}

Did you notice above that && takes the place of the infamous CONCATENATE? There are also countless innovations in the processing of _strings_ , but I’ll leave that for another article.

If you still don’t have EhP2, keep on dreaming. If you already have it, keep on experimenting because there are many new possibilities of this kind.

Thanks to KayVee.INC for the [photo][1].

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/kayveeinc/4246957346/
