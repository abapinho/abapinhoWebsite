---
title: 'Descobre as diferenças com a SE39'
slug: descobre-as-diferencas-se39
date: 2016-05-30 09:00:21
tags: [sapgui]
categories: [dicas]
wordpressId: 3556
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Estava há pouco a fazer QC a um programa que criaram chamado ZSDFAKSPE com quase 1000 linhas e nenhum comentário. Uma óbvia cópia de um programa standard chamado SDFAKSPE.

Decidi então usar o Editor ABAP de tela dividida (Split screen editor) que está na transacção SE39. Introduzi o nome do Z e do standard e depois pude compará-los lado a lado.

<!--more-->

Como quem criou o ZSDFAKSPE usou o Pretty Printer, o editor começou por mostrar diferenças em quase todas as linhas. Mas isto foi facilmente resolvido nas configurações, activando a opção "ignorar indentações", passando a identificar só mesmo os sítios onde o código foi alterado. E também tem uma opção para ignorar comentários.

Depois é só usar as setas de navegação da barra de ferramentas para saltar de alteração em alteração.

E assim, em vez de passar uma hora a olhar para 1000 linhas, demorei 2 minutos a encontrar as diferenças.

O Abapinho saúda-vos.
