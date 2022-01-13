---
title: 'How to sabotage tables'
slug: como-sabotar-tabelas
date: 2012-03-12 13:30:24
tags: [segredo]
categories: [artigos]
wordpressId: 1520
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Another article to help those who are into sneaky subversion Spies, take note on how to edit a table that cannot be (and probably shouldn’t be) edited. I’ll show you three techniques. The first stopped being useful a few years ago, the second is about to become obsolete and the third, well, we’ll just have to see for how long it will work.

**1\. SE16 /H OK_CODE EDIT**
The first technique dates back to the twentieth century and uses the old transaction SE16.

  * in transaction SE16 choose the table to be edited

  * select the data and go to the details of one of the H registries

  * /to debug

  * change the variable OK_CODE to "EDIT"

  * F8 to continue

If everything goes well, the registry will now be editable. Then all you need to do is save.

**2\. SE16N &sap;_edit**

  * in transaction SE16N choose the table you want to edit

  * select the data if you want to filter registries

  * in the transaction field, write &sap;_edit and enter

  * F8 to go to the list of data

A recent SAP Service Pack blocks this technique. If, with a little luck, your system is a bit out of date, the registry will now be editable. Then all you need to do is save. If this doesn’t work, try the same thing but with the transaction UASE16N instead.

**3\. Function SE16N_INTERFACE**

  * transaction SE37, function SE16N_INTERFACE

  * F8 to test

  * parameters:

    * I_TAB = KNA1 :-)

    * I_EDIT = X

    * I_SAPEDIT = X

    * IT_SELFIELDS filled in if you wish to specify the registries to be edited

  * F8 once again to execute

If all goes well, a list of editable registries should appear. Then all you need to do is save.

There you have it. Now don’t start sabotaging tables like there’s no tomorrow!

Thanks to Renato Oliveira for the secret info.

Greetings from Abapinho.
