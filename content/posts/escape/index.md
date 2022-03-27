---
slug: escape
title: Escapa aos hackers
date: 2022-03-28 09:00:00
tags: [estilo]
categories: [dicas]
keywords: [escape]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Um dos principais pontos fracos de um programa são os dados introduzidos pelos utilizadores.

<!--more-->

Nunca deixes estes dados por tratar pois mais cedo ou mais tarde podem virar-se contra ti. Seja sob a forma de [injecção de SQL][1] ou de outra forma qualquer.

Há vários módulos de função e classes que ajudam nisto, como a `CL_ABAP_DYN_PRG`. Mas provavelmente a forma mais elegante é usar a _string function_ [`escape`][2].

Por exemplo, para garantir que um URL é seguro fazes assim:

```abap
data(unsafe_url) = 'http://abapinho.com/a b c'.
data(safe_url) = escape( val = unsafe_url format = cl_abap_format=>e_url ).
```

Vê os programas `DEMO_ESCAPE_*` para teres uma ideia das várias possibilidades. E vê a classe `CL_ABAP_FORMAT` para conheceres os vários algoritmos de formatação existentes.

Obrigado [Marcin Wichary][3] pela foto.

O Abapinho saúda-vos.

[1]: {{< ref "sql-injection" >}}
[2]: <https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenescape_functions.htm>
[3]: <https://www.flickr.com/people/8399025@N07>
