---
title: 'Como perguntar se a linha existe sem parecer antiquado'
slug: como-perguntar-se-a-linha-existe-sem-parecer-antiquado
date: 2015-04-06 14:08:12
tags: [estilo]
categories: [dicas]
wordpressId: 3063
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Há muito tempo atrás dizias "porreiro pá". Depois começaste a dizer "baril". Depois era "fixe". Hoje dizes "altamente". É importante não te baralhares para não dares mau aspecto.

E como perguntas a uma tabela interna se a linha existe?

<!--more-->


{{< highlight ABAP >}}
DATA: t_kunnr TYPE STANDARD TABLE OF kunnr.
{{< /highlight >}}

Antes perguntavas assim:

{{< highlight ABAP >}}
READ TABLE t_kunnr TRANSPORTING NO FIELDS WITH KEY TABLE_LINE = i_kunnr.
IF sy-subrc = 0.
* Porreiro pá!!!!!
ENDIF.
{{< /highlight >}}

Agora perguntas assim:

{{< highlight ABAP >}}
IF line_exists( t_kunnr[ TABLE_LINE = i_kunnr ] ).
* Altamente!!!!!
ENDIF.
{{< /highlight >}}

Não te baralhes para não dar mau aspecto.

Mas atenção... isto só dá a partir da versão 740.

Obrigado Custódio Oliveira pela dica.

Obrigado Simon Webster pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/12495774@N02/8395825574
