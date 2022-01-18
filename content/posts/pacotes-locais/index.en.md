---
title: 'Local $PACKAGES'
slug: pacotes-locais
date: 2016-11-07 09:00:37
tags: [estilo, segredo]
categories: [artigos]
wordpressId: 3595
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'pacotes locais'
description: 'Afinal há mais para além do $TMP. Aprende aqui como criar pacotes locais para os objectos que não pretendes que sejam transportados.'
---
Any object created in SAP must belong to a package.

Until recently, whenever I needed to create a program for a quick test I'd put it in the $TMP package. This way I was sure that it would never be transported to another system.

But sometimes I have the need to create stuff in the development system which, even though it should never be transported, should stay there forever. For example, development tools like ZSAPLINK and abapGit. But if we put everything under package $TMP it will soon be a big mess.

<!--more-->

The solution I had found for this consisted in creating one ZPACKAGE for each of these tools, clearing the package's transport layer. This way I could be sure it would not be transported.

But, even though it serves no purpose, this still forces me to add the package and all its objects to a Transport Request. Since I recently lost permissions to create/delete transport requests (because everything is now handled by Solution Manager), I was stuck.

How would I manage my local objects now?

Fortunately necessity is the mother of invention. Well, in this case I didn't invent anything. I just found something.

I found that $TMP isn't the only local package after all. Actually, any package starting with a $ is local and doesn't even need to be associated with a transport request.

Wonderful.

Now it's simple: I created the $DEVTOOLS package and now, whenever I need a new tool I create a $TOOL package under $DEVTOOLS and put all the tool's objects inside it.

Greetings from Abapinho.
