---
title: 'Acrescenta parâmetros a métodos e funções standard'
slug: acrescenta-parametros-a-metodos-e-funcoes-standard
date: 2016-02-01 09:00:50
tags: [segredo]
categories: [dicas]
wordpressId: 3394
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Todos conhecemos as ampliações implícitas da SAP, que permitem adicionar código no início ou final qualquer blocos de código standard (funções, métodos, etc.). Já todos as usámos para alterar uma BAPI ou outro código standard qualquer.

Mas só há pouco tempo é que descobri que também é possível usar ampliações implícitas para acrescentar parâmetros a funções e métodos ABAP standard.

<!--more-->

Enquanto estiveres num tabulador de parâmetros da SE37 ou SE24 carrega no botão de ampliação (a espiral, o ícone mais bonito do SAP). Aparece-te uma caixa de diálogo a pedir o nome de uma ampliação. Dá-lhe um nome ou escolhe uma existente e agora já podes adicionar aos parâmetros o que te der na real gana:

![param_extra_em_fm][1]

Nota a coluna à direita a identificar a ampliação a que pertence o parâmetro.

A primeira coisa de que me lembrei foi pode adicionar parâmetros que faltem a uma BADI mas depois lembrei-me que como estas são invocadas por código standard este também teria de ser alterado para enviar o novo parâmetro. Enfim.

Agora vá, vai lá estragar o máximo de funções standard que conseguires.

Obrigado Pierre Ameye pela dica.

Foto: [James Marvin Phelps][2] via [Visual hunt][3] / [CC BY-NC][4]

O Abapinho saúda-vos.

   [1]: images/param_extra_em_fm.png
   [2]: https://www.flickr.com/photos/mandj98/501413295/
   [3]: http://visualhunt.com
   [4]: http://creativecommons.org/licenses/by-nc/2.0/
