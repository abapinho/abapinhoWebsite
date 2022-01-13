---
title: 'SELECT com CASE'
slug: select-com-case
date: 2021-10-25 13:20:22
tags: []
categories: [dicas]
wordpressId: 4754
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
O ABAP está a permitir fazer coisas cada vez mais interessantes em SQL. A última que descobri foi que agora se pode usar CASEs.

<!--more-->

Funciona assim:

{{< highlight ABAP >}}
SELECT
  CASE
    WHEN temperature <= 5 THEN 'FREEZING'
    WHEN temperature <= 15 THEN 'COLD'
    WHEN temperature <= 25 THEN 'MILD'
    ELSE 'HOT'
  END AS weather
FROM zweather
WHERE date = sy-datum
INTO @DATA(weather_today).
{{< /highlight >}}

Não só evita código desnecessário como fica mais claro e simples de perceber.

O Abapinho saúda-vos.
