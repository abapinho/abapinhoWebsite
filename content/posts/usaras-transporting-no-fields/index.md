---
title: 'Usarás TRANSPORTING NO FIELDS'
slug: usaras-transporting-no-fields
date: 2015-03-09 09:00:02
tags: [estilo, performance]
categories: [boaspracticas]
wordpressId: 2735
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Muitas vezes fazes READ TABLE itbl ou LOOP AT itbl apenas para verificar se um registo existe (CHECK SY-SUBRC = 0). Ora para isso, os dados do registo não são realmente necessários. Nestes casos usa sempre TRANSPORTING NO FIELDS. Assim evitas ter de declarar uma estrutura destino e o programa fica mais rápido porque não tem de perder tempo a copiar dados.
