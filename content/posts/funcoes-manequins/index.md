---
title: 'Funções manequins'
slug: funcoes-manequins
date: 2021-05-10 09:00:54
tags: [estilo]
categories: [dicas]
wordpressId: 4640
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Como é que se há-de traduzir _dummy_? Fica manequim.

Comecei a trabalhar recentemente num cliente novo e reparei que fazem aqui uma coisa que me agradou. Quando precisam de invocar por RFC módulos de função em outros sistemas SAP, criam localmente um módulo de função com o mesmo nome mas sem código, apenas com um comentário explicando que é uma função remota noutro sistema.

A virtude disto é que assim pode usar-se a ferramenta _where-used_ para descobrir todos os sítios onde é invocada. Só isso. E não é pouco!

Chamemos-lhes funções manequins.

O Abapinho saúda-vos.
