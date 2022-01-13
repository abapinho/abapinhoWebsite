---
title: 'SORTED em vez de STANDARD nas tabelas de cache'
slug: sorted-em-vez-de-standard
date: 2013-04-01 16:11:22
tags: [performance]
categories: [dicas]
wordpressId: 2214
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Há bastante tempo atrás [escrevi aqui um artigo][1] demonstrando as vantagens de usar tabelas internas com índices definidos em vez de simples tabelas STANDARD.

Confissão: é tal o hábito instalado que desde então, quase todas as tabelas internas que criei continuaram a ser STANDARD TABLE.

É muito frequente criar tabelas internas para fazer cache de dados que sei que vou utilizar amiúde dentro de LOOPs para evitar fazer SELECT SINGLEs lá pelo meio.

Fica a dica: sempre que criares uma tabela interna que populas com dados de cache, que só escreves uma vez mas vais ler muitas vezes, em vez de STANDARD, considera criá-la como SORTED e define-lhe decentemente uma chave. Compensa.

Agora que me confessei, espero ser absolvido e proponho emendar-me.

O Abapinho saúda-vos.

   [1]: {{< ref "corrida-de-tabelas" >}} (Partida… lagarta… fugida!)
