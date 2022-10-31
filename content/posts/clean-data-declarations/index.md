---
slug: clean-data-declarations
title: Declarações de dados limpas
description: Segue as regras do Clean ABAP quando também nas declarações de dados
date: 2022-11-07T09:00:00Z
tags: [estilo, cleanabap]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Quando escreveres código deves estar sempre preocupado com quão fácil será mantê-lo. Isso é particularmente importante nas declarações de variáveis. E é tão simples de aplicar.

<!--more-->

## Feio, porco e mau de manter

Repara nesta _very typical_ declaração de dados:

```abap
DATA: customers TYPE STANDARD TABLE OF kna1,
      counter   TYPE i.
```

Agora imagina que precisas de adicionar uma terceira variável chamada `grand_total` do tipo `f`:

```abap
DATA: customers   TYPE STANDARD TABLE OF kna1,
      counter     TYPE i,
      grand_total TYPE f.
```

Devido à forma pouco limpa como as variáveis estão aqui declaradas, embora tenhas apenas acrescentado uma variável nova, viste-te obrigado a mexer nas outras duas:

- Substituiste o ponto por vírgula na linha da `counter` pois o comando já não termina aí;
- Indentaste o `TYPE` nas duas linhas acrescentando mais 2 espaços para os TYPEs ficarem todos alinhados.

Parece que não é nada de especial mas, quando alguém comparar versões, essas linhas vão aparecer como alteradas embora não tenham realmente sido alteradas de forma significativa.

## Olha só que ABAP limpinho

A forma de resolver isso é seguir duas regras do Clean ABAP:

- [Do not chain up-front declarations][1]
- [Don't align type clauses][2]

Seguindo estas duas regras temos então isto, que é menos comum em ABAP mas muito mais correcto:

```abap
DATA customers TYPE STANDARD TABLE OF kna1.
DATA counter TYPE i.
```

Assim, quando acrescentarmos a nova declaração, não precisamos de tocar nas linhas já existentes:

```abap
DATA customers TYPE STANDARD TABLE OF kna1.
DATA counter TYPE i.
DATA grand_total TYPE f.
```

Mais limpinho, topas?

Isto sem nunca esquecer que, sempre que possível, é melhor declarar as variáveis _inline_ apenas no momento em que são usadas em vez de à cabeça, como o Clean ABAP também sugere [aqui][3].

O Abapinho saúda-vos.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#do-not-chain-up-front-declarations>
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#dont-align-type-clauses>
[3]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-inline-to-up-front-declarations>
