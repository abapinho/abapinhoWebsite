---
title: 'SAPlink'
slug: saplink
date: 2012-12-03 09:00:00
tags: [sysadmin]
categories: [artigos]
wordpressId: 2091
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
SAPlink is a Z program that is installed in the development environment and which enables a wide variety of object types to be imported and exported from the Workbench.

Take a look here at some examples of how SAPlink can be used:

  * To transfer a table from one SAP system to another

  * To share a class on the internet

  * To make a local security backup of a set of programs before making a dangerous change

  * To keep a development in our personal repository (in [Evernote][1], of course) in case you need it later in another project

  * Etc.

<!--more-->

SAPlink works with plugins. There is a plugin for each object type. There are plugins for lots of things: classes, function groups, Smartforms, tables, tables contents, etc. But there are still heaps of things without plugins. And there are some plugins with limitations. For example, although there is a plugin for classes, there are times I needed to export abstract classes and it resulted in a bit of a mess. Here you have the [list of available plugins][2] which will be updated as they are developed.

If at the outset SAPlink is not very intuitive, once you have understood it, it is very easy to use. It has, as predicted, two operating modes, one for exporting and one for importing objects. It also has two ways of storing objects, nuggets and slinkees. Let's stay with nuggets which are the most common.

To find out whether SAPlink already exists on your SAP system look up the program ZSAPLINK in SE38. If it does not exist you have [to install it][3].

Now the practical implementation.

Now imagine that you want to export an object from one SAP to another. A table or a program or whatever you feel like. You must do the following:

  1. Create a nugget by selecting the option "Create new nugget" and select a name for it. Hit F8 and the SAPGui will ask you where on your disk you want to create a file with the nugget which is still empty and ready to receive objects;

  2. Then select the option "Add object to nugget". Then below you choose the object type (the list is limited to the plugins installed), the object name and the name of the nugget file that you created previously. When you hit F8 SAPlink will export the object to your file. You will note by the options that you can also export in one go all the objects from one package or one transport.

If you open the file you will see that it is an XML with your object saved there in a format recognised by the SAPlink plugin. Now go to the SAP where you want to put the table you just exported and do the opposite. In other words:

  1. Select the option "Import nugget" and select the nugget you want to import. You can also decide if you want to overwrite the existing objects;

  2. When you press F8 SAPlink will try to import the objects that exist in the nugget that you selected;

  3. Go to SE80, select "inactive objects" and your user and there, grouped into "local objects" you will find the objects created by SAPlink

  4. Now you can not only activate them you can also select a package and where you want to place them

An illustrative example:

![][4]

If you still have doubts read the manual.

And if you do need some type of object that SAPlink still does not support, why not consider contributing to developing a plugin for it yourself.

[http://www.saplink.org][5]

Note: In the past [I talked about another little program ][6] for this which enables the same thing. Well you may as well know that this is nothing in comparison because this one is a thousand times better.

Greetings from Abapinho.

   [1]: {{< ref "evernote" >}}
   [2]: https://cw.sdn.sap.com/cw/docs/DOC-145448
   [3]: https://cw.sdn.sap.com/cw/docs/DOC-144115
   [4]: images/saplink_ecra.png (Ecrã do SAPlink)
   [5]: http://www.saplink.org/
   [6]: {{< ref "downloadupload" >}}
