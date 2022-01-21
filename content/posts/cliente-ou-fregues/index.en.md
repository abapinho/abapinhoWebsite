---
title: 'Client or Customer?'
slug: cliente-ou-fregues
date: 2012-04-23 10:00:05
tags: [ddic, ui]
categories: [dicas]
wordpressId: 1625
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Wherever you use the data element KUNNR, its descriptions is “Client”. And what if we wanted to change this field description from "Client" to "Customer"? “Customer" is so much nicer! Or let's suppose that the company you work for is trafficking in drugs and tells you that they want "Dealer" rather than “Supplier” to appear in the LIFNR field. Obviously we can label it as we wish on screens and Z reports but what about standard transactions?

Do this: go to the transaction CMOD menu: “Go to>Global Enhancements>Keywords>Change”. You then enter the data element whose description you intend to modify. You will get a dialogue box in which you can redefine all the descriptions for this data element. Next you save it and it’s done. From now on, wherever this data element is used, your new description will appear. Powerful!

Oh, and on the menu option right next to it (the one that says “show") you can view the list of all the data elements that have already been modified on that system.

Simple? But do take it easy and don’t start calling MATNR “thingy” and UNAME “mate” and so on. SAP is serious business.

Thank you to Miguel Freitas for the tip.

Greetings from Abapinho.
