---
slug: base
title: Usa BASE para não estragares o que já tens
description: Usa BASE para adicionar linhas a tabelas internas
date: 2023-11-06T09:00:00Z
tags: [7.4]
categories: [dicas]
keywords: [abap base]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Dantes usava-se o comands `APPEND` e `INSERT` para adicionar linhas a tabelas internas. Mas agora que o ABAP cresceu, podemos usar `VALUE`, `REDUCE`, `CORRESPONDING`, etc. Mas, e se a tabela interna já tiver linhas e não as quisermos perder?

<!--more-->

Nesse caso recorres ao `BASE`.

```abap
output_lines = CORRESPONDING #( input_lines ).
output_lines = CORRESPONDING #( BASE ( output_lines ) input_lines ).
```

A diferença entre a primeira e a segunda linhas é que, enquanto na primeira o conteúdo de `output_lines` é esmagado na operação, na segunda ele é preservado e as novas linhas resultantes da operação `CORRESPONDING` são adicionadas a seguir às já existentes.

O Luís Rocha sugeriu este tema e enviou-me os seguintes exemplos:

```abap
LOOP AT lines ASSIGNING FIELD-SYMBOL(<line>).
  result = VALUE #(
    BASE result
    sign = 'I' option = 'EQ' high = ''
    ( low = <line>-value ) ).
ENDLOOP.
```

No exemplo ccima vais construíndo um range de forma iterativa. Nota que neste caso em particular se poderia alternativamente ter feito logo um `FOR EACH` no `VALUE`. Mas aí não irias aprender como usar o `BASE`, né?

No exemplo abaixo acrescentas mais umas linhas de HTML a uma tabela que já tem algumas:

```abap
it_html = VALUE #(
  ( |<html>| )
  ( |  <head>| )
  ( |    <meta http-equiv="content-type">| )
  ( |    <script type="text/javascript">| )
  ( |      function onKeyDown(f)| )
  ( |      \{ if(event.keyCode == 13)| )
  ( |         \{ document[f.name].submit();  | )
  ( |         \}| )
  ( |      \}| )
  ( |    </script>| )
  ( |    <style type="text/css">| )
  ).

" (...)

it_html = VALUE #( BASE it_html
  ( |      </style> | )
  ( |  </head> | )
  ( |  <body> | )
).
```

Obrigado Luís Rocha pela sugestão e exemplos.

O Abapinho saúda-vos.
