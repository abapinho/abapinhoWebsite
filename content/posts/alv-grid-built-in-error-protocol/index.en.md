---
title: 'ALV Grid built in error protocol'
slug: alv-grid-built-in-error-protocol
date: 2017-09-11 09:00:20
tags: [alv, estilo]
categories: [artigos]
wordpressId: 3856
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
We're all lazy. It's just human. Programmers are human. We're often lazy when it comes to the way we program something. And usually being lazy when making a program will result in someone else having more work when maintaining it.

Let he who is free of laziness throw the first rock.

I won't!

<!--more-->

For a long time, when using editable ALV Grids, whenever I wanted to throw a data validation error, I'd use a MESSAGE or show a popup.

Being lazy prevented me from exploring all the available functionalities in ALV Grid and find out that it already contains an error management protocol. But now I know.

It works like this:

1\. When creating the ALV, create a method called HANDLE_DATA_CHANGED and register it as a handler for the ALV event DATA_CHANGED. You should also call the ALV Grid's method REGISTER_EDIT_EVENT so that it will throw this event whenever you press ENTER:

{{< highlight ABAP >}}
  SET HANDLER handle_data_changed FOR go_grid.
  go_grid->register_edit_event( cl_gui_alv_grid=>mc_evt_enter ).
{{< /highlight >}}

2\. Method HANDLE_DATA_CHANGED will be in charge or validating your data and updating the ALV's error protocol:

{{< highlight ABAP >}}
METHOD handle_data_changed.

  DATA: amount TYPE wrbtr,
        dummy.

  FIELD-SYMBOLS: <s_mod_cell> LIKE LINE OF er_data_changed->mt_mod_cells.

  LOOP AT er_data_changed->mt_mod_cells
    ASSIGNING <s_mod_cell>
    WHERE fieldname = ‘WRBTR’.

    er_data_changed->get_cell_value(
      EXPORTING
        i_row_id    = <s_mod_cell>-row_id
        i_fieldname = ‘WRBTR'
      IMPORTING
        e_value     = amount ).

    IF amount > 100.
      MESSAGE e003(ZMSG) INTO dummy.
      er_data_changed->add_protocol_entry(
        EXPORTING
          i_msgid     = SY-MSGID
          i_msgty     = SY-MSGTY
          i_msgno     = SY-MSGNO
          i_fieldname = ‘WRBTR'
          i_row_id    = <s_mod_cell>-row_id ).
    ENDIF.

  ENDLOOP.

ENDMETHOD.
{{< /highlight >}}

3\. Before saving, make sure the ALV data has no errors. This will usually be done somewhere inside the method USER_COMMAND. And to be sure everything is ok you just have to call this method:

{{< highlight ABAP >}}
go_grid->check_changed_data( IMPORTING e_valid = valid ).
IF valid.
  SAVE() “ grava dados / save data
ENDIF.
{{< /highlight >}}

If something's not right, the ALV Grid itself will display a modal window with the list of errors, both the internal ones (invalid date format, etc.) and the custom ones added by us using ADD_PROTOCOL_ENTRY().

I'm sorry that I was lazy. But from now on I'll start reporting my ALV Grid errors in a proper way.

Aprendi nestas duas discussões nos fóruns da SAP:
<https://archive.sap.com/discussions/thread/1509379>
<https://archive.sap.com/discussions/thread/1629201>

The cat picture I chose has nothing to do with the article. I decided to choose it because Abapinho seemed to be the only website in the whole Internet without cat pictures. Click bait! I hope this brings in new readers!

Greetings from Abapinho.
