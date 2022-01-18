---
title: 'How to ask if the line exists without seeming  fashioned'
slug: como-perguntar-se-a-linha-existe-sem-parecer-antiquado
date: 2015-04-06 14:08:12
tags: [estilo]
categories: [dicas]
wordpressId: 3063
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Long ago, you used the expression "groovy, man". Later came "great, man". Then there was "cool". Today you say "awesome". It's important not to get confused and not make a fool of yourself.

And how do you ask an internal table if a line exists exists?

<!--more-->


{{< highlight ABAP >}}
DATA: t_kunnr TYPE STANDARD TABLE OF kunnr.
{{< /highlight >}}

In the past you asked like this:

{{< highlight ABAP >}}
READ TABLE t_kunnr TRANSPORTING NO FIELDS WITH KEY TABLE_LINE = i_kunnr.
IF sy-subrc = 0.
* Porreiro pá!!!!!
ENDIF.
{{< /highlight >}}

Now you asked like this:

{{< highlight ABAP >}}
IF line_exists( t_kunnr[ TABLE_LINE = i_kunnr ] ).
* Altamente!!!!!
ENDIF.
{{< /highlight >}}

Get it right to avoid being embarrassed.

But please note that this only works from release 740 on.

Thank you Custódio Oliveira for the tip.

Thank you Simon Webster for the [photo][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/12495774@N02/8395825574
