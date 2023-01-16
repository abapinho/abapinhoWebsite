---
slug: message-collector
title: Message collector
description: O ABAP tem um coleccionador de mensagens
date: 2023-01-16T09:00:00Z
tags: [se91, library]
categories: [dicas]
keywords: [message list]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

SAP messages are all managed centrally through the `SE91` transaction, but can appear to a program in a variety of formats.

<!--more-->

Here are some of those formats:

- `BAPIRET2` (when a BAPI returns one)
- `BAPIRET2_T` (when a BAPI returns many)
- SYST` (the last one saved by the system)
- `IF_MESSAGE` (when it is attached to an exception)
- And by hand (when you manually specify all its parameters)

Usually programs end up having specific code to handle some of these formats. Code that is always the same thing, always the same thing, always the same thing, and that we shouldn't have to bother with.

Well, SAP has some classes that save a lot of that silly work.

## How?

It's all around the `IF_RECA_MESSAGE_LIST` interface. This interface has methods that allow you to import and export messages in all the formats mentioned above.

First instantiate the `message_collector` with this little factory class:

```abap
DATA(message_list) = cf_recall_message_list=>create( ).
```

The `create()` method returns an instance that implements that `IF_RECA_MESSAGE_LIST` .

Then use it to collect messages like this:


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

When you have your collection complete, present it like this:

```abap
    message_list->get_list_as_bapiret(
      IMPORTING et_list = DATA(bapi_messages) ).

    LOOP AT bapi_messages INTO DATA(msg).
      WRITE / msg-message.
    ENDLOOP.
```

Thanks Virginia Stockdale for the tip (you told me about this in 2014! Better late than never).

Greetings from Abapinho.
