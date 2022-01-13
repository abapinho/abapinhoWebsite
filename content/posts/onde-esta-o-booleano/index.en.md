---
title: 'Where is the boolean?'
slug: onde-esta-o-booleano
date: 2014-12-10 18:12:58
tags: [estilo]
categories: [dicas]
wordpressId: 2937
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
It's not.

But they - the people who make and remake the ABAP itself - are trying to mend this unfortunate situation.

Look at this new functionality:

<!--more-->

You used to have to do this:

{{< highlight ABAP >}}
IF value = 3.
  flag = abap_true.
ELSE.
  flag = abap_false.
ENDIF.
{{< /highlight >}}

Now you can do it like this:

{{< highlight ABAP >}}
flag = BOOLC( value = 3 ).
{{< /highlight >}}

;-)

Greetings from Abapinho.
