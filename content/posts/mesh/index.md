---
slug: mesh
title: Mesh e remexe
description: Análise ao novo comando MESH
date: 2022-08-29T09:00:00+01:00
tags: [7.4]
categories: [article]
keywords: [mesh]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

O ABAP 7.4 trouxe uma série de novidades aplaudidas. Mas de todas, aquela em que menos se fala é o novo tipo de dados `MESH`.
Vamos ver aqui quão injusto é tê-lo votado ao abandono.

<!--more-->

## O que é

O `MESH` permite definir relações entre várias tabelas internas à semelhança do que as chaves externas fazem nas bases de dados relacionais.

## Como

Funciona assim: primeiro defines o tipo de dados, depois crias a `MESH` e popula-a e finalmente usas a dita para aceder a registos das tabelas internas.

### Define-a

O MESH faz referência a tipos de tabela interna e estes têm de estar definidos.

```abap
TYPES ty_t_bkpf TYPE SORTED TABLE OF bkpf
  WITH UNIQUE KEY bukrs gjahr belnr.
TYPES ty_t_bseg TYPE SORTED TABLE OF bseg
  WITH UNIQUE KEY bukrs gjahr belnr buzei.

DATA t_bkpf TYPE ty_t_bkpf.
DATA t_bseg TYPE ty_t_bseg.

TYPES:
  BEGIN OF MESH ty_mesh
    bkpf TYPE ty_t_bkpf ASSOCIATION my_bseg TO bseg
      ON bukrs = bukrs AND gjahr = gjahr AND belnr = belnr,
    bseg TYPE ty_t_bseg ASSOCIATION my_bkpf TO bkpf
      ON bukrs = bukrs AND gjahr = gjahr AND belnr = belnr,
  END OF MESH ty_mesh.
```

Como se pode ver, o `MESH` é mais um tipo de dados. Ah, e em vez do `TYPE` também dá para usar o `LIKE` se quiseres
fazer referência a tabelas internas existentes em vez de a um tipo de dados.

### Instancia-a

Agora vamos declarar a variável e populá-la.

```abap
DATA m TYPE ty_mesh.
m-bkpf = t_bkpf.
m-bseg = t_bseg.
```

### Usa-a

Em vez de usar a chave de uma tabela interna A para aceder à tabela interna B, usa-se a `MESH` para navegar de uma para a outra,
não sendo preciso comparar explicitamente os campos chave, visto que foram já pré-definidos na declaração da `MESH`.

```abap
LOOP AT t_bkpf ASSIGNING FIELD-SYMBOL(<bkpf>).
  LOOP AT m-bkpf\my_bseg[ <bkpf> ] ASSIGNING FIELD-SYMBOL(<bseg>).
    count = count + 1.
    " If we didn't have it we could fetch the BKPF record like this:
    DATA(bkpf2) =  m-bseg\my_bkpf[ <bseg> ].
  ENDLOOP.
ENDLOOP.
```

## Quanto

Mas, perguntas tu, qual é a vantagem de usar a `MESH`?

Bem, para começar o código fica um pouco mais simples e claro visto que a relação entre as tabelas passa a declarar-se apenas uma vez ao
nível da declaração de dados em vez de ter de ser sempre estabelecida de cada vez que se quer aceder aos dados.

Mas a grande cena é mesmo a velocidade. Fiz uns testes (que partilharei em breve) e, se não me tiver enganado,
a `MESH` é cerca de 27% mais rápida do que o clássico `LOOP AT itbl WHERE`. Incrível, não?

Portanto, é começar a usá-la.

Obrigado [Craiyon][1] por imaginares esta foto.

O Abapinho saúda-vos.

   [1]: https://www.craiyon.com/
