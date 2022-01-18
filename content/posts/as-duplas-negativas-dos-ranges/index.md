---
title: 'As duplas negativas dos RANGEs'
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
Os RANGEs têm propriedades interessantes.

<!--more-->

Por exemplo, estas duas linhas parecem a mesma coisa mas não são:

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

Marado, né?

Ontem cruzei-me com outro tipo de dupla negação bizarra no qual nunca tinha pensado. Quando usamos um RANGE como critério no WHERE de um SELECT e este está vazio, o critério devolve sempre TRUE. É contra-intuitivo porque o correcto seria dar FALSE (em rigor o valor a comparar não está no RANGE) mas dá imenso jeito que assim seja. O RANGE vazio funciona como um _wildcard_. Ok.

Mas, e se se usar o NOT assim:

{{< highlight ABAP >}}
DATA r TYPE RANGE of kunnr.

SELECT * FROM kna1 INTO TABLE @data(t)
WHERE kunnr NOT IN r.
{{< /highlight >}}

Portanto, o RANGE está vazio e por isso logicamente que qualquer KUNNR não se encontra lá e como tal o NOT IN r deveria dar TRUE. Mas, como o RANGE vazio funciona como _wildcard_ e devolve TRUE quando deveria devolver FALSE,... a negação devolve FALSE quando deveria devolver TRUE. E ainda bem. Acho eu...

O Abapinho saúda-vos.
