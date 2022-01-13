---
title: 'A função existe?'
slug: a-funcao-existe
date: 2013-05-20 09:00:07
tags: []
categories: [dicas]
wordpressId: 2284
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Chamas uma função.
Imagina que ela não responde.
Pode ser por ter ficado calada.
Ou por ser tímida.
Ou muda.
Ou, ai tragédia!, por não existir.

Para teres a certeza e ficares descansado fazes assim:

<!--more-->


{{< highlight ABAP >}}
CALL FUNCTION 'FUNCTION_EXISTS'
  EXPORTING
    funcname           = 'Z_DEUS'
  EXCEPTIONS
    function_not_exist = 1
    OTHERS             = 2.
{{< /highlight >}}

Isto torna-se ainda mais útil se quiseres saber se uma função existe num sistema remoto:


{{< highlight ABAP >}}
CALL FUNCTION 'FUNCTION_EXISTS'
  <b>DESTINATION 'CEU'</b>

  EXPORTING
    funcname           = 'Z_DEUS'
  EXCEPTIONS
    function_not_exist = 1
    OTHERS             = 2.
{{< /highlight >}}

E acabam-se as dúvidas!

O Abapinho saúda-vos.
