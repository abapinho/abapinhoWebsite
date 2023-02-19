---
slug: exception-parents
title: Os 3 pais das excepções
description: Há 3 pais possíveis para as excepções
date: 2023-02-20T09:00:00Z
tags: []
categories: [artigos]
keywords: [cx_static_check]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

As excepções OO têm sempre de ter um pai. Têm sempre de herdar de alguém. E o ABAP dá 3 hipóteses, cada uma tratada de forma diferente pelo compilador.

<!--more-->

No topo dos topos está a `CX_ROOT`. Não é suposto herdar directamente dela mas sim de uma das suas 3 filhas:

- `CX_STATIC_CHECK`
- `CX_NO_CHECK`
- `CX_DYNAMIC_CHECK`

![3 parents UML Class diagram][1]

## CX_STATIC_CHECK

Usa-a em todas as excepções que é razoável acontecerem e poderem ser tratadas pelo receptor. Tem de ser apanhada ou declarada na interface dos métodos. Na dúvida herda desta.

```abap
CLASS zcx_dev1_file_not_found DEFINITION INHERITING FROM cx_static_check.

METHODS read_file
  IMPORTING
    file_name_entered_by_user TYPE string
  RAISING
    zcx_dev1_file_not_found.
```

## CX_NO_CHECK

Usada em casos realmente imprevistos e irrecuperáveis. Não pode ser declarada nas interfaces dos métodos. Aparece em classes de excepção lançadas pelo standard e pelo próprio ABAP mas nunca encontrei um cenário para a usar num programa Z.

```abap
CLASS cx_out_of_memory DEFINITION INHERITING FROM cx_no_check.

METHODS create_guid
  RETURNING
    VALUE(result) TYPE /bobf/conf_key.
```

## CX_DYNAMIC_CHECK

Tem a particularidade de poder ser propagada pelo método para quem o chamou sem ser declarada sua interface. É interessante para cenários em que quem chama o método está ciente da possibilidade da excepção acontecer mas tem o poder de evitá-la. Este tipo de excepção é muito usado nas frameworks de Java. A ideia é interessante mas em ABAP ainda nunca encontrei cenários em que sentisse ter vantagem em usá-la em vez da `CX_STATIC_CHECK`. É bom que exista para não ter de declarar todas as excepções que são lançadas pelo standard. O exemplo clássico é a divisão por zero:

```abap
" Nota como a excepção não é declarada na interface
METHODS divide
  IMPORTING
    a TYPE f
    b TYPE f.

METHOD divide.
  result = a / b.
ENDMETHOD.

METHOD client.
  TRY.
      divide(
        EXPORTING
          a = a
          b = b ).
    CATCH cx_sy_zerodivide.
      WRITE / 'Infinity unlocked!'.
  ENDTRY.
ENDMETHOD.
```

## Conclusão

É importante saber que existem as 3 e entendê-las. Mas na práctica, a não ser que tenhas uma muito boa razão, usa sempre a `CX_STATIC_CHECK` que é a que a `SE24` propõe por defeito.

Foto por [ilhu industries][2].

O Abapinho saúda-vos.

[1]: images/uml-3-parents.png
[2]: <https://visualhunt.co/a7/1e878ec4>
