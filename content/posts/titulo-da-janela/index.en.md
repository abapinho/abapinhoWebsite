---
title: 'SAP system name in the window title'
slug: titulo-da-janela
date: 2013-01-21 09:00:20
tags: [sapgui]
categories: [dicas]
wordpressId: 2136
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
The client where I'm working at the moment owns more SAP systems than the number of volcanoes in Chile. And, of course, it's inevitable to have multiple sessions open for several of those systems. With the windows minimized it's impossible to know the matching between systems and sessions. I mean, it was impossible, because today that's already possible:

<!--more-->

Create a .REG file in the disc with the following content and then execute it:

    Windows Registry Editor Version 5.00

    [HKEY_CURRENT_USERSoftwareSAPSAPGUI FrontSAP Frontend ServerAdministration]

    "ShowAdditionalTitleInfo"=dword:00000001

From now on the name of the system shows up in the beginning of SAPGui window description.

![barra_windows][1]

Excellent, right?

Thank you Nicolas Van Oost for the tip.

Greetings from Abapinho.

   [1]: images/barra_windows.png
