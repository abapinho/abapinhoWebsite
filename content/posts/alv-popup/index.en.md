---
title: 'Multiple choice ALV in a modal dialogue box'
slug: alv-popup
date: 2011-12-19 10:00:31
tags: [alv, ui]
categories: [dicas]
wordpressId: 1249
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Do you know how to present an ALV with a list of records in a dialogue box allowing multiple choice? I didn’t. But I do now. Let me explain how.

<!--more-->

Pretend you want to choose some customers:


{{< highlight ABAP >}}
DATA: t_kna1 TYPE STANDARD TABLE OF kna1.

SELECT * FROM kna1 INTO TABLE t_kna1.
{{< /highlight >}}

Right, now we punch in all the clients into an internal table. The next step is to create the field catalogue:


{{< highlight ABAP >}}
  DATA: ls_fieldcat TYPE slis_fieldcat_alv,
        lt_fieldcat TYPE slis_t_fieldcat_alv.

  CLEAR ls_fieldcat.
  ls_fieldcat-row_pos   = '1'.
  ls_fieldcat-tabname   = 'T_KNA1'.

  ls_fieldcat-col_pos   = '1'.
  ls_fieldcat-fieldname = 'CHECKBOX'.
  ls_fieldcat-seltext_m = 'SELECT'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-col_pos   = '2'.
  ls_fieldcat-fieldname = 'KUNNR'.
  ls_fieldcat-seltext_m = 'Nº cliente'.
  ls_fieldcat-outputlen = 10.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-col_pos   = '3'.
  ls_fieldcat-fieldname = 'NAME1'.
  ls_fieldcat-seltext_m = 'Nome'.
  ls_fieldcat-outputlen = 35.
  APPEND ls_fieldcat TO lt_fieldcat.

{{< /highlight >}}

Of course the catalogue can be created automatically using the FM REUSE_ALV_FIELDCATALOG_MERGE if this is the case. But take care that for a multiple selection you will have to add a column called CHECKBOX (or the name you want).

Next we are going to create a table with the functions to be excluded from the ALV (so that instead of all the commands appearing, only OK and CANCEL appear:


{{< highlight ABAP >}}
  DATA: lt_excl     TYPE slis_t_extab,
        ls_excl     TYPE slis_extab.

  ls_excl-fcode = '&ETA'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '%SC'.  APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '%SC+'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&OUP'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&ODN'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&ILT'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&OL0'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRB'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRL'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRR'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRE'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&ALL'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&SAL'. APPEND ls_excl TO lt_excl.
{{< /highlight >}}

Then we call the magic function that makes the pop-up with the ALV appear:


{{< highlight ABAP >}}
  CALL FUNCTION 'REUSE_ALV_POPUP_TO_SELECT'
    EXPORTING
      i_zebra              = 'X'
      it_fieldcat          = lt_fiedcat
      i_tabname            = 'T_KNA1'
      i_screen_start_column = 1
      i_screen_start_line   = 1
      i_screen_end_column   = 100
      i_screen_end_line     = 25
      i_checkbox_fieldname = 'CHECKBOX'
    TABLES
      t_outtab             = t_kna1.
{{< /highlight >}}

This function brings up the pop-up that allows the user to choose one or more records. When the user presses OK or CANCEL, the program carries on and we can use the CHECKBOX field to define which lines it chooses:


{{< highlight ABAP >}}
  LOOP AT it_output INTO wa_output WHERE checkbox = 'X'.
"  Faz aqui o que te apeteceer
  ENDLOOP.
{{< /highlight >}}

And that’s it.

Thanks to [Ayelie][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/ayelie/441107616/
