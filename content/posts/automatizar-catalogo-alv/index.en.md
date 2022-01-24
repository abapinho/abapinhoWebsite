---
title: 'Automating the ALV field catalogue'
slug: automatizar-catalogo-alv
date: 2011-12-12 10:00:00
tags: [alv, estilo, i18n]
categories: [artigos]
wordpressId: 1187
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Sometimes I ask myself what percentage of the world’s ABAP code is unnecessary. A paradigmatic example of how time can be wasted writing code which is of no use to anyone and only creates problems is the ALV’s all-too-common field description definition sitting directly in ABAP.

<!--more-->

Typical scenario:

  1. an internal table is defined

  2. data is input into this table

  3. the ALV field catalogue is built

  4. the ALV is presented

It is quite common for the field catalogue definition to run to hundreds of lines, which only define the order, data type or descriptions of each one of the fields.

The problem begins right in step 1, the data definition:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_data,
             campo1 TYPE char10,
             campo2 TYPE char15,
             campo3 TYPE char10,
             campo4 TYPE i,
          END OF ty_data.
DATA: t_data TYPE STANDARD TABLE OF ty_data.
{{< /highlight >}}

And it carries on into step 3 because, as this data definition does not set out a semantic context for each field, then, sure enough, the ALV field catalogue has to be built by hand:


{{< highlight ABAP >}}
DATA: o_table TYPE REF TO cl_salv_table,
          o_columns       TYPE REF TO cl_salv_columns.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = o_table
  CHANGING
    t_table      = t_data ).

o_columns = o_table->get_columns( ).

o_column = in_columns->get_column( 'CAMPO1' ).
o_column->set_short_text(  'Textito1' ).
o_column->set_medium_text( 'Texto 1' ).
o_column->set_long_text(   'Textão 1' ).

o_column = in_columns->get_column( 'CAMPO2' ).
o_column->set_short_text(  'Textito2' ).
o_column->set_medium_text( 'Texto 2' ).
o_column->set_long_text(   'Textão 2' ).

o_column = in_columns->get_column( 'CAMPO3' ).
o_column->set_short_text(  'Textito3' ).
o_column->set_medium_text( 'Texto 3' ).
o_column->set_long_text(   'Textão 3' ).

(etc... )

o_table->display( ).
{{< /highlight >}}

A very simple solution to avoid reflecting field descriptions in the code, is instead of defining the data structure directly in the code, use a DDIC structure in which each field has its semantic context properly defined through a data element that already contains the descriptions to be seen in the ALV. This way you don’t need to define neither the descriptions nor the order nor the field type programmatically as this will all be deduced automatically by the classes/functions of the ALV:


{{< highlight ABAP >}}
DATA: t_data TYPE STANDARD TABLE OF zxxxxx_alv,
          o_table TYPE REF TO cl_salv_table.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = o_table
  CHANGING
    t_table      = t_data ).

o_table->display( ).
{{< /highlight >}}

Tens or hundreds of programming lines are avoided, and furthermore, the fields can be translated this way, which is no small thing (crystallising descriptions in the code is always something to avoid). And if in the future a field description needs to be changed, you just have to modify the data element associated to it in the structure. A place for everything and everything in its place.

As an example, a real scenario I came across a few days ago: in a report that presented the data in an ALV, I was asked to add the option of saving the data into an Excel file instead. I implemented this option (using the wonderful ABAP2XLSX which I will talk about soon) and then I found that the names of the Excel columns were all ugly, like "CHAR10" or out of context like "Description" and "Text". I found that the program used a structure but its fields were defined with generic data elements. The field catalogue was modified by hand, with all the descriptions introduced programmatically. As ABAP2XLSX also has a field catalogue, the easiest and dumbest solution would be to add the descriptions to the ABAP2XLSX field catalogue too. But the best and healthiest solution was to define the data elements in the structure correctly. Then the fields appeared automatically both in the ALV and in the Excel. And you could also delete all the directly programmed descriptions from the program.

(Thanks [Editor B][1] for the image.)

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/editor/172690560/
