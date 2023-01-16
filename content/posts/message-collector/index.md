---
slug: message-collector
title: Coleccionador de mensagens
description: O ABAP tem um coleccionador de mensagens
date: 2023-01-16T09:00:00Z
tags: [se91, library]
categories: [dicas]
keywords: [message list]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

As mensagens SAP são todas geridas de forma centralizada através da transacção `SE91`, mas podem aparecer a um programa nos mais diversos formatos.

<!--more-->

Eis alguns desses formatos:

- `BAPIRET2` (quando uma BAPI devolve uma)
- `BAPIRET2_T` (quando uma BAPI devolve muitas)
- `SYST` (a última guardada pelo sistema)
- `IF_MESSAGE` (quando vem agarrada a uma excepção)
- E à mão (quando se especifica manualmente todos os seus parâmetros)

Normalmente os programas acabam por ter código específico para tratar alguns desses formatos. Código esse que é sempre a mesma coisa, sempre a mesma coisa, sempre a mesma coisa, e com o qual não deveríamos mesmo mesmo mesmo ter de nos chatear.

Ora o SAP tem umas classes que poupam muito desse trabalho parvo.

## Como?

Anda tudo à volta da interface `IF_RECA_MESSAGE_LIST`. Essa interface tem métodos que permitem importar e exportar mensagens em todos os formados acima mencionados.

Primeiro instancia o `message_collector` com esta fabricazinha:

```abap
DATA(message_list) = cf_reca_message_list=>create( ).
```

O método `create()` devolve uma instância que implementa o tal `IF_RECA_MESSAGE_LIST` .

Depois usa-o para coleccionar mensagens assim:

```abap
  DATA(message_list) = cf_reca_message_list=>create( ).

  " Exception
  TRY.
      DATA(infinite) = 1 / 0.
    CATCH cx_root INTO DATA(exc).
      message_list->add_from_exception( exc ).
  ENDTRY.

  " SYST
  MESSAGE e007(00) WITH 'The Universe' INTO DATA(dummy).
  message_list->add_symsg( ).

  " BAPI
  DATA bapiret2 TYPE bapiret2.
  CALL FUNCTION 'BAPI_BCONTACT_GETDETAIL'
    EXPORTING
      contact = 'ZÉ NINGUÉM'
    IMPORTING
      return  = bapiret2.
  message_list->add_from_bapi( is_bapiret = bapiret2 ).

  " Manually
  message_list->add(
    id_msgty = 'E'
    id_msgid = '00'
    id_msgno = '034'
    id_msgv1 = 'to bad people' ).
```

Quando tiveres a nossa colecção pronta para ser apresentada, apresenta-la assim:

```abap
    message_list->get_list_as_bapiret(
      IMPORTING et_list = DATA(bapi_messages) ).

    LOOP AT bapi_messages INTO DATA(msg).
      WRITE / msg-message.
    ENDLOOP.
```

Obrigado Virginia Stockdale pela dica (falaste-me disto em 2014! Bem... mais vale tarde que nunca).

O Abapinho saúda-vos.
