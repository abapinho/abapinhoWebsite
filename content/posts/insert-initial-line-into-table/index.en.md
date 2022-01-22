---
title: 'INSERT and APPEND with ASSIGNING FIELD-SYMBOL'
slug: insert-initial-line-into-table
date: 2012-11-05 09:00:11
tags: [estilo]
categories: [dicas]
wordpressId: 2038
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
The harsh truth, at all costs, is that structures are out of date. Nowadays FIELD-SYMBOLS are in.

When you make a LOOP to an internal table of course that you also [use ASSIGNING FIELD-SYMBOL instead of INTO Structure][1],correct?

But what was screwing everything over was APPEND and INSERT. I did not know how to use a structure to add records

<!--more-->

Because of that, until a few days ago, I was still doing something like this:


{{< highlight ABAP >}}
DATA: T_ABC TYPE STANDARD TABLE OF ZABC,
      W_ABC LIKE LINE OF T_ABC.

W_ABC-XYZ = 'Olá'.
APPEND W_ABC TO T_ABC.
{{< /highlight >}}

Which was a pity because, there you go, using structures...well...it's like still having Windows 7 when Windows 8 is already out more than a week ago. Or like still listening to Madonna now that Lady Gaga exists. Or even listening to Lady Gaga now that [Die Antwoord][2] exists.

But everything changed when recently Sérgio Fraga showed me that after all you can use FIELD-SYMBOLS with INSERT and APPEND:


{{< highlight ABAP >}}
DATA: T_ABC TYPE STANDARD TABLE OF ZABC.
FIELD-SYMBOLS: <ABC> LIKE LINE OF T_ABC.

INSERT INITIAL LINE INTO TABLE T_ABC ASSIGNING <ABC>.
<ABC>-XYZ = 'Olá'.
{{< /highlight >}}

Thank you Sérgio Fraga because this is so good, and I mean so good, that it feels like finding a table needed for register/records to be inserted to go and use this right now.

Thank you [mscaprikell][3] for the photo.

Greetings from Abapinho.

   [1]: {{< ref "assigning-vs-into" >}}
   [2]: https://www.youtube.com/watch?v=AIXUgtNC4Kc
   [3]: https://www.flickr.com/photos/mscaprikell/18972629/
