---
title: 'Evitarás mensagens dinâmicas'
slug: evitaras-mensagens-dinamicas
date: 2014-07-10 08:30:17
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2743
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando precisares de enviar uma mensagem dinâmica por parâmetro, garante que ainda assim usas o comando MESSAGE de forma a que o “where-used” não lhe perca o rasto. Ao fazeres MESSAGE E001 INTO V_DUMMY, os detalhes da mensagem ficam disponível nas variáveis de sistema SY-MSGNO, SY-MSGTY, etc. Além disso, os textos das mensagens nunca devem ficar explicitamente definidos no programa mas sim definidos através da transacção SE91.
{{< ref "evitar-mensagens-dinamicas" >}}
