---
title: "Let's concatenate"
slug: concatenemos
date: 2015-01-05 09:00:35
tags: [estilo]
categories: [dicas]
wordpressId: 2963
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
We start with two variables:


{{< highlight ABAP >}}
DATA word1 TYPE string.
DATA word2 TYPE string.
DATA: phrase TYPE string.

word1 = ‘this’.
word2 = ‘that’.
{{< /highlight >}}

And we want to concatenate them adding the word "plus" between them and, of course, separate them by space.

<!--more-->

Form 1 (the classic):

{{< highlight ABAP >}}
CONCATENATE word1 ‘plus’ word2 INTO phrase SEPARATED BY space.
{{< /highlight >}}

Form 2, which doesn't leave a space between them:

{{< highlight ABAP >}}
phrase = word1 && ‘ ‘ && 'plus' && ‘ ‘ && word2.
{{< /highlight >}}

Form 3, more far fetched but which separates the words:

{{< highlight ABAP >}}
phrase = word1 && ‘ALT+255‘ && 'plus' && ‘ALT+255‘ && word2.
{{< /highlight >}}

(in which ALT+255 is really pressing ALT and then writing 255)
(it isn't really a space but it looks the same)

Forma 4, the state of the art in concatenation:

{{< highlight ABAP >}}
phrase = | { word1 } plus { word2 } |.
{{< /highlight >}}

Actually, this last one even lets you invoke methods directly:

{{< highlight ABAP >}}
phrase = | { o_book->get_word( 1 ) } plus { o_book->get_word( 2 ) } |.
{{< /highlight >}}

Thank you Ricardo Monteiro for the ALT+255 trick and Sérgio Fraga for showing us the future.
Thank you halfrain for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/halfrain/9259704265
