---
title: 'A classe CL_GUI_FRONTEND_SERVICES'
slug: a-classe-cl_gui_frontend_services
date: 2016-01-04 09:00:43
tags: [sapgui]
categories: [dicas]
wordpressId: 3358
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A classe CL_GUI_FRONTEND_SERVICES é frequentemente usada para fazer _upload_ e _download_ de ficheiros de e para o computador local. Mas ela consegue fazer muitos mais coisas boas. Por exemplo:

<!--more-->

Manipular o _clipboard_ :

  * CLIPBOARD_EXPORT

  * CLIPBOARD_IMPORT

Gerir pastas e ficheiros no computador local:

  * DIRECTORY_BROWSE

  * DIRECTORY_CREATE

  * DIRECTORY_DELETE

  * DIRECTORY_EXIST

  * DIRECTORY_GET_CURRENT

  * DIRECTORY_LIST_FILES

  * DIRECTORY_SET_CURRENT

  * FILE_COPY

  * FILE_DELETE

  * FILE_EXIST

  * FILE_GET_ATTRIBUTES

  * FILE_GET_SIZE

  * FILE_GET_VERSION

  * FILE_OPEN_DIALOG

  * FILE_SAVE_DIALOG

  * FILE_SET_ATTRIBUTES

Manipular variáveis de ambiente:

  * ENVIRONMENT_GET_VARIABLE

  * ENVIRONMENT_SET_VARIABLE

Executar comandos locais:

  * EXECUTE

Obter uma série de informações interessantes

  * GET_COMPUTER_NAME

  * GET_DESKTOP_DIRECTORY

  * GET_DRIVE_FREE_SPACE_MEGABYTE

  * GET_DRIVE_TYPE

  * GET_FILE_SEPARATOR

  * GET_FREE_SPACE_FOR_DRIVE

  * GET_GUI_PROPERTIES

  * GET_GUI_VERSION

  * GET_IP_ADDRESS

  * GET_LF_FOR_DESTINATION_GUI

  * GET_PLATFORM

  * GET_SAPGUI_DIRECTORY

  * GET_SAPGUI_WORKDIR

  * GET_SAPLOGON_ENCODING

  * GET_SYSTEM_DIRECTORY

  * GET_TEMP_DIRECTORY

  * GET_UPLOAD_DOWNLOAD_PATH

  * GET_USER_NAME

  * GET_WINDOWS_DIRECTORY

Manipular o registo do Windows:

  * REGISTRY_DELETE_KEY

  * REGISTRY_DELETE_VALUE

  * REGISTRY_GET_DWORD_VALUE

  * REGISTRY_GET_VALUE

  * REGISTRY_SET_DWORD_VALUE

  * REGISTRY_SET_VALUE

Tirar selfies:

  * GET_SCREENSHOT

E mais algumas coisas.

Como vês há métodos para todos os gostos. Espero que te seja útil.

Créditos da foto: [simonella_virus][1] via [VisualHunt.com][2] / [CC BY-NC-ND][3].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/simonella_virus/2322193421/
   [2]: https://visualhunt.com
   [3]: https://creativecommons.org/licenses/by-nc-nd/2.0/
