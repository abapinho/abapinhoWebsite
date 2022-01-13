---
title: 'Deleting packages that do not want to be deleted'
slug: apagar-pacotes-que-nao-querem-ser-apagados
date: 2014-06-23 08:30:48
tags: []
categories: [dicas]
wordpressId: 2804
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When you try to delete a package where you have created objects that have meanwhile been deleted, and the package looks empty in SE80, when you try to delete it, it won’t work because it says the package still contains objects.

For some silly reason, SE80 does not show every type of object associated with packages. In addition, when an object is deleted, its entry is often times not deleted correctly. SAP is full of shortcomings. But it’s what we have, and it’s what brings us the bacon, so let’s not say too many bad things about it.

Abapinho has the solution for you.

<!--more-->

In the SE03 transaction, choose "Object Directory” and “Change Object Directory Entries”. Then, in “Other Restrictions”, enter the package you want to delete and execute.

Now you really do have a list of all the objects actually associated with the package you want to delete.

We presume that all of these objects have already been deleted. If not, they will have to be deleted directly in the individual transaction for this type of object.

You have two possibilities for deleted objects:

  * If the object was deleted in development, but still has to be transported to other systems, it is important that an entry exist in the directory for this object. The easiest is to create it again in the package to be deleted, move it to another package by recording this change in a transport order to be transported, and then delete it again;

  * If the object was never transported, you can simply delete it from the transport order where it is found.

Once this has been done, all you have to do is delete the lines, one by one, still on the above list obtained from SE03.

When the list only has the entry corresponding to the package itself, you can then go to SE80 to delete it.

Greetings from Abapinho.
