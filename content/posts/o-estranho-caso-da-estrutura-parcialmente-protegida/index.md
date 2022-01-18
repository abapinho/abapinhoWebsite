---
title: 'O estranho caso da estrutura parcialmente protegida'
slug: o-estranho-caso-da-estrutura-parcialmente-protegida
date: 2016-12-26 09:00:10
tags: [ddic]
categories: [dicas]
wordpressId: 3691
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'estrutura parcialmente protegida'
description: 'Ao tentar actualizar um registo de uma SORTED TABLE o códgio dá dump porque estava a tentar passar por referência uma estrutura parcialmente protegida.'
---
Estava a tentar actualizar uma linha de uma SORTED TABLE e não estava a conseguir.

<!--more-->

Tudo parecia estar certo porque eu não estava a tentar alterar nenhum campo da chave.
Mesmo assim não funcionava.

Porquê?

O código rezava assim:


{{< highlight ABAP >}}
DATA: t_t001 TYPE SORTED TABLE OF t001 WITH UNIQUE KEY bukrs.
FIELD-SYMBOLS: <s_t001> LIKE LINE OF t_t001.

SELECT * FROM T001 INTO TABLE t_t001.

READ TABLE t_t001 ASSIGNING <s_t001> INDEX 1.

faz_algo( CHANGING cs_t001 =  <s_t001> ).
{{< /highlight >}}

O resultado? Um enorme DUMP!

Primeiro fiquei baralhado mas depois decidi ler com cuidado a explicação detalhada do dump e falava lá claramente em estruturas parcialmente protegidas, como é o caso de ponteiros (vulgo field-symbols) para tabelas SORTED.

Interessante, não?

Então tive esta ideia:


{{< highlight ABAP >}}
READ TABLE t_data ASSIGNING <s_data> INDEX 1.

s_data = <s_data>.        " <<-------- Faço uma cópia dos dados

faz_algo( CHANGING cs_data = s_data ). <--- mando a cópia

DELETE TABLE t_data FROM <s_data> USING KEY primary_key.  <- apago o original da tabela

INSERT s_data INTO TABLE t_data. <- insiro a cópia actualizada
{{< /highlight >}}

Reconheço que não é a coisa mais bonita e eficiente do mundo. Mas que funcionou, funcionou.

Felizmente não precisei de usar esta solução feia e obtusa porque reorganizei o código à sua volta e estes dados foram encapsulados de forma a já não terem de ser passados desta forma.

Mesmo assim, o lado bom de ter esbarrado com isto foi ter ficado familizariado com este conceito de estruturas parcialmente protegidas. E agora tu, querido leitor, também estás.

O Abapinho saúda-vos.
