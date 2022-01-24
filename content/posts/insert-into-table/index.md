---
title: 'Insere sem excepções em tabelas internas com chave única'
slug: insert-into-table
date: 2021-07-05 09:00:51
tags: [estilo]
categories: [dicas]
wordpressId: 4690
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['INSERT vs APPEND']
description: 'Chegou a hora de deixares de usar APPEND e começares a usar o INSERT INTO TABLE para adicionar entradas a tabelas internas.'
---
Quantas vezes na tua vida de consultor tiveste de lidar com dumps que aconteceram em consequência de um programa tentar inserir duas linhas com a mesma chave numa tabela interna definida com UNIQUE KEY?

Chega.

<!--more-->

Desde o século XX que nos habituaram a usar o comando APPEND para inserir numa tabela interna. Mas já há algum tempo que a [própria SAP o desaconselha][1] e sugere usar INSERT INTO TABLE ao invés.

E fazem bem porque o APPEND acrescenta uma linha no final da tabela e no caso das SORTED TABLE é muito provável que dê asneira. Já o INSERT INTO TABLE, pelo contrário, adapta-se a todo o tipo de tabelas.

Mas o INSERT INTO TABLE tem outra vantagem: não lança excepções. Em vez disso, devolve um erro na SY-SUBRC caso não tenha conseguido inserir. Claro que este erro tem de ser tratado.

Dito isto, eu não tenho nada contra excepções e a minha forma preferida de inserir entradas numa tabela interna, seja ela qual for, é a nova VALUE #() que lança uma excepção caso hajam chaves repetidas. Ainda assim, seria fantástico se adicionassem a opção DISTINCT ao VALUE pois este tornar-se-ia ainda mais útil.

O Abapinho saúda-vos.

Foto: Jo Zimny

   [1]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-insert-into-table-to-append-to
