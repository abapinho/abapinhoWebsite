---
slug: inner-join-itbl
title: INNER JOIN em vez de FOR ALL ENTRIES
description: Se o SELECT é possível, então e o INNER JOIN?
date: 2023-10-30T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [INNER JOIN itbl]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Há uns tempos [mostrei-te][1] que podias fazer SELECT a uma tabela interna. E no outro dia perguntei-me: se isso é possível, não será então também possível fazer INNER JOINs?

<!--more-->

E não é que sim?

```abap
SELECT kunnr, name1
FROM kna1
INNER JOIN @itbl AS customers ON customers~kunnr = kna1~kunnr
INTO TABLE @DATA(output).
```

E cá está. A única coisa que tens de fazer é dar um nome à tabela fazendo `@itbl AS customers`.

Isto é uma alternativa ao `SELECT FOR ALL ENTRIES`. Assim de repente fico com a sensação de que o `INNER JOIN` será sempre melhor mas não tenho a certeza.

Porque é que me parece melhor? Porque, [de acordo com a SAP][2], o `FOR ALL ENTRIES` executa o `SELECT` para cada linha da tabela interna, correndo-o tantas vezes quantas linhas existirem na tabela interna. Já no caso do `INNER JOIN`, a tabela interna é toda enviada para a base de dados de uma só vez e depois é usada como se fosse uma tabela de base de dados.

E deixas de ter o stress de o `SELECT` dar asneira se a tabela interna estiver vazia.

Além disso, o `FOR ALL ENTIES` tem a limitação chata de que, no `WHERE`, o tipo de dados da variável tem de ser igual ao tipo de dados do campo. Por alguma razão no `INNER JOIN` isso já não é necessário.

Serão mesmo só vantagens ou estará a escapar-me alguma coisa e há desvantagens?

Obrigado Silk Road Collection pela [foto][3].

O Abapinho saúda-vos.

[1]: {{< ref "select-itbl" >}}
[2]: <https://help.sap.com/doc/abapdocu_752_index_htm/7.52/en-US/abenwhere_logexp_itab.htm>
[3]: <https://visualhunt.com/f7/photo/4886903818/dfe17b5198/>
