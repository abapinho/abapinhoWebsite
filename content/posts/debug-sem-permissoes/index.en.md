---
title: 'Debug on a user without debug permissions'
slug: debug-sem-permissoes
date: 2018-03-05 09:00:48
tags: [debug, segredo]
categories: [dicas]
wordpressId: 3948
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'debug sem permissões'
---
In a well protected system, normal users don't have debug permissions. Very often, this makes it harder for ABAP programmers to help solve the users' problems, not being able to debug directly in their session.

But there is a legit, albeit obscure, work-around for this problem.

<!--more-->

In your computer, create an external break-point under the user's username.
Let the user do his thing in his session. When you want to start debugging his session, write this command:


{{< highlight ABAP >}}
/hext user = YOURUSERNAME
{{< /highlight >}}

This tells SAP that the debug will be done by another user: you. When that command is executed, a debug session magically opens in your computer and you're free to debug the user's session.

Thank you Sérgio Serra for the tip.

Greetings from Abapinho.
