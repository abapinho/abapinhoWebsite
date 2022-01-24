---
title: 'Finally ABAP knows Excel'
slug: abap2xlsx
date: 2012-07-02 09:00:22
tags: []
categories: [artigos]
wordpressId: 1803
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
There are various ways of creating an Excel spreadsheet in ABAP. Some are more masochistic than others and some are certainly more lousy than others.

<!--more-->

The most common way is to use OLE2. Take a look at the example [here][1]. It's commonly used because until recently it was the least bad of all the alternatives. But it is still lousy because OLE2 is run alongside the SAPGui and therefore is not only slow nor does it run as a background task.

There are also some old functions such as MS_EXCEL_OLE_STANDARD_DAT which in practice also use OLE and will give the same result but with less flexibility.

Then there are some crazy approaches such as [this][2] which explicitly manages Excel XML.

And there has to be more.

But this is no longer of any interest because now there is [ABAP2XLSX][3]. ABAP2XLSX is SCN (SAP Community Network) project developed by a smart young guy called Ivan Femia. ABAP2XLSX consists of a set of classes which enable Excel files to be managed within ABAP in native XLSX format or, in other words, without having to use external components. It is simple to develop, quick to execute and can be done in background. It is also well documented, there are dozens of available examples and it is supported by an active community.

It enables you to generate technicolour spreadsheets with formulas and absolutely everything and anything. Here is just one example (ZDEMO_EXCEL1):

<https://github.com/abapinho/codesnippets/blob/master/zdemo_excel1.abap>

To start to use it you just have install the nugget via [SAPlink][5] which is available at [the project's page][3].

Thanks to Filip Dujardin for the photo.

Greetings from Abapinho.

   [1]: https://scn.sap.com/docs/DOC-26034
   [2]: https://wiki.sdn.sap.com/wiki/display/ABAP/Exporting+data+to+Excel+-+XML+to+the+rescue
   [3]: https://wiki.scn.sap.com/wiki/display/ABAP/abap2xlsx
   [5]: https://code.google.com/p/saplink/
