---
slug: debug-step
title: Debug a trote
description: O tamanho do passo do debug pode ser mudado
date: 2022-04-11T09:00:00+01:00
tags: [debug]
categories: [dicas]
keywords: [debug size]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Há várias desculpas para não usar a nova sintaxe funcional do ABAP 7.4. Uma delas é dizer que é impossível fazer _debug_.

Só que não é.

<!--more-->

Tenta fazer debug a um comando como este:

```abap
result = REDUCE i(
    INIT count = 0
    FOR customer IN customers
    ( WHERE customer-name1(1) = first_letter )
    NEXT count = count + 1 ).
```

Vais descobrir que, mesmo quando carregas em F5 para dar apenas um passo, o _debugger_ avança logo para o comando seguinte. Rogas pragas à nova sintaxe e prometes nunca mais usá-la.

Isto acontece-te se não souberes que há um botão mágico que permite mudar o tamanho do passo do _debugger_:

![Debugger toolbar step size button][1]

Carregas no botão que diz _step size_ e o _debugger_ passa de galope a trote. A partir daí o F5 permite-te para a cada iteração do `FOR` do `REDUCE`.

Vais ter de arranjar outra desculpa para não aprender a sintaxe do 7.4.

Foto: [Floortje Walraven][2].

O Abapinho saúda-vos.

[1]: <images/abap-debugger-icons-step-size.png>
[2]: <https://visualhunt.co/a7/93c73675>
