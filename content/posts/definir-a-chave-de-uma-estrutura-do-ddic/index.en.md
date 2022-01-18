---
title: 'DDIC structure key'
slug: definir-a-chave-de-uma-estrutura-do-ddic
date: 2016-11-02 09:00:39
tags: [ddic, segredo, ui]
categories: [dicas]
wordpressId: 3650
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'chave de estrutura DDIC'
description: 'Há um truque para conseguir definir os campos chave de uma estrutura DDIC para que a a SALV fixe automaticamente as colunas chave.'
---
Today when I want to create a SALV I always create a DDIC structure with the data elements already set to show the texts I need. This avoids the need for code to manipulate the field catalog.

<!--more-->

Sometimes I want to fix the table's primary key columns. And the SALV has an automatic way of doing this:


{{< highlight ABAP >}}
CL_SALV_COLUMNS_LIST->SET_KEY_FIXATION( ).
{{< /highlight >}}

But for the columns to be automatically identified they need to be marked as key in the DDIC structure. This is very simple if the structure is a table. But if it is a pure structure the key flag column is not visible by default in SE11.

Fortunately this has a simple solution. Just go to the menu Extras > DB Attributes > ...

Et voilá:

[![estrutura_chave][1]][1]

Greetings from Abapinho.

   [1]: images/estrutura_chave.png
