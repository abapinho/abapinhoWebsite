---
title: 'Instant RANGE - just add water'
slug: range-instantaneo
date: 2011-07-11 11:07:07
tags: [estilo]
categories: [dicas]
wordpressId: 874
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
I'm going to teach you a magic formula for creating a RANGE that is almost as easy as just adding water.

Imagine that you want to create a RANGE from a database selection to then use it in another SELECT. Obviously you can do it like this:


{{< highlight ABAP >}}
DATA: lt_kunnr TYPE STANDARD TABLE OF kunnr,
        lr_kunnr TYPE RANGE OF kunnr,
        wa_kunnr LIKE LINE OF lr_kunnr.
FIELD-SYMBOLS: <kunnr> LIKE LINE OF lt_kunnr.

SELECT kunnr
  INTO TABLE lt_kunnr
  FROM kna1.

wa_kunnr-sign = 'I'.
wa_kunnr-option = 'EQ'.
LOOP AT lt_kunnr ASSIGNING <kunnr>.
  wa_kunnr-low = <kunnr>.
  APPEND wa_kunnr TO lr_kunnr.
ENDLOOP.
{{< /highlight >}}

And here you used 15 lines of code and 4 variables.
But now look at this alternative:


{{< highlight ABAP >}}
DATA: r_kunnr TYPE RANGE OF kunnr,
      wa_kunnr LIKE LINE OF r_kunnr.

SELECT kunnr AS low
  INTO CORRESPONDING FIELDS OF TABLE r_kunnr
  FROM kna1.

wa_kunnr-sign = 'I'.
wa_kunnr-option = 'EQ'.
MODIFY r_kunnr FROM wa_kunnr TRANSPORTING sign option WHERE low <> ''.
{{< /highlight >}}

Note that right away in the SELECT the field KUNNR is renamed LOW so that it can be go directly in the right place in the RANGE.
Note also how the command MODIFY updates all the lines of the RANGE at the same time using only the fields that we have specified.

Therefore using only 10 lines of code and 2 variables you are left with something more concise, more attractive to look at and much more fun.

Cool, huh? And only advantages.

I use it all the time.

Note that the RANGEs have a 2000-line limit (not sure about this but think I'm right).

Greetings from Abapinho
