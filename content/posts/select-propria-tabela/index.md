---
title: 'SELECT comparando 2 campos da própria tabela'
slug: select-propria-tabela
date: 2013-11-04 09:00:00
tags: [ddic, segredo, sql]
categories: [dicas]
wordpressId: 2473
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Esta dica é simples e rápida mas aposto 200$482 em como poucos a sabem.

<!--more-->

Como usar campos da própria tabela que está a ser seleccionada para filtrar os resultados da selecção:


{{< highlight ABAP >}}
DATA: cnt TYPE i.

SELECT COUNT( * )
       FROM kna1
       INTO cnt
       WHERE telf1 = kna1~telfx.

WRITE cnt.
{{< /highlight >}}

Neste SELECT obtemos todos os clientes cujo fax é igual ao telefone.

Sabias? Já tinhas feito isto?

Obrigado Rui Pina pela dica.

Obrigado a Kendra pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/63614902@N00/1389081153
