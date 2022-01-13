---
title: 'Fair thee well DESCRIBE TABLE. And good riddance.'
slug: lines
date: 2011-11-07 10:20:18
tags: [estilo]
categories: [dicas]
wordpressId: 1122
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
For twelve long years
When I wanted to count
The lines of an itab
I did what everyone does:
`DESCRIBE TABLE itab LINES linhas.`

Until the other day
When (my eyes didn’t deceive me)
I saw something so new,
You wouldn’t believe me:
`LINES( itab ).`

It gives the same outcome
And does away with declaring
The damn variable.

So instead of:


{{< highlight ABAP >}}
DATA: linhas TYPE i.
DESCRIBE TABLE itabl LINES linhas.
IF linhas = 42.
  WRITE 'A tua tabela é a verdade'.
ENDIF.
{{< /highlight >}}

Just do this:


{{< highlight ABAP >}}
IF LINES( itbl ) = 42.
  WRITE 'A tua tabela é a verdade'.
ENDIF.
{{< /highlight >}}

It is proof that
If SAP wanted to
It would make
An effort and ABAP
Would be a cool app.

But apparently it doesn’t care,
And ABAP is crap.

Rubbish poem. Sorry. It is all I could do.

Greetings from Abapinho.
