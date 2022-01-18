---
title: 'Does the function exist?'
slug: a-funcao-existe
date: 2013-05-20 09:00:07
tags: []
categories: [dicas]
wordpressId: 2284
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
You call a function.
Imagine it doesn’t answer.
It may be that it’s staying silent.
Or it’s shy.
Or dumb.
Or, of all the misfortunes, it doesn’t exist.

To make sure and put your mind to rest you then do:

<!--more-->


{{< highlight ABAP >}}
CALL FUNCTION 'FUNCTION_EXISTS'
  EXPORTING
    funcname           = 'Z_DEUS'
  EXCEPTIONS
    function_not_exist = 1
    OTHERS             = 2.
{{< /highlight >}}

This becomes even more useful if you want to know whether a function exists in a remote system:


{{< highlight ABAP >}}
CALL FUNCTION 'FUNCTION_EXISTS'
  <b>DESTINATION 'CEU'</b>

  EXPORTING
    funcname           = 'Z_DEUS'
  EXCEPTIONS
    function_not_exist = 1
    OTHERS             = 2.
{{< /highlight >}}

And all uncertainties are cleared up!

Greetings from Abapinho.
