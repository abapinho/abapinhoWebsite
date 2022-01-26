---
slug: host-expressions
title: ABAP inside SQL statements
description: host-expressions
date: 2022-01-31T09:01:01Z
tags: [7.4, database]
categories: [tips]
keywords: [host expressions]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Did you know that, if you SAP is recent enough, you can use complex ABAP expressions in the middle of SQL commands?

<!--more-->

Like this, for example:

```ABAP
SELECT name1
FROM kna1
WHERE kunnr =
  @( VALUE kunnr( itbl[ vbeln = i_vbeln ]-kunnr OPTIONAL ) )
INTO result.
```

See?

SAP calls them _host expressions_ and [says][1] they can be used in several places in the SQL command. Even in the `UP TO`.

Thank you Manuel Andrade for the tip.

Foto: [Egisto Sani][2].

Greetings from Abapinho.

[1]: <https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenopen_sql_host_expressions.htm>
[2]: <https://visualhunt.co/a7/4c75ec38>
