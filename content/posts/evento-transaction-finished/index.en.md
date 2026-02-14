---
slug: evento-transaction-finished
title: Execute code after a COMMIT
description: How to execute any code you want after a COMMIT
date: 2026-02-16T09:00:00+01:00
tags: [segredo]
categories: [dicas]
keywords: [commit, event, handler]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Remember how with `CALL FUNCTION IN UPDATE TASK` you could delay some actions until the moment of a `COMMIT`?
<!--more-->

Here’s how you can do the same thing (although it’s not exactly the same thing).

SAP throws event `cl_system_transaction_state=>transaction_finished` every time a `COMMIT` is performed. So, if you have actions that need to be executed only after a COMMIT, here’s how to do it.

First, declare a method in your class as an event handler for this event:

```abap
METHODS on_transaction_finished
  FOR EVENT transaction_finished OF cl_system_transaction_state
  IMPORTING kind.
```

In this method, you can execute whatever you want to happen only after a COMMIT:

```abap
METHOD on_transaction_finished.
  WRITE / 'Hello, after commit'.
ENDMETHOD.
```

Then, you just need to subscribe to this method:

```abap
METHOD execute.
  " (...)
  SET HANDLER on_transaction_finished.
  " (...)
ENDMETHOD.
```

Now, whenever a COMMIT occurs, SAP will call the `execute` method.

Note that you can even have multiple classes or instances subscribe to this event at the same time.

Thank you Dries Van Damme for the tip!

Greetings from Abapinho.
