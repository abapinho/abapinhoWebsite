---
title: 'Thou shalt avoid dynamic messages'
slug: evitaras-mensagens-dinamicas
date: 2014-07-10 08:30:17
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2743
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When you need to send a dynamic message by parameter, make sure you still use the MESSAGE command, so that the “where-used” doesn’t loose track of it. When you do MESSAGE E001 INTO V_DUMMY, the message details become available in the system variables: SY-MSGNO, SY-MSGTY, etc.
Also, message texts should never be hardcoded, they should always be defined in SE91.
{{< ref "evitar-mensagens-dinamicas" >}} (portuguese)
