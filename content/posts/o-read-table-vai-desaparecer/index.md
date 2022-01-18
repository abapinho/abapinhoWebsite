---
title: 'O READ TABLE vai desaparecer!'
slug: o-read-table-vai-desaparecer
date: 2015-08-24 09:00:20
tags: [7.4]
categories: [dicas]
wordpressId: 3201
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Pré 7.4:

{{< highlight ABAP >}}
DATA l_idade type i.
READ TABLE lt_gente
  INTO ls_gente WITH KEY nome = l_nome.
l_idade = ls_gente-idade.
{{< /highlight >}}

Pós 7.4:

{{< highlight ABAP >}}
data(l_idade) = lt_gente[ nome = l_nome ]-idade.
{{< /highlight >}}

Obrigado Sérgio Fraga pela dica.

O Abapinho saúda-vos.
