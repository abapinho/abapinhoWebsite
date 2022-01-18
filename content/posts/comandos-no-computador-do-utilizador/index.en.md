---
title: 'Execute commands in the user’s computer'
slug: comandos-no-computador-do-utilizador
date: 2012-12-10 09:00:41
tags: [sapgui, sysadmin]
categories: [dicas]
wordpressId: 2084
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
It’s been a while since Abapinho played with fire. Today he will.

Because today he’ll show you how to execute DOS commands on the user’s local machine. After you finish reading this article, you’ll be ready to format the hard disks of all your users. Dealing with danger helps make us aware of the power we have and the responsibility that comes with it. Dear reader, listen to your conscience.

Don’t try this at home! Try it at the office ;)


{{< highlight ABAP >}}
DATA: i_returncode TYPE i.

CALL FUNCTION 'GUI_EXEC'
  EXPORTING
    command = 'FORMAT'     " This ain't  no HELLO WORLD!
*    parameter = 'T:'
  IMPORTING
        returncode = i_returncode.
{{< /highlight >}}

Hey, I was only joking. Don’t play with fire. You’ll get burnt.

Thanks to [alifaan][1] for the photo.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/alifaan/2608045107/
