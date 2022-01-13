---
title: 'IF sem IS INITIAL em métodos booleanos'
slug: if-sem-is-initial-em-metodos-booleanos
date: 2019-08-27 09:00:07
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4244
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
O sistema do cliente onde trabalho actualmente foi finalmente actualizado para o 7.50 e, depois de tantos anos preso ao ABAP convencional, posso desfrutar as maravilhas introduzidas no 7.40.

São às dúzias essas maravilhas, e não vou começar aqui a fazer artigos sobre cada uma porque já existem artigos espalhados pela net sobre quase todas elas o Abapinho faz sempre o possível por ensinar algo novo ou, pelo menos, pouco conhecido.

Mas há uma singela funcionalidade que, não sendo nada de extraordinário, me agrada: já não é preciso fazer IS INITIAL no comando IF quando a condição é um método que retorna um booleano.

<!--more-->
Antes do 7.40:

{{< highlight ABAP >}}
IF testa_algo( ) IS INITIAL.
  faz_algo( ).
ENDIF.
{{< /highlight >}}

Após o 7.40:

{{< highlight ABAP >}}
IF NOT testa_algo( ).
  faz_algo( ).
ENDIF.
{{< /highlight >}}

Funciona igualmente bem para valores simples e para estruturas.

Eu sei que o REDUCE e o _inline_ e as _compreensions_ e etc são muito mais úteis e extraordinários. Mas, enfim, gosto desta pequena melhoria e aqui fica ela para quem ainda não a tivesse descoberto.

O Abapinho saúda-vos.
