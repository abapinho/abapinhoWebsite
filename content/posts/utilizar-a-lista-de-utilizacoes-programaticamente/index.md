---
title: 'Utilizar a lista de utilizações programaticamente'
slug: utilizar-a-lista-de-utilizacoes-programaticamente
date: 2016-01-11 09:00:11
tags: []
categories: [dicas]
wordpressId: 3377
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
A ferramenta "lista de utilizações" é uma das mais queridas de um programador ABAP. Através dela conseguimos saber onde é que um objecto é utilizado. Parece pouco mas sabemos que é muito.

<!--more-->

Esta funcionalidade pode ser acedida programaticamente através da função RS_EU_CROSSREF.

Fica aqui um exemplo:


{{< highlight ABAP >}}
DATA: hits TYPE sytabix,
       t_findstrings TYPE STANDARD TABLE OF string,
       t_founds      TYPE STANDARD TABLE OF rsfindlst .

APPEND 'CL_GUI_FRONTEND_SERVICES' to t_findstrings.

CALL FUNCTION 'RS_EU_CROSSREF'
  EXPORTING
    i_find_obj_cls                     = 'CLAS'
*   no_dialog                          = 'X'
IMPORTING
   o_hits                             = hits
TABLES
   i_findstrings                      = t_findstrings
   o_founds                           = t_founds
EXCEPTIONS
   not_executed                       = 1
   not_found                          = 2
   illegal_object                     = 3
   no_cross_for_this_object           = 4 
   batch                              = 5
   batchjob_error                     = 6
   wrong_type                         = 7
   object_not_exist                   = 8
   OTHERS                             = 9.
{{< /highlight >}}

O parâmetro I_FIND_OBJ_CLS decide o que é que se está à procura. PROG para programas, DOMA para domínios, CLAS para classes, etc.
O parâmetro NO_DIALOG permite saltar a clássica caixa de diálogo onde podemos restringir a pesquisa a alguns tipos de objectos.

O Abapinho saúda-vos.
