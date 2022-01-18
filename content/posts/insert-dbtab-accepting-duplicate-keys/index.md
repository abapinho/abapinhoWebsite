---
title: 'INSERT dbtab ACCEPTING DUPLICATE KEYS'
slug: insert-dbtab-accepting-duplicate-keys
date: 2016-07-07 09:00:10
tags: [database]
categories: [dicas]
wordpressId: 3574
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['duplicate']
---
Quando tentas inserir um registo numa tabela que já tenha outro registo com a mesma chave primária o programa faz _dump_. O que em alguns casos é uma chatice porque, mesmo que te estejas nas tintas, te obriga a verificar antecipadamente se aqueles chaves já existem na tabela.

Mas o ABAP prevê esses casos e dá-te uma solução:


{{< highlight ABAP >}}

INSERT dbtab FROM TABLE itab [ACCEPTING DUPLICATE KEYS].

{{< /highlight >}}

Não te preocupes que quando acrescentas o ACCEPTING DUPLICATE KEYS não violas a primeira lei da termodinâmica: os registos não são inseridos. A única diferença é que o programa não faz dump. O que pode dar jeito nos casos em que não estás preocupado com o que estás a inserir.

O Abapinho saúda-vos.
