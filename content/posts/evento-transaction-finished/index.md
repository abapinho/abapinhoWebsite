---
slug: evento-transaction-finished
title: Executa código após um COMMIT
description: Como executar o código que quiseres depois de ser feito um COMMIT
date: 2026-02-16T09:00:00+01:00
tags: [segredo]
categories: [dicas]
keywords: [commit, event, handler]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Lembras-te como o `CALL FUNCTION IN UPDATE TASK` permitia adiar algumas acções até ao momento do COMMIT?
<!--more-->

Aqui vais aprender como podes fazer mais ou menos o mesmo (ok não é realmente o mesmo) com classes e métodos.

O SAP lança o evento `cl_system_transaction_state=>transaction_finished` sempre que faz um `COMMIT`. Portanto, se tiveres coisas que só queres fazer nesse momento e não antes, aqui tens uma forma de o conseguir.

Primeiro declaras na tua classe um método como _event handler_ desse evento:

```abap
METHODS on_transaction_finished
  FOR EVENT transaction_finished OF cl_system_transaction_state
  IMPORTING kind.
```

Nesse método implementas tudo o que queres que aconteça apenas no momento do `COMMIT`:

```abap
METHOD on_transaction_finished.
   WRITE / 'Hello, after commit'.
ENDMETHOD.
```

E depois só tens de subscrever o método:

```abap
METHOD execute.
  " (...)
  SET HANDLER on_transaction_finished.
  " (...)
ENDMETHOD.
```

Pronto. Se correres o método `execute`, no próximo `COMMIT` o SAP vai correr o método `on_transaction_finished`.

Nota que ninguém te impede de teres várias classes ou várias instâncias a subscrever este evento.

Obrigado Dries Van Damme pela dica.

O Abapinho saúda-vos.
