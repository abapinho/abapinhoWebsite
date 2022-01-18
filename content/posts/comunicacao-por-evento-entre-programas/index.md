---
title: 'Comunicação por evento entre programas '
slug: comunicacao-por-evento-entre-programas
date: 2014-12-22 09:00:11
tags: []
categories: [artigos]
wordpressId: 2943
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Na mitologia grega a forma de comunicação mais frequentemente utilizada pelos deuses para comunicar com os mortais era o estupro. Estupravam por dá cá aquela palha.

O mais parecido que temos com estupro no ABAP é o comando SUBMIT, que é também a forma mais comum de comunicação entre dois programas.

<!--more-->

Mas há formas menos brutas de um programa comunicar com outro. Recorrendo a um evento, por exemplo.

Presumamos que tens um programa chamado ZEUS (em rigor seria ZEUS_TOURO, mas OK) que quer comunicar com outro chamado ZEUROPA.

  1. Na transacção SM62 crias o evento com um nome tipo Z*. Chamemos-lhe ZAS! Uma vez criado podes encontrá-lo perto do fim da longa lista de eventos, junto dos restantes eventos criados pelo cliente;

  2. Se carregares no botão direito podes fazer uma data de coisas com ele. Uma delas é transportá-lo, ou seja, adicioná-lo a uma ordem de transporte;

  3. No programa ZEUS, no sítio onde houver vontade de invocar a ZEUROPA, mete o seguinte código:


{{< highlight ABAP >}}
CALL FUNCTION 'BP_EVENT_RAISE'
  EXPORTING
    eventid                      = 'ZAS'
 EXCEPTIONS
   BAD_EVENTID                  = 1
   EVENTID_DOES_NOT_EXIST       = 2
   EVENTID_MISSING              = 3
   RAISE_FAILED                 = 4
   OTHERS                       = 5
{{< /highlight >}}

  4. Na transacção SM36 cia um _job_ ZEUS_ZAS_EUROPA com um único passo, a execução (salvo seja) da ZEUROPA;

  5. Nas condições de execução do _job_ escolhe a opção "após evento" e escolhe o evento ZAS. Grava.

Pronto.
Ao correres o programa ZEUS,
Ele lança o evento ZAS,
Que espoleta o job ZEUS_ZAS_EUROPA,
Que executa (salvo seja) a ZEUROPA.

O Abapinho saúda-vos.
