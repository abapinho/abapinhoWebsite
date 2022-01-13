---
title: 'O GUI está disponível?'
slug: o-gui-esta-disponivel
date: 2015-11-09 09:00:41
tags: [sapgui]
categories: [dicas]
wordpressId: 3232
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Para verificar se um programa está em _background_ é costume espreitar a variável de sistema SY-BATCH. A SY-BINPT também pode ser usada para verificar se o que está a correr em _background_ é uma sessão de BDC. Normalmente usa-se uma destas duas.

Mas há uma pergunta parecida e no entanto diferente. Como fazes para saber se o GUI está disponível? É certo que na maior parte dos casos o resultado é semelhante, mas não o será em todos.

É como dizer que de dia há o sol e de noite há a lua. Se o ceu estiver nublado não há nem sol de dia nem lua de noite.

<!--more-->

Continuando.

A resposta a esta peculiar pergunta pode ser dada de por este módulo de funções:


{{< highlight ABAP >}}
  CALL FUNCTION 'GUI_IS_AVAILABLE'
   IMPORTING
     RETURN        = is_gui_available.
{{< /highlight >}}

Também podes optar por usar o seguinte método (que lá dentro chama a função acima (e depois faz mais umas coisas (mas não vou perder o teu tempo a explicar-tas nem o meu a tentar entendê-las))):


{{< highlight ABAP >}}
is_offline = CL_GUI_ALV_GRID=>OFFLINE().
{{< /highlight >}}

Como este artigo é sobre o GUI a foto é de um Guilherme famoso qualquer ao calhas. Pareceu-me uma boa forma de ilustrar o assunto em questão.

O Abapinho saúda-vos.
