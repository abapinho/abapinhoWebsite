---
title: 'CASE dentro de SELECT (brevemente em todos os SAPs)'
slug: case-dentro-de-select-brevemente-em-todos-os-saps
date: 2015-07-20 09:00:42
tags: [estilo, sql]
categories: [dicas]
wordpressId: 3162
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Prepara-te porque em breve terás muitas surpresas. É que o ABAP está a aprender troques novos. Repara neste:


{{< highlight ABAP >}}
CONSTANTS:
  lc_menina TYPE STRING VALUE ‘MENINA',
  lc_menino TYPE STRING VALUE ‘MENINO’,
  lc_senhor TYPE STRING VALUE ’SENHOR’,
  lc_senhora TYPE STRING VALUE ‘SENHORA’.

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

Só tens de esperar pela versão 7.40.

Obrigado Sérgio Fraga pela dica.

Obrigado Anil Wadghule pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/anildigital/8782613247
