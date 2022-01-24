---
title: 'O que diz uma mensagem?'
slug: texto-mensagem
date: 2012-01-02 10:00:15
tags: [estilo]
categories: [dicas]
wordpressId: 1298
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Queres obter o texto de uma mensagem da qual só sabes o ID e o número e não sabes como? Aprende aqui:


{{< highlight ABAP >}}
DATA texto TYPE string.
MESSAGE ID '00' TYPE 'E' NUMBER '163' WITH '123' INTO texto.
{{< /highlight >}}

É só isto. Agora do lado de dentro da variável _texto_ encontras o seguinte texto:

"O mandante 123 não existe no sistema"

Obrigado a Peteris B pela foto.

O Abapinho saúda-vos.
