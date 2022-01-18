---
title: 'Fix bug in SAP standard using an implicit enhancement'
slug: corrigir-erro-em-codigo-standard-com-enhancement-implicito
date: 2016-03-14 09:00:57
tags: [enhancements]
categories: [dicas]
wordpressId: 3488
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'enhancement'
---
You just found a bug in a standard FORM (or FM or METHDO):


{{< highlight ABAP >}}
FORM EQUAL_VALUE CHANGING W_DATE TYPE SYDATUM.
  W_DATE = SY-DATUM - 1.
ENDFORM.
{{< /highlight >}}

You report the error to SAP but you know it will take them several days, weeks or months to publish a correction. And you need it corrected right now.

You decide to act.

So you use the implicit enhancement at the start of the FORM to replace the standard code with your own (just until the correction arrives, of course):


{{< highlight ABAP >}}
FORM EQUAL_VALUE CHANGING W_DATE TYPE SYDATUM.
ENHANCEMENT...
* While the SAP standard says: W_DATE = SY-DATUM - 1.
  W_DATE = SY-DATUM - 2.
  EXIT. "salta fora
ENDENHANCEMENT
W_DATE = SY-DATUM - 1.
ENDFORM.
{{< /highlight >}}

I know, it's not elegant. But you just solved your urgent problem.

Thank you Pierre Ameye for the tip.

Thank you Sherri Lynn Wood for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/sherriwood/4726344709
