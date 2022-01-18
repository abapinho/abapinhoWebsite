---
title: 'Converte classe de excepção numa BAPIRET2'
slug: converte-classe-excepcao-numa-bapiret2
date: 2016-12-12 09:00:06
tags: [oo]
categories: [dicas]
wordpressId: 3679
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'BAPIRET2'
description: 'Como converter uma classe de excepção numa estrutura tipo BAPIRET2 para, por exemplo, poder adicioná-la a uma tabela de logs.'
---
Há uns tempos escrevi um artigo a explicar uma forma de [converter automaticamente excepções clássicas em classes de excepção][1]. Hoje uso esta técnica em quase todas as classes de excepção que crio (e até já melhorei a coisa mas noutro dia falo disso).

Esta dica explica exactamente o contrário.

<!--more-->

É menos provável mas não impossível que, tendo uma classe de excepção, se queria convertê-la numa estrutura tipo BAPIRET2. Para as guardar numa tabela de logs, por exemplo.

E a SAP já tem um módulo de função que faz exactamente isto:

RS_EXCEPTION_TO_BAPIRET2

Pronto, está a dica dada.

O Abapinho saúda-vos.

   [1]: {{< ref "converter-excepcao-em-classe-de-excepcao" >}}
