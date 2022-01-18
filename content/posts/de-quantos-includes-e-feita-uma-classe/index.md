---
title: 'De quantos includes é feita uma classe?'
slug: de-quantos-includes-e-feita-uma-classe
date: 2015-02-23 09:00:55
tags: [segredo]
categories: [dicas]
wordpressId: 3002
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Por muitas voltas que eles dêem no ABAP, acaba tudo por ir dar à SE38. Até os métodos das classes ABAP são guardados em includes.

Às vezes quando há um dump diz que o problema está, por exemplo, aqui: CL_MESSAGE_HELPER=============CM001.

<!--more-->

Quando vieres uma coisa destas sabes se trate de um método da classe CL_MESSAGE_HELPER mas não sabes método é. Mas este nome esquisito é na verdade um include que pode ser acedido directamente através da SE38.

Se quiseres fazer o contrário, ou seja, saber quais são os includes de um método podes usar a seguinte função: SEO_CLASS_GET_METHOD_INCLUDES. Dás-lhe o nome de uma classe e ela devolve a lista de métodos e o respectivo include.

Obrigado Ricardo Monteiro pela dica.

Obrigado Rochelle pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/anamnesiss/8457324603
