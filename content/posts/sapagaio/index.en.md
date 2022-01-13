---
title: 'SAParrot'
slug: sapagaio
date: 2012-10-15 09:00:47
tags: [sapgui]
categories: [dicas]
wordpressId: 2004
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Go to SE38 and create a program with the code below. Then turn the computer sound on and press F8.


{{< highlight ABAP >}}
INCLUDE ole2incl.
 
DATA : 
  ole     TYPE ole2_object,
  voz     TYPE ole2_object,
  texto   TYPE string.
 
CREATE OBJECT voz 'SAPI.SpVoice'.
 
texto = 'Olá eu sou o SAP e falo português com sotaque estrangeiro'.
 
CALL METHOD OF voz 'Speak' = ole
   EXPORTING #1 = texto.
{{< /highlight >}}

Note: the parrot not in the photo, just the macaw with which he was talking :)

Thanks to Sérgio Lopes for the tip.
And thanks to [captainsubtle][1] for the photo.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/captainsubtle/4636335123/
