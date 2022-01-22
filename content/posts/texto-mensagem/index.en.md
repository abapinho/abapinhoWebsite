---
title: 'What does a message say?'
slug: texto-mensagem
date: 2012-01-02 10:00:15
tags: [estilo]
categories: [dicas]
wordpressId: 1298
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Do you want to obtain the text from a message when you only know the ID and the number, but you don’t know how? Find out here:


{{< highlight ABAP >}}
DATA text TYPE string.
MESSAGE ID '00' TYPE 'E' NUMBER '163' WITH '123' INTO text.
{{< /highlight >}}

That’s all it is. Now inside the _text_ variable, you find the following text:

"Client 123 does not exist in the system"

Thanks to [Peteris B][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/flatcat/3555774083/
