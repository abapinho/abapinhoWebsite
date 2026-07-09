---
slug: quem-lancou-a-excepcao
title: Quem lançou a excepção?
description: Sabes quem a apanhou, mas sabes quem a lançou?
date: 2026-06-22T09:00:00+01:00
tags: [segredos]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

As excepções podem ir sendo passadas para trás, de método em método, e serem apanhadas por um método que não tem nada a ver com o método que a lançou. E como o descobres?

<!--more-->

Tanto o SAPGUI como o Eclipse têm um botãozinho que serve esse propósito. A função chama-se "Display trigger exception". Clicas lá e ele mostra-te o sítio no código onde a excepção foi lançada.

![Display trigger exception][1]

Só isso! Mas não é pouco. Antes de conhecer esta funcionalidade podia demorar imenso tempo até chegar ao sítio certo.

O Abapinho saúda-vos.

[1]: images/display-trigger-exception.png
