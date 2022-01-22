---
title: 'SAT – The new execution analysis tool'
slug: sat
date: 2011-02-16 14:31:40
tags: [debug, performance]
categories: [dicas]
wordpressId: 637
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Since I was small I have been using the SE30 transaction for two different things:

  * To analyze a (normally standard) program I don’t know in order to find out what functions it uses, what BADIs it offers, etc;

  * To analyze a program of mine to search for performance problems.

The simple truth is that the SE30 transaction is a total mess. It’s extremely limited and inflexible and it’s useless for any more complex analysis.

The people at SAP seem to agree and have decided to replace it with the fantastic new tool, _SAT – ABAP Runtime Analysis_ , which is more sophisticated all-round. As you might expect, you can access it through the SAT transaction.

If it’s not yet on your system you’ll have to wait for an upgrade. If you already have it, good luck with your research.

Here is a [set of _screencasts_][1] from SAP to teach you how to use the new SAT.

Greetings from Abapinho.

   [1]: https://www.sdn.sap.com/irj/scn/elearn?rid=/library/uuid/d0c750c1-7d04-2e10-8492-a11b9219371d&overridelayout=true
