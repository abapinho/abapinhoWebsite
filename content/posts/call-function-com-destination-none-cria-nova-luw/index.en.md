---
title: "[:pt]CALL FUNCTION com DESTINATION ‘NONE' cria nova LUW[:]"
slug: call-function-com-destination-none-cria-nova-luw
date: 2015-06-22 09:00:57
tags: [segredo]
categories: [dicas]
wordpressId: 3132
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
[:pt]Sabias que quando invocas uma função com a opção DESTINATION ‘NONE’ estás a iniciar uma nova LUW?

Isto pode parecer apenas uma curiosidade, mas há um caso em que pode fazer toda a diferença: sabes aqueles módulos de função que ao serem chamados uma segunda vez têm um comportamento diferente da primeira vez? Isto acontece porque eles hão-de ter alterado alguma variável global ao grupo de funções. Ora se iniciares uma nova LUW quando chamares a função, o seu grupo de funções é automaticamente inicializado e assim garantes que o comportamento da função é o esperado.

Há um exemplo disto na nota OSS 770626.

Obrigado Artur Moreira pela dica.

Quanto à foto, decidi que os dentes do Elvis são uma boa forma de representar LUWs.

O Abapinho saúda-vos.
[:]
