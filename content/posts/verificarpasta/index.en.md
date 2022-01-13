---
title: '<!--:pt-->Verificar pasta<!--:-->'
slug: verificarpasta
date: 2009-06-13 20:40:29
tags: []
categories: [dicas]
wordpressId: 90
draft: false
---
Eis uma função para verificar se uma pasta existe e se nela temos permissões de escrita.


{{< highlight ABAP >}}
PARAMETERS: p_dir TYPE btctext80 DEFAULT '/usr/sap/trans'.

CALL FUNCTION 'PFL_CHECK_DIRECTORY'
  EXPORTING
    directory = p_dir
    write_check = 'X'
* FILNAME = ' '
  EXCEPTIONS
    pfl_dir_not_exist = 1
    pfl_permission_denied = 2
    pfl_cant_build_dataset_name = 3
    pfl_file_not_exist = 4
    others = 5.

CASE sy-subrc.
  WHEN 0.
    WRITE /: 'Directory:', p_dir, ' exists'.
  WHEN 1.
    WRITE /: 'Directory does not exist:', p_dir.
  WHEN 2.
    WRITE /: 'No permission to write in directory:', p_dir.
ENDCASE.
{{< /highlight >}}

Obrigado Renato Oliveira.

O Abapinho saúda-vos.
