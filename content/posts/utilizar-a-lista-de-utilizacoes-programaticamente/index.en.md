---
title: 'Use the "where used" tool in a program'
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
The "where used" tool is very dear to any ABAP developer. Through it one can find out where a given object is used. Doesn't look like much but we all know how important this is.

<!--more-->

This tool can be accessed directly in code using function module RS_EU_CROSSREF.

Here's an example:


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

Parameter I_FIND_OBJ_CLS chooses the type of object you're working on: PROG para programas, DOMA para domínios, CLAS para classes, etc.
Parameter NO_DIALOG allows you to skip the classic dialog box where you get to restrict the search to just some object types.

Greetings from Abapinho.
