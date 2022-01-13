---
title: 'Usarás FIELD-SYMBOLs em vez de variáveis de estrutura'
slug: usaras-field-symbols-em-vez-de-variaveis-de-estrutura
date: 2014-07-24 09:00:50
tags: [estilo, performance]
categories: [boaspracticas]
wordpressId: 2725
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
READ TABLE itbl ASSIGNING  é sempre mais rápido que READ TABLE itbl INTO wa.
Além disso, quando precisares de alterar dados em registos de uma tabela interna, assim não precisas de usar o comando MODIFY nem da variável auxiliar que às vezes usas para guardar o SY-TABIX.
A única situação em que uma variável de estrutura é aconselhada é quando queres adicionar linhas novas a uma tabela interna.
Algumas pessoas defendem que as variáveis de estrutura devem ser usadas sempre que não se quiser alterar os dados da tabela interna. Isto é mais lento, mas como convenção pode ser mais intuitivo.
