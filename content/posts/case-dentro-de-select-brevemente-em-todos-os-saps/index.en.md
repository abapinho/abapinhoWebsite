---
title: 'CASE inside a SELECT (available soon)'
slug: case-dentro-de-select-brevemente-em-todos-os-saps
date: 2015-07-20 09:00:42
tags: [estilo, sql]
categories: [dicas]
wordpressId: 3162
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Get ready because you'll soon be running into a lot of surprises. ABAP is learning new tricks. Look at this one:


{{< highlight ABAP >}}
CONSTANTS:
  lc_menina TYPE STRING VALUE ‘GIRL',
  lc_menino TYPE STRING VALUE ‘BOY’,
  lc_senhor TYPE STRING VALUE ’GENTLEMAN’,
  lc_senhora TYPE STRING VALUE ‘LADY’.

SELECT nome,  
 CASE
   WHEN sexo_id = ‘M' AND idade < 18 THEN @lc_menino
   WHEN sexo_id = ‘F’ AND idade < 18 THEN @lc_menina
   WHEN sexo_id = ‘M' AND idade >=18 THEN @lc_senhor
   WHEN sexo_id = ‘F’ AND idade >=18 THEN @lc_senhora
 END AS titulo
FROM zpessoa
WHERE pessoa_id = @pessoa_id
INTO CORRESPONDING FIELDS OF @lt_pessoas.
{{< /highlight >}}

You just have to wait for version 7.40.

Thank you Sérgio Fraga for the tip.

Thank you Anil Wadghule for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/anildigital/8782613247
