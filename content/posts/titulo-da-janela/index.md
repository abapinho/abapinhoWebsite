---
title: 'Nome do system SAP no título da janela'
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
O cliente onde estou a trabalhar tem mais sistemas SAP do que há vulcões no Chile. E, claro, é inevitável que eu tenha sempre montes de sessões abertas para vários destes sistemas. Ora, quando estão minimizados, não é possível saber a que sistema corresponde cada sessão. Quer dizer, não era, porque agora já é:

<!--more-->

Cria um ficheiro .REG no disco com o seguinte conteúdo e executa-o:

    Windows Registry Editor Version 5.00

    [HKEY_CURRENT_USERSoftwareSAPSAPGUI FrontSAP Frontend ServerAdministration]

    "ShowAdditionalTitleInfo"=dword:00000001

A partir de agora o nome do sistema aparece no início da descrição da janela do SAPGui.

![barra_windows][1]

Excelente, não?

Obrigado Nicolas Van Oost pela dica.

O Abapinho saúda-vos.

   [1]: images/barra_windows.png
