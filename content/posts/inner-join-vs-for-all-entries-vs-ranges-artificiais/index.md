---
title: 'INNER JOIN vs FOR ALL ENTRIES vs RANGES artificiais'
slug: inner-join-vs-for-all-entries-vs-ranges-artificiais
date: 2014-11-25 09:00:13
tags: [performance, sql]
categories: [boaspracticas]
wordpressId: 2749
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Uma vez que as operações de dados estão muito mais optimizadas no servidor de base de dados do que no ABAP, é sempre preferível o primeiro. FOR ALL ENTRIES só deve ser usado quando não se conseguir fazer INNER JOIN (como com a BSEG por exemplo). Quando possível, usar RANGES artificiais é preferível a usar FOR ALL ENTRIES mas é preciso cuidado para não ultrapassar o limite do parser de SQL. Depende do servidor de base de dados mas regra geral é de evitar RANGES com mais de 1000 linhas.
Claro que ao usar FOR ALL ENTRIES nunca te podes esquecer de verificar que a tabela interna não está vazia caso contrário todas as entradas da tabela serão lidas.
