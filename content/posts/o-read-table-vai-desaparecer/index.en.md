---
title: 'Bye bye READ TABLE'
slug: o-read-table-vai-desaparecer
date: 2015-08-24 09:00:20
tags: [7.4]
categories: [dicas]
wordpressId: 3201
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Pré 7.4:

{{< highlight ABAP >}}
DATA l_idade type i.
READ TABLE lt_folk
  INTO ls_folk WITH KEY name = l_name.
l_age = ls_folk-age.
{{< /highlight >}}

Pós 7.4:

{{< highlight ABAP >}}
data(l_age) = lt_folk[ name = l_name ]-age )
{{< /highlight >}}

Thanks Sérgio Fraga for the tip.

Greeetings from Abapinho.
