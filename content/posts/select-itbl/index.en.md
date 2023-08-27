---
slug: select-itbl
title: SELECTing from an internal table
description: SELECTing from an internal table
date: 2023-08-28T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [select itbl]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Now you can SELECT from an internal table.

<!--more-->

[Really][1]. I also didn't know. I was told last week. You just have to use the new SQL syntax and assign an alias to the internal table. Like this:

```abap
DATA itbl TYPE STANDARD TABLE OF kna1.

SELECT * FROM @itbl AS customers
WHERE land1 = 'PT'
INTO TABLE @DATA(result).
```

How wonderful.

Thank you Pedro Correia Sequeira pela dica.

Thank you Rodney Topor for the [photo][2].

Greetings from Abapinho.

[1]: <https://help.sap.com/doc/abapdocu_752_index_htm/7.52/en-US/abapselect_itab.htm>
[2]: <https://visualhunt.com/re10/2abb82f6>
