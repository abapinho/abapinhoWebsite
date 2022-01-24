---
title: 'SAPagaio'
slug: sapagaio
date: 2012-10-15 09:00:47
tags: [sapgui]
categories: [dicas]
wordpressId: 2004
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Na SE38, e cria um programa com o seguinte código. Depois liga o som do teu computador e faz F8.


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

Nota: o papagaio ficou de fora na foto, só apanharam a arara com que ele estava a conversar :)

Obrigado Sérgio Lopes pela dica.
E obrigado [captainsubtle][1] pela foto.

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/captainsubtle/4636335123/
