---
title: 'Search object attributes in an internal table'
slug: atributos-de-objectos-em-tabelas-internas
date: 2012-03-26 10:00:17
tags: [estilo, oo]
categories: [artigos]
wordpressId: 1551
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
There are increasingly more objects in ABAP, gradually less fear of them and, lo and behold, more and more people are writing and using them. It is normal and desirable, if objects begin to appear everywhere, to start to stuff them into internal tables. I also stored a load of objects in tables a while back, unfortunately I did not know at that time what I am going to teach you here. It could have come in handy.

So, what exactly am I going to teach you here?

<!--more-->

I am going to teach you that searches can be done in an internal table using the public attributes of objects stored in that internal table as criteria. Understand? Now I’ve taught you that it can be done, I'm going to teach you how it is done.

Let’s advance by stages. First, the class. The class is very simple and allows only a key and a value to be stored:


{{< highlight ABAP >}}
CLASS my_class DEFINITION.
  PUBLIC SECTION.
    DATA: chave TYPE string,
          valor TYPE string.
ENDCLASS.                    "my_class DEFINITION

CLASS my_class IMPLEMENTATION.
  METHOD constructor.
    chave = i_chave.
    valor = i_valor.
  ENDMETHOD.                    "constructor
{{< /highlight >}}

Now we declare an internal table that contains objects of this class and we fill it in with two registries:


{{< highlight ABAP >}}
START-OF-SELECTION.

  TYPES: BEGIN OF ty_data,
           idx TYPE i,
           obj TYPE REF TO my_class,
         END OF ty_data.

  DATA: t_data TYPE STANDARD TABLE OF ty_data,
        w_data LIKE LINE OF t_data,
        o_obj TYPE REF TO my_class.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'S'
      i_valor = 'Sim'.
  w_data-idx = 1.
  w_data-obj = o_obj.
  APPEND w_data TO t_data.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'N'
      i_valor = 'Não'.
  w_data-idx = 2.
  w_data-obj = o_obj.
  APPEND w_data TO t_data.
{{< /highlight >}}

And now, with nothing hidden up our sleeves......the trick:


{{< highlight ABAP >}}
  READ TABLE t_data INTO w_data WITH KEY obj->chave = 'S'.
  IF sy-subrc = 0.
    WRITE w_data-obj->valor.
  ENDIF.
{{< /highlight >}}

And the result is..... “Yes”, it is possible to perform searches in internal tables, directly using the attributes of objects as criteria.

Taking it a stage further and mixing it with the recent [article about unstructured tables][1], we will now change the example to that of an unstructured internal table, i.e. only containing instances of the object. The class is exactly the same, so I won’t repeat it. Let’s begin with the declaration and filling in of the table. Note, in particular, the declaration of the internal table:


{{< highlight ABAP >}}
START-OF-SELECTION.

  DATA: t_obj TYPE TABLE OF REF TO my_class,
        o_obj TYPE REF TO my_class.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'S'
      i_valor = 'Sim'.
  APPEND o_obj TO t_obj.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'N'
      i_valor = 'Não'.
  APPEND o_obj TO t_obj.
{{< /highlight >}}

Let’s now use the special word TABLE_LINE to access the class attributes:


{{< highlight ABAP >}}
  READ TABLE t_obj INTO o_obj WITH KEY table_line->chave = 'S'.
  IF sy-subrc = 0.
    WRITE o_obj->valor.
  ENDIF.
{{< /highlight >}}

Thanks to Custodio Oliveira who left this tip in the comments on the [table_line][1].

(And thanks also to[diepuppenstubensammlerin][2] for the photograph.)

Greetings from Abapinho.

   [1]: {{< ref "tabela-interna-nao-estruturada" >}}
   [2]: http://www.flickr.com/photos/diepuppenstubensammlerin/6451375637/in/photostream/
