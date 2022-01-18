---
title: 'Packages 2.0'
slug: pacotes-2-0
date: 2014-07-21 09:00:12
tags: [estilo, oo]
categories: [artigos]
wordpressId: 2853
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
SAP R/3 repository is a wonderful thing. A vast warehouse of data elements, structures, tables and much more, readily available to one and all. As developers, it is extremely convenient to quickly pick these elements and pull them into our programs as necessity conveys, while our string of thought remains virtually uninterrupted.
Well, not all is sunshine and roses. If you are not careful with the mushrooms you pick you might get a poisoned one.

<!--more-->

Imagine the common scenario in which you pick a customer convenient data element. It looks OK and well suited for your requirements. So you happily include it in your data declarations and pay no more attention to it. What you just failed to realize is that this small data element “belongs” to one of your colleague’s applications and, conceptually, it should never be referred in your application, simply because they are two completely independent and unrelated applications that now share a poisonous bond: they became interdependent.

Application spaghetti is a common scenario in SAP IT teams and it sometimes evolves into some unwanted-dependencies troublesome situations. For instance:

  * If your colleague decides he needs to change his data element; your application will suffer the impacts of this change;

  * If you need to deploy your application into another system you will have to include the rogue data element and its package definition has well;

  * If you are working on a team environment, you’ll have to guarantee that your colleague has already transported all the objects you require before you can safely deploy your solution.

These issues can be easily avoided through careful package design and package checking all your developments.

As a developer you might find that SAP Package Concept goes beyond being just an object repository. Using a combination of structure packages, main packages and development packages interconnected by package interfaces and use accesses, you can safeguard your applications from unwanted object picking.
Here are some basic package concept guidelines:

  1. Stand on your one. Always try to view your application as an isolated software component and encapsulate it accordingly using package hierarchies;

  2. Be aware of your dependencies. Choose to create a new object instead of using unrelated-application objects. Determine your mandatory dependencies through use accesses to other applications;

  3. Create gateways. Using package interfaces, create doorways (APIs really) to your own applications. Make sure you grant public visibility only to stable objects that you feel may bring value to others;

  4. Activate package checks. If you haven’t done it already, go ahead and do it. Package check is integrated with ATC and can quickly give you an overview of your dependency issues. Be aware that this is a global switch. Make sure all the developers are aware of the fact so that they don’t get too scared with package violation messages;

  5. Explore. Create a test package hierarchy, fill it with some dummy objects and package interfaces. Implement a test program and mess around with object permissibility settings.

And now for some golden references to get you started:

  * [SAP Help Package Builder][1] – Detailed step by step guide for setting up your package-conscientious environment;

  * [ABAP Package Concept][2] – Detailed blog series view on the package concept directly from one of SAP’s Gurus.

Abapinho thanks Miguel Jorge for writing this article.

Thanks HatM for the [photo][3].

And greets you.

   [1]: http://help.sap.com/saphelp_erp60_sp/helpdata/en/af/40bd38652c8c42e10000009b38f8cf/content.htm?frameset=/en/09/6eb8c3f98011d3964300a0c94260a5/frameset.htm¤t_toc=/en/d1/802cfc454211d189710000e8322d00/plain.htm&node_id=606&show_children=false
   [2]: http://scn.sap.com/blogs/ttrapp/2011/12/04/abap-package-concept-part-1-the-basics
   [3]: https://www.flickr.com/photos/hatm/3448832284/in/photostream/?rb=1
