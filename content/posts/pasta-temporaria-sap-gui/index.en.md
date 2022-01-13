---
title: '<!--:pt-->Pasta temporária do SAP Gui<!--:-->'
slug: pasta-temporaria-sap-gui
date: 2011-12-05 10:00:09
tags: []
categories: [dicas]
wordpressId: 1161
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Sometimes a program wants to save a file locally on the user's computer via the SAP Gui. In these cases it is usual that one of the fields of the selection screen is the location of the folder on the local disk.

This is a way of initialising this field with the temporary folder of the SAP Gui:


{{< highlight ABAP >}}
PARAMETERS: p_path TYPE string.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.
  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING 
      initial_folder  = p_path
    CHANGING  
      selected_folder = p_path.

INITIALIZATION.
  CALL METHOD cl_gui_frontend_services=>get_sapgui_workdir
    CHANGING 
      sapworkdir = p_path.
  CALL METHOD cl_gui_cfw=>flush.
{{< /highlight >}}

Thanks to Sérgio Fraga for the tip.

And thank you [HatM][1] for the photo.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/hatm/4549870013/in/photostream/
