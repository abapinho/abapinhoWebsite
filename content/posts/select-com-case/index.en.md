---
title: 'SELECT with CASE'
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
ABAP SQL is becoming more and more interesting and powerful. My latest discovery is the ability to use CASE in SELECT.

<!--more-->

Here's how it goes:

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

It avoids unnecessary auxiliary code and makes things it simpler to read and understand.

Greetings from Abapinho.
