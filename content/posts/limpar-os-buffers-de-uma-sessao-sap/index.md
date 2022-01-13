---
title: 'Limpar os buffers de uma sessão SAP'
slug: limpar-os-buffers-de-uma-sessao-sap
date: 2014-10-13 09:00:25
tags: [sapgui]
categories: [dicas]
wordpressId: 2904
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Todos os dias aprendo novos comandos para introduzir no campo da transacção. Hoje aprendi uns que resolvem um problema que, ainda que raramente, já me aconteceu no passado.

Vê lá se isto já te aconteceu: fazes uma alteração a um texto de um elemento usado numa tabela que editas a partir da SM30. Mas quando vais à SM30 o texto antigo continua lá. Activas vezes sem conta, sais e entras da transacção e nada.

<!--more-->

O texto antigo está algures numa cache do SAPGui.

Para resolver isto escreves no campo da transacção os seguintes comandos:

  * /$sync (limpeza do buffer);

  * /$tab (limpeza dos buffers relativos a tabelas).

Dá sempre jeito conhecer estes segredinhos obscuros e manhosos. Obrigado Sérgio Serra por revelares este.

Obrigado Prime Number pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://flic.kr/p/4q2bt4
