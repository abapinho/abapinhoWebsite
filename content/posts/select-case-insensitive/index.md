---
slug: select-case-insensitive
title: SELECTs insensível a maiúsculas e minúsculas
description: SELECT insensível a maiúsculas e minúsculas
date: 2025-05-26T09:00:00+01:00
tags: [segredo]
categories: [dicas]
keywords: [select case insensitive]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

No SAP é normal ter tabelas na base de dados com um campo `NAME` e outro `NAME_SEARCH` que é preenchido com exactamente a mesma coisa que o `NAME` mas em maiúsculas.

Depois quando queres fazer pesquisas sem ligar a maiúsculas e minúsculas usas o `NAME_SEARCH`. Já não é preciso fazer isso.

<!--more-->

o ABAP agora deixa-te fazer isto em SQL:

```abap
FINAL(search_pattern) = |%{ to_upper( search_string ) }%|.
SELECT full_name FROM zuser
  WHERE upper( full_name ) LIKE @search_pattern
  INTO TABLE @FINAL(full_names).
```

Loucura? O SQL do ABAP tem evoluído bastante!

O Abapinho saúda-vos.
