---
title: 'Envia emails para uma lista de distribuição'
slug: lista-de-distribuicao
date: 2021-05-31 09:00:56
tags: []
categories: [dicas]
wordpressId: 4663
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['listas de distribuição']
---
Quando tens de enviar o mesmo email para mais do que um endereço, o mais comum é guardar a lista de endereços numa tabela qualquer e depois adicionar todos os endereços como recipientes.

Mas aprendi recentemente uma forma muito mais bonita para conseguir o mesmo resultado.

<!--more-->

O SAP tem uma funcionalidade standard que permite criar listas de distribuição. Através da transacção SO23 crias uma lista de distribuição, dás-lhe um nome, escolhes uma pasta e depois adicionas-lhe tantos recipientes (endereços de email, usernames, etc) quantos quiseres.

Para enviar um email através do BCS para uma lista de distribuição a única diferença em relação ao normal é que para adicionares a lista como recipiente fazes isto:


{{< highlight ABAP >}}
recipient = cl_distributionlist_bcs=>getu_persistent(
  i_dliname = lv_mlrec
  i_private = space ).
request->add_recipient( recipient ).
{{< /highlight >}}

O resto é tudo igual.

Foto de doug turetsky.

O Abapinho saúda-vos.
