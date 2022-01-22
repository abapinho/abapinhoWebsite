---
title: 'Pasta temporária do SAP Gui'
slug: pasta-temporaria-sap-gui
date: 2011-12-05 10:00:09
tags: []
categories: [dicas]
wordpressId: 1161
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Por vezes um programa quer gravar um ficheiro localmente, no computador do utilizador através do SAP Gui. Nesses casos é comum que um dos campos do ecrã de selecção seja a localização da pasta no disco local.

Eis uma forma de inicializar esse campo com a pasta temporária do SAP Gui:


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

Obrigado Sérgio Fraga pela dica.

E obrigado [HatM][1] pela foto.

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/hatm/4549870013/in/photostream/
