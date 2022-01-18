---
title: 'SELECT... ORDER BY PRIMARY KEY'
slug: select-order-by-primary-key
date: 2013-11-18 09:00:43
tags: [sql]
categories: [dicas]
wordpressId: 2481
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Embora já use ABAP desde 1998, todas as semanas aprendo novas funcionalidades ou opções ou mesmo novos comandos. Parece mentira.

Hoje partilho uma pequena opção do SQL que descobri recentemente:


{{< highlight ABAP >}}
SELECT * FROM T001
INTO TABLE T_T001
ORDER BY PRIMARY KEY.
{{< /highlight >}}

O SELECT e o FROM e o INTO e o TABLE e mesmo o ORDER BY já os conheço há muito tempo. Só não conhecia é o PRIMARY KEY.

Assim a tabela interna vem já ordenada pela sua chave. Conveniente.

O Abapinho saúda-vos.
