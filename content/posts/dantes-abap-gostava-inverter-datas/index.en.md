---
title: 'ABAP used to like inverting dates'
slug: dantes-abap-gostava-inverter-datas
date: 2017-02-27 09:00:40
tags: []
categories: [artigos]
wordpressId: 3740
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Every day I learn something new in ABAP. Sometimes I'd rather not learn them. Like this one.

Table T056P has a date field. While SELECTing this table using the date as criteria I couldn't get any result even though the code seemed correct. Using SE16N I found that the date range was also not working as expected: it would only should results if the final date was put in the LOW field and the initial date in the HIGH. Bizarre.

<!--more-->

Then I noticed that the field's data element is called DATAB_INV and the domain is DATUM_INV. The domain gave me the hint. It's called "Inverted date".

Using transaction SE17 (which is so old that it didn't even use conversion routines yet) to peek into the table's raw content I noticed that the date values were numbers like 79949176.

After some investigation I found that this date format is (or was...) standard and the ABAP even has some commands to handle it:

CONVERT INVERTED-DATE dat1 INTO DATE dat2.
CONVERT DATE dat2 INTO INVERTED-DATE dat1.

These commands are so obsolete that they're not even allowed in ABAP OO.

But I'm using ABAP OO and I need to use these freak dates. What now?

Well, since SE16N can correctly display the dates even though they're internally stored in an inverted format... I decided to copy the conversion routine's code:


{{< highlight ABAP >}}
METHOD TO_INVERTED_DATE.
  DATA: chdat(8) TYPE c,
        houtput(8) TYPE n.

  r_inverted_date = i_date.

  MOVE i_date TO chdat.
  houtput = '99999999' - chdat.  "Zwischenspeichern in houtput, damit
  r_inverted_date = houtput.

ENDMETHOD.
{{< /highlight >}}

It worked. I just hope I don't run into one of these ever again.

Greetings from Abapinho
