---
title: "Stop the functions module's error messages"
slug: calem-se-as-mensagens-das-funcoes
date: 2015-03-30 09:00:30
tags: [segredo]
categories: [dicas]
wordpressId: 3055
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
There are standard functions that trigger messages where they shouldn’t. And they shouldn’t because we want to use these functions in non-interactive programs and then, instead of returning the error, an error message is triggered and ruins the whole process.

However, being aware of this problem, SAP has provided a quite elegant (but not well documented) way of solving this problem.

<!--more-->
Imagine that you have the following function module:


{{< highlight ABAP >}}
FUNCTION zzt_message.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXCEPTIONS
*"      HELLO
*"      GOODBYE
*"----------------------------------------------------------------------

  MESSAGE e002(00).

ENDFUNCTION.
{{< /highlight >}}

Now, use your imagination and consider the possibility of having this program:


{{< highlight ABAP >}}
REPORT zverso_nao.

CALL FUNCTION 'ZZT_MESSAGE'
  EXCEPTIONS
    hello         = 1
    goodbye       = 2
    OTHERS        = 3.
WRITE 'Por muito tempo achei que a ausência é falta'.
{{< /highlight >}}

What happens is that instead of returning a poem of [ Carlos Drummond de Andrade][1], the program will throw an error and stop.

But with a simple trick you can give poetry a go:


{{< highlight ABAP >}}
REPORT zverso_sim.

CALL FUNCTION 'ZZT_MESSAGE'
  EXCEPTIONS
    hello         = 1
    goodbye       = 2
    ERROR_MESSAGE = 3
    OTHERS        = 4.
WRITE 'For a long time I have thought that the absence is a fault'.
{{< /highlight >}}

Precisely. Simply add the virtual exception ERROR_MESSAGE before OTHERS and the message will not pop up. SY-SUBRC assumes 3 to warn that there was an error message and the program can bring some beauty to the world.

Thank you, Miguel Jorge for the hint.

Best greetings from Abapinho.

   [1]: http://www.citador.pt/poemas/ausencia-carlos-drummond-de-andrade
