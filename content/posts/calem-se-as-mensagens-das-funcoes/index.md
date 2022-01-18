---
title: 'Calem-se as mensagens das funções'
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
Há módulos de função standard que lançam mensagens e não deviam. Não deviam porque depois queremos usá-las em programas não interactivos e, em vez de devolverem o erro, atiram com uma mensagem para o ecrã que dá cabo do processo.

Mas, provavelmente por ter tomado consciência deste problema, a SAP disponibilizou uma forma elegante (mas muito mal documentada) de resolver o problema.

<!--more-->
Imagina que tens o seguinte módulo de função:


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

Puxa novamente pela imaginação e concebe a possibilidade de teres este programa:


{{< highlight ABAP >}}
REPORT zverso_nao.

CALL FUNCTION 'ZZT_NFG_MESSAGE'
  EXCEPTIONS
    hello         = 1
    goodbye       = 2
    OTHERS        = 3.
WRITE 'Por muito tempo achei que a ausência é falta'.
{{< /highlight >}}

O que se passa é que, em vez de escrever um verso de [um poema do Carlos Drummond de Andrade][1], o programa vai dar um erro e parar.

Mas com um simples truque, dá-se voz à poesia:


{{< highlight ABAP >}}
REPORT zverso_sim.

CALL FUNCTION 'ZZT_NFG_MESSAGE'
  EXCEPTIONS
    hello         = 1
    goodbye       = 2
    ERROR_MESSAGE = 3
    OTHERS        = 4.
WRITE 'Por muito tempo achei que a ausência é falta'.
{{< /highlight >}}

Exactamente. Basta acrescentar a excepção virtual ERROR_MESSAGE antes da OTHERS e a mensagem não salta. O SY-SUBRC fica 3 para avisar que houve uma mensagem de erro e o programa já pode tornar o mundo mais bonito.

Obrigado Miguel Jorge pela dica.

O Abapinho saúda-vos.

   [1]: http://www.citador.pt/poemas/ausencia-carlos-drummond-de-andrade
