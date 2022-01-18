---
title: 'Vantagens do LIKE LINE OF'
slug: vantagens-do-like-line-of
date: 2012-11-26 09:00:40
tags: [estilo]
categories: [dicas]
wordpressId: 2061
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Partamos do princípio de que és uma pessoa com alguma dignidade e que por isso já não usas tabelas internas com HEADER LINE ;)

Posto isto, imaginemos que declaras uma tabela interna:

<!--more-->


{{< highlight ABAP >}}
DATA: T_KNA1 TYPE STANDARD TABLE OF KNA1.
{{< /highlight >}}

Se quiseres ler os dados de T_KNA1 recorrendo a um LOOP ou a um READ TABLE, precisas de guardar o registo lido numa estrutura ou num FIELD-SYMBOL. Escolhamos uma estrutura.

Tradicionalmente declará-lo-ias assim:


{{< highlight ABAP >}}
DATA: S_KNA1 TYPE KNA1.
{{< /highlight >}}

Mas a minha sugestão é que o declares antes assim:


{{< highlight ABAP >}}
DATA: S_KNA1 LIKE LINE OF T_KNA1.
{{< /highlight >}}

Esta forma tem duas vantagens:

  * Se o tipo do registo mudar só tens de o actualizar num lugar;

  * Fica mais claro que S_KNA1 está relacionada com T_KNA1.

Obrigado [thienzieyung][1] pela foto.

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/thienzieyung/6937202094/
