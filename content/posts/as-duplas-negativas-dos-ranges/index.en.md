---
title: 'The RANGEs double negatives'
slug: as-duplas-negativas-dos-ranges
date: 2021-07-26 09:00:15
tags: [segredo]
categories: [artigos]
wordpressId: 4712
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['NOT IN RANGE']
description: 'As duplas negativas de um RANGE são confusas. Que valor devolve o NOT IN range quando esse RANGE está vazio? TRUE como é lógico? Ou FALSE como é óbvio?'
---
RANGEs have interesting properties.

<!--more-->

Take these two lines as an example. They look the same but they behave differently:

Sign
| Option
| Low

---|---|---

I
| NE
| X

E
| EQ
| X

Crazy, right?

Yesterday I bumped into yet another weird double negative which I had never thought about. When using a RANGE as a criteria in a SELECT WHERE and the range is empty, the criteria will always return TRUE. It is counter-intuitive because the mathematically correct would be FALSE (after all, the value is not in the range), but the way it behaves is very convenient as we all know. An empty RANGE behaves like a _wildcard_. Ok. Fair enough.

But, what if we add a NOT:

{{< highlight ABAP >}}
DATA r TYPE RANGE of kunnr.

SELECT * FROM kna1 INTO TABLE @data(t)
WHERE kunnr NOT IN r.
{{< /highlight >}}

The RANGE is empty so we're sure none of the KUNNRs will be there so, mathematically speaking, it should always return TRUE. But, since the empty RANGE works as a _wildcard_ and returns TRUE when it should return FALSE,... its negative will return FALSE when it should return TRUE. And this is good. I guess...

Greetings from Abapinho.
