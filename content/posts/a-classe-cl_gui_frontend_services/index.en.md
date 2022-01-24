---
title: 'Class CL_GUI_FRONTEND_SERVICES'
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
Class CL_GUI_FRONTEND_SERVICES is commonly used to upload and download files from and to the user's local computer. But it can do many more good things. For example:

<!--more-->

Manipulate the _clipboard_ :

  * CLIPBOARD_EXPORT

  * CLIPBOARD_IMPORT

Manage folders and files on the local computer:

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

Read and write environment variables:

  * ENVIRONMENT_GET_VARIABLE

  * ENVIRONMENT_SET_VARIABLE

Execute local commands:

  * EXECUTE

Gather a lot of interesting information:

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

Manipulate Window's registry:

  * REGISTRY_DELETE_KEY

  * REGISTRY_DELETE_VALUE

  * REGISTRY_GET_DWORD_VALUE

  * REGISTRY_GET_VALUE

  * REGISTRY_SET_DWORD_VALUE

  * REGISTRY_SET_VALUE

Take selfies:

  * GET_SCREENSHOT

As you can see there is a method for everyone. I hope you find this useful.

Greetings from Abapinho.
