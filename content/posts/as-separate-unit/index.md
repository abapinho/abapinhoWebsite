---
title: 'Chama função remotas AS SEPARATE UNIT'
slug: as-separate-unit
date: 2021-05-17 09:00:43
tags: []
categories: [dicas]
wordpressId: 4646
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['AS SEPARATE UNIT']
description: 'Chama um módulo de função por RFC garantindo que os dados globais não serão reutilizados dando cabo dos resultados.'
---
Imagina que chamas um módulo de função por RFC várias vezes seguidas. Se calhar julgas que cada chamada é completamente independente. Mas não é. O grupo de funções fica carregado em memória no sistema remoto e os mesmos dados globais serão reutilizados em todas as chamadas.

Isto não deverá constituir um problema na maior parte dos casos. Mas haverá cenários em que, por uma razão ou outra, o módulo de funções chamado guarda dados em variáveis globais que podem interferir negativamente com as chamadas subsequentes.

Se quiseres garantir que isto não acontece e que tens dados fresquinhos de cada vez que a função é chamada, acrescenta AS SEPARATE UNIT à chamada. Simples.


{{< highlight ABAP >}}
CALL FUNCTION 'Z_FAZ_MAS_TEM_VARIAVEIS_GLOBAIS'
DESTINATION rfcdest
AS SEPARATE UNIT.
{{< /highlight >}}

O Abapinho saúda-vos.
