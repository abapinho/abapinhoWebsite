---
title: 'I like LIKE'
slug: gosto-do-like
date: 2013-06-17 09:00:16
tags: [estilo]
categories: [dicas]
wordpressId: 2330
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
In the ‘bad old days’ when the ABAP was even more old-fashioned than today, variable statements were all made through LIKE and were referenced to table fields:


{{< highlight ABAP >}}
DATA: V_KUNNR LIKE KNA1-KUNNR.
{{< /highlight >}}

<!--more-->

Then, SAP came to its senses and began to realize the nonsense in this, gradually persuading people to make standardized statements, introducing TYPE:


{{< highlight ABAP >}}
DATA: V_KUNNR TYPE KUNNR.
{{< /highlight >}}

And now that TYPE is such a mainstream tool that it became virtually mandatory when using ABAP OO, LIKE strikes again with a new philosophy. A philosophy I totally support.

If you have a variable and wish to state another auxiliary variable to be used in relation to the first one, the latest craze in ABAP computing style is to resort to LIKE. However, this time, referencing the variable rather than the type:


{{< highlight ABAP >}}
DATA: V_KUNNR TYPE KUNNR,
      V_KUNNR_AUX LIKE V_KUNNR.
{{< /highlight >}}

This makes the code more clear, since only by looking at the data statement we understand the relations between the several variables stated a lot better.

The most common example would be LIKE LINE OF, which has been handled here on Abapinho before:


{{< highlight ABAP >}}
DATA: T_KUNNR TYPE STANDARD TABLE OF KUNNR,
      T_KUNNR_AUX_ LIKE T_KUNNR               " aux table
      S_KUNNR LIKE LINE OF T_KUNNR.           " aux line
{{< /highlight >}}

Thus, whenever you declare auxiliary variables, use LIKE to clarify with which they relate to.

Greetings from Abapinho
