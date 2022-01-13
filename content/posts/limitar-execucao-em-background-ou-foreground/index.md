---
title: 'Limitar execução em background ou foreground'
slug: limitar-execucao-em-background-ou-foreground
date: 2015-11-30 09:00:36
tags: [segredo]
categories: [dicas]
wordpressId: 3325
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Desenvolveste um report que sabes que demora 12 horas a correr. Por isso não queres que ninguém tente corrê-lo em _foreground_. Vou mostrar-te uma forma de garantires que isso não acontece.

<!--more-->


{{< highlight ABAP >}}
REPORT zbackground.

* Este é o include mágico
INCLUDE rsdbc1xx.

* Ecrã de selecção
PARAMETERS: p_voto TYPE c.

* Evento mágico
AT SELECTION-SCREEN OUTPUT.
  APPEND 'ONLI' TO current_scr-excl. " Executar
  APPEND 'PRIN' TO current_scr-excl. " Executar + imprimir
  APPEND 'SJOB' TO current_scr-excl. " Executar em background
{{< /highlight >}}

Tens 3 opções: ONLI, PRIN e SJOB. Cada uma corresponde a uma das formas de execução disponíveis no menu "Programa". Quando acrescentas uma à tabela CURRENT_SCR-EXCL essa opção é inibida no menu e na barra de ferramentas.

Não podia ser mais simples!

Há também outra forma de fazer isto que é bastante semelhante mas que usa a função RS_SET_SELSCREEN_STATUS em vez de declarar o include e acrescentar os valores à tabela declarada no include. Caso esta por alguma razão não funcione podes experimentar a função.

Obrigado Víctor Villamarín pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/amobetv/16587305159
