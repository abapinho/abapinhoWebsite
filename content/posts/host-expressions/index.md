---
slug: host-expressions
title: ABAP no meio de comandos SQL
description: host-expressions
date: 2022-01-31T09:01:01Z
tags: [7.4, database]
categories: [dicas]
keywords: [host expressions]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Sabias que, se o teu SAP for minimamente actual, podes usar expressões complexas em ABAP no meio de comandos SQL?

<!--more-->

Por exemplo assim:

```ABAP
SELECT name1
FROM kna1
WHERE kunnr =
  @( VALUE kunnr( itbl[ vbeln = i_vbeln ]-kunnr OPTIONAL ) )
INTO result.
```

Topas?

A SAP Chama-lhe _host expressions_ e [diz][1] que podem ser usadas em vários sítios do comando SQL. Até no `UP TO`.

Obrigado Manuel Andrade pela dica.

Foto: [Egisto Sani][2].

O Abapinho saúda-vos.

[1]: <https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenopen_sql_host_expressions.htm>
[2]: <https://visualhunt.co/a7/4c75ec38>
