---
slug: linhas-em-branco
title: Como gostas tu das linhas em branco?
description: Como gostas tu das linhas em branco?
date: 2024-12-30T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Toda a gente usa linhas em branco para melhor organizar o código. Mas onde usar e quantas usar? Falemos disso.

<!--more-->

O Clean ABAP fala nisso.

Por exemplo, diz para [nunca usares mais que uma linha vazia seguida][1] que é um óptimo conselho. E também diz para [não seres obsessivo][2] a espalhar linhas em branco. Por exemplo, isto é má ideia:

```abap
" anti-pattern
METHOD do_something.

  do_this( ).

  then_that( ).

ENDMETHOD.
```

Para quê exagerar nas linhas em branco? Relaxa. Olha como assim é tão mais fácil de ler:

```abap
METHOD do_something.
  do_this( ).
  then_that( ).
ENDMETHOD.
```

Quando eu fazia métodos mais compridos as linhas em branco eram fundamentais para criar uma separação visual entre diferentes partes do algoritmo, e até fazia sentido usar mais do que uma linha para distinguir zonas diferentes. Claro que ainda as uso. Mas agora que sabemos que os métodos devem ser o mais pequenos possível, uso muito menos do que dantes.

Por exemplo, há muita gente que gosta de meter logo uma linha em branco abaixo do `METHOD` e deixar outra linha em branco acima do `ENDMETHOD`. Para quem usa Eclipse ADT como eu, isto acaba por ser tornar confuso porque, como os métodos aparecem uns a seguir aos outros, quando são mais compactos (como o exemplo acima) ficam mais separados visualmente uns dos outros.

O Clean ABAP também diz uma coisa muito sensata: a necessidade de usar linhas em branco pode ser sintoma de que o teu método está a fazer demasiadas coisas, quando deveria fazer [apenas uma][3].

Por exemplo, num método com duas operações de múltiplas linhas, às vezes fica mais fácil distingui-las com uma linha em branco pelo meio:

```abap
METHOD process_customers_and_suppliers.
  SELECT kunnr, name1
    FROM kna1
    INTO TABLE @DATA(customers).

  SELECT lifnr, name1
    FROM lfa1
    INTO TABLE @DATA(suppliers).

  " Etc
ENDMETHOD.
```

Mas em bom rigor este método não é saudável porque está a fazer duas coisas independentes e devia ser separado em dois:

```abap
METHOD get_customers_and_suppliers.
  DATA(customers) = get_customers( ).
  DATA(suppliers) = get_suppliers( ).
  " Etc

METHOD get_customers.
  SELECT kunnr, name1
    FROM kna1
    INTO TABLE @result.
ENDMETHOD.

METHOD get_suppliers.
  SELECT lifnr, name1
    FROM lfa1
    INTO TABLE @result.
ENDMETHOD.
```

Depois disso feito, as linhas em branco deixam de ser necessárias, né?

O Abapinho saúda-vos.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#add-a-single-blank-line-to-separate-things-but-not-more>
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#dont-obsess-with-separating-blank-lines>
[3]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#do-one-thing-do-it-well-do-it-only>
