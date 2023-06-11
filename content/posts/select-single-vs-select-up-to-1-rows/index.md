---
slug: select-single-vs-select-up-to-1-rows
title: SELECT SINGLE vs SELECT UP TO 1 ROWS
description: Vamos lá ver se nos decidimos sobre qual dos dois é melhor
date: 2023-06-12T09:00:00+01:00
tags: [sql]
categories: [dicas]
keywords: [SELECT SINGLE]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

É pá, esta é uma daquelas discussões infinitas que nunca chegarão a lado nenhum. Igual a tentar decidir se mereces continuar a viver se meteres ananás na pizza ou queijo Filadélfia no sushi.

<!--more-->

Quando se pretende obter um único registo de uma tabela usando a chave primária completa não há dúvida: `SELECT SINGLE`. Mas e quando se tem a chave primária incompleta? Há algum tempo [houve uma discussão][1] no repositório do Clean ABAP sobre isto. A maior parte das pessoas disse que mesmo assim preferia continuar a usar `SELECT SINGLE`. Excepto quando é preciso reordenar pois o `SELECT SINGLE` não permite `ORDER BY`. Mas ainda assim houve quem dissesse que, no caso de a chave primária estar incompleta usa `SELECT UP TO 1 ROWS` para avisar outros programadores desse facto.

Eu, como [disse lá][2], uso sempre `SELECT SINGLE`.

Se julgavas que eu te ia dar uma resposta definitiva, lamento. Ficas apenas a saber que eu evito sushi com Filadélfia.

Obrigado [wuestenigel][3] pela [photo][4].

O Abapinho saúda-vos.

[1]: <https://github.com/SAP/styleguides/issues/179>
[2]: <https://github.com/SAP/styleguides/issues/179#issuecomment-775590910>
[3]: <https://visualhunt.co/a7/adf7703a>
[4]: <https://visualhunt.com/re10/5b377d5c>
