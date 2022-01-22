---
title: '<!--:pt-->Evitar mensagens dinâmicas<!--:-->'
slug: evitar-mensagens-dinamicas
date: 2009-09-07 17:40:15
tags: [estilo]
categories: [dicas]
wordpressId: 117
draft: false
---
Qual é, digam lá, a melhor coisinha que o ABAP tem? É, digo eu, poder fazer _where used_ em cima de tudo o que mexe.

E no entanto, esta maravilhosa funcionalidade só funciona maravilhosamente quando as coisas não são invocadas dinamicamente. Eu uso o _where used_ amiúde para descobrir onde uma determinada mensagem está a ser usada. Ora não é nada incomum encontrar chamadas dinâmicas a mensagens, principalmente em casos onde as mensagens não são enviadas directamente para o utilizador mas sim, por exemplo, para o _Application Log_. Neste caso é normal encontrar coisas tipo:


{{< highlight ABAP >}}
PERFORM trata_mensagem1 USING 'E' '056' 'ZSD' a b c.

FORM trata_mensagem1 USING msgty msgno msgid msgv1 msgv2 msgv3 msgv4.
* Aqui podemos gravar num ficheiro ou
* escrever no ecrã ou no application log
* ou o que for preciso.
ENDFORM.
{{< /highlight >}}

Claro que, por ser dinâmica, esta invocação à mensagem E056 não será encontrada pelo _where used_.

Sugiro aqui uma alternativa que contém o melhor dos dois mundos. Permite invocar uma mensagem de forma normal (ou seja, não dinâmica e por isso detectável pelo _where used_ ) sem ela ir parar ao ecrã, e em seguida fazer com ela o que nos der na real gana:


{{< highlight ABAP >}}
DATA: dummy.
MESSAGE E056(ZSD) WITH a b c INTO dummy.
PERFORM trata_mensagem2.

FORM trata_mensagem2.
* A única diferença em relação à versão dinâmica é que aqui em
* vez de usar as variáveis "msgty", "msgno", etc. deverá usar-se
* as variáveis de systema SY-*MSGTY, SY-MSGNO, etc.
* o resto é tudo igual.
ENDFORM.
{{< /highlight >}}

E pronto. Assim se torna o código ao mesmo tempo mais elegante e mais funcional. Dois coelhos com uma só cajadada.

Isto funciona porque quando se faz MESSAGE INTO dummy, o sistema preenche as variáveis do sistema SY-MSGNO, SY-MSGID, etc. com os dados da mensagem, que podem depois ser facilmente usados para o que se quiser.

O Abapinho saúda-vos.
