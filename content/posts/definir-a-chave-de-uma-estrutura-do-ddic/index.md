---
title: 'Campos chave de estrutura DDIC'
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
Hoje em dia quando quero criar uma SALV defino sempre a estrutura dos dados no DDIC já com os elementos de dados com as descrições desejadas em vez de os forçar no código.

<!--more-->

Por vezes quero fixar a chave primária da tabela. A SALV tem uma forma automática de o fazer:


{{< highlight ABAP >}}
CL_SALV_COLUMNS_LIST->SET_KEY_FIXATION( ).
{{< /highlight >}}

Mas para que as colunas sejam automaticamente identificadas é necessário que estejam marcadas como chave na estrutura. Isto é simples se a estrutura for uma tabela. Mas se for apenas uma estrutura as colunas para marcar campos como chave não aparecem.

Mas é um problema de fácil solução. Basta ir ao menu Extras > DB Attributes > ...

Et voilá:

[![estrutura_chave][1]][1]

O Abapinho saúda-vos.

   [1]: images/estrutura_chave.png
