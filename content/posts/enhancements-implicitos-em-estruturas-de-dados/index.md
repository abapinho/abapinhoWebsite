---
title: 'Enhancements implícitos em estruturas de dados'
slug: enhancements-implicitos-em-estruturas-de-dados
date: 2019-05-13 09:00:00
tags: [enhancements, segredo]
categories: [dicas]
wordpressId: 4199
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['enhancement em estrutura']
description: 'É normal usar enhancements implícitos para adicionar código ABAP a programas standard. Mas também podemos adicionar campos a estruturas de dados.'
---
Já todos usámos _enhancements_ implícitos para adicionar código ao início ou final de funções, forms ou métodos standard. Mas é menos conhecido o facto de que também podemos adicionar campos a estruturas de dados, estejam elas declaradas como TYPES ou ou directamente como DATA.

<!--more-->

Funciona exactamente da mesma forma. Aqui está um exemplo:

[![Enhancement implícito em estrutura de dados][1]][1]

Claro que é pouco provável que queiras criar enhancements em programas Z, mas vá, é só um exemplo para veres como é.

Se olhares com atenção para o código vais ver que há truque. Se apenas adicionares mais um campo vai dar erro. Isto porque o _enhancement_ é, na verdade, um ficheiro à parte, compilado à parte. O truque para o conseguir compilar com sucesso é começar explicitamente com TYPES ou DATA (conforme), como se pode ver no exemplo.

As palavras a vermelho dão para reparar que o editor não sabe muito bem lidar com isto. Mas o que interessa é que funciona.

O Abapinho saúda-vos.

   [1]: images/implicit_enhancement_type.jpg
