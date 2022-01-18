---
title: 'Evitarás variáveis globais'
slug: evitaras-variaveis-globais
date: 2015-04-13 09:00:36
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2719
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quanto mais variáveis globais existirem num programa, mais obscuro ele se tornará. Evita-as. Esta é uma das regras mais básicas da boa programação e deve ser seguida o mais possível. Mesmo se muitas variáveis tiverem de ser passadas entre rotinas. O esforço é um pouco maior, mas daí resultará código muito mais claro e seguro.
Excepções podem ser feitas no caso de relatórios muito simples que revolvam à volta de uma única tabela interna, tabela esta que poderá ser declarada globalmente sem comprometer a clareza do código.
