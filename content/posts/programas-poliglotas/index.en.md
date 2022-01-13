---
title: 'Multilingual programs that know what they are talking about'
slug: programas-poliglotas
date: 2011-11-21 10:00:20
tags: [i18n]
categories: [dicas]
wordpressId: 1140
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
SAP is multilingual. But ABAP not always. ABAP does have some ability to learn and speak a few languages, but sometimes the programmers do not let it.

A lot of programmers whack literal texts directly into the program, leaving it forever unable to communicate in multiple languages. I can think of two reasons for shackling a program to just one language:

  * Laziness, the main reason for doing things badly;

  * Legibility. In fact the way to make an ABAP program localizable is to pack it full of text references, like TEXT-001, which can get a bit illegible.

So here is a tip to get the best of both worlds: a localizable program that does not lose legibility:

Instead of being lazy and doing this:

{{< highlight ABAP >}}
WRITE: 'I want to see the aurora borealis'.
{{< /highlight >}}

And instead of being obscure and doing this:

{{< highlight ABAP >}}
WRITE: TEXT-001.
{{< /highlight >}}

Be smart and do this:

{{< highlight ABAP >}}
WRITE: 'I want to see the aurora borealis'(001).
{{< /highlight >}}

Done.

If the text TEXT-001 is defined in the language in which the program is running, this TEXT-001 will be used. Otherwise, the literal text written directly in the program will be used. Thus the code’s legibility is retained, the texts can be translated freely, AND we can be sure that where some text is untranslated, the text stored in the program will appear.

Thanks to Sérgio Lopes for the tip.
(And thanks to [doug88888][1] for the photo.)

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/doug88888/4131175353/
