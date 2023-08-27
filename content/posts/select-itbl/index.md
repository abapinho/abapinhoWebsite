---
slug: select-itbl
title: SELECT a tabela interna
description: SELECT a tabela interna
date: 2023-08-28T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [select itbl]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Agora dá para fazer SELECT a tabelas internas.

<!--more-->

[A sério][1]. Eu também não sabia. Disseram-me na semana passada. Só tens de usar a nova sintaxe de SQL e atribuir um alias à tabela interna. Assim:

```abap
DATA itbl TYPE STANDARD TABLE OF kna1.

SELECT * FROM @itbl AS customers
WHERE land1 = 'PT'
INTO TABLE @DATA(result).
```

Que maravilha.

Obrigado Pedro Correia Sequeira pela dica.

Obrigado Rodney Topor pela [foto][2].

O Abapinho saúda-vos.

[1]: <https://help.sap.com/doc/abapdocu_752_index_htm/7.52/en-US/abapselect_itab.htm>
[2]: <https://visualhunt.com/re10/2abb82f6>
