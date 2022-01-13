---
title: 'Writing money without any decimal worries '
slug: escrever-dinheiro-sem-preocupacoes-decimais
date: 2013-05-13 09:00:50
tags: [estilo]
categories: [dicas]
wordpressId: 2272
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Some people read the TCURX to find out the number of decimal places of a CURRENCY when they need to write a money field to an alphanumeric variable.

Are you one of those people? Don’t be.

<!--more-->

You can’t, of course, simply assume that all currencies have two decimal places. Look at Japan, which doesn’t have any at all. Or the defunct Escudo, which also had none. So, if you’re like that person described above, you go to TCURX to see if your CURRENCY is there. And if it is, you save the number of decimal places in the CASAS_DECIMAIS variable. If it isn’t, you assume it has two decimal places. Then you do:


{{< highlight ABAP >}}
WRITE money TO alphanumeric DECIMALS casa_decimais.
{{< /highlight >}}

And that sees you right.

But it’s not pretty. And it’s laborious.

Why not do something like:


{{< highlight ABAP >}}
WRITE money TO alphanumeric CURRENCY currency.
{{< /highlight >}}

It's prettier, cleaner and always comes out right. Because SAP does the work for you.

Thanks to Pierre Ameye for the tip.

Greetings from Abapinho.
