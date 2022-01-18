---
title: 'I call you and you call me'
slug: i-call-you-and-you-call-me
date: 2016-05-09 18:36:30
tags: [segredo, sysadmin]
categories: [dicas]
wordpressId: 3534
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
You you call a function via RFC you need to provide the RFC DESTINATION for the remote system:


{{< highlight ABAP >}}
CALL FUNCTION ‘ZSNEEZED’
  DESTINATION ’sistema_longe_daqui’.
{{< /highlight >}}

What if, for some reason, the function running in the remote system needs to call a function in the original system? How would you do it?

<!--more-->

It's simple. SAP helps you. There is a predefined RFC DESTINATION called BACK which represents the original caller system.


{{< highlight ABAP >}}
FUNCTION ZSNEEZED.
(…)
CALL FUNCTION ‘ZBLESSYOU’
  DESTINATION ‘BACK’.
(…)
ENDFUNCTION.
{{< /highlight >}}

Automatical.

Greetings from Abapinho.
