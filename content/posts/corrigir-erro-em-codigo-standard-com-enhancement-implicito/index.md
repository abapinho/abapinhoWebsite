---
title: 'Corrigir erro em código standard com enhancement implícito'
slug: corrigir-erro-em-codigo-standard-com-enhancement-implicito
date: 2016-03-14 09:00:57
tags: [enhancements]
categories: [dicas]
wordpressId: 3488
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['enhancement']
---
Descobriste um bug num FORM (ou Função ou método) standard:


{{< highlight ABAP >}}
FORM EQUAL_VALUE CHANGING W_DATE TYPE SYDATUM.
  W_DATE = SY-DATUM - 1.
ENDFORM.
{{< /highlight >}}

Reportaste o erro à SAP mas eles ainda devem demorar a responder e tu precisas da correcção urgentemente.

Tens de agir.

Sem demora usas o enhancement implícito do início do código para substituir o código original pelo teu (até a correcção chegar, claro):


{{< highlight ABAP >}}
FORM EQUAL_VALUE CHANGING W_DATE TYPE SYDATUM.
ENHANCEMENT...
* Enquanto no código SAP standard estiver isto: W_DATE = SY-DATUM - 1.
  W_DATE = SY-DATUM - 2.
  EXIT. "salta fora
ENDENHANCEMENT
W_DATE = SY-DATUM - 1.
ENDFORM.
{{< /highlight >}}

Certo, não é elegante. Mas safa.

Obrigado Pierre Ameye pela dica.

Obrigado Sherri Lynn Wood pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/sherriwood/4726344709
