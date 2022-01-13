---
title: 'Serialization - Clone Dolly in ABAP'
slug: serializacao-abap
date: 2017-10-30 09:00:20
tags: [estilo, oo]
categories: [artigos]
wordpressId: 3882
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
This article was written by José Vília:

The Dolly sheep was alive in ABAP and I didn't know about it.

Having created a class instance, I'd like to share it with another totally independent program to use it as if the instance had been created there.

It's an ABAP Dolly sheep factory we're talking about here, people. Serialization in the ABAP world.

<!--more-->

The first thing we need is a class that implements interface IF_SERIALIZABLE_OBJECT:

[![Interface IF_SERIALIZABLE_OBJECT][1]][1]

Let's keep our class very simple: just one attribute, a constructor and a method:

[![Atributos da class][2]][2]

[![Métodos da classe][3]][3]

The constructor takes a parameter which is used to set the attribute and the method uses that attribute to diplay a message:

[![Construtor da classe][4]][4]

[![Método da classe][5]][5]

We'll be using a database table as a communication channel between the two programs. But it could also be an RFC call between two different systems. Or even an email!

The table:

[![Tabela de transporte][6]][6]

What follows is the code of both programs: the sender and the receiver. It should be simple enough for you to understand.

The sender will:

  1. instantiate the class;

  2. serialize it;

  3. save the result of the serialization in the database table.


{{< highlight ABAP >}}
report  zjrv_test_serialize.

types: ty_xline(1096)  type x,
       ty_ta_xline type standard table of ty_xline.
data: gt_tab_res         type ty_ta_xline.
data: gs_tab             like line of gt_tab_res.
data: gt_ser             type standard table of ztest_serialize.
data: gs_ztest_serialize type ztest_serialize.

data:  go_original       type ref to ZCL_TEST_SHARE_MESSAGE.

data gv_string    type string.
data gv_remaining type string.
data gv_int       type i.

parameters:
p_msg type string default 'HERE GOES DOLLY THE SHEEP'.

start-of-selection.

* Create Object
  create object go_original
    exporting
      i_text = p_msg.

* Transform the object into xstring.
  call transformation id_indent
    source obj = go_original
    result xml gt_tab_res.

  data gv_xstring type xstring.
  loop at gt_tab_res into gs_tab.
    concatenate gv_xstring gs_tab into gv_xstring in byte mode.
  endloop.

* handle the xtring as a string and put it into a db table
  gv_remaining = gv_xstring.
  do .
    gv_int =  strlen( gv_remaining ).
    if gv_int le 256.
      exit.
    endif.
    gv_string = gv_remaining(256).

    add 1 to gs_ztest_serialize-seq.
    gs_ztest_serialize-str = gv_string.
    append gs_ztest_serialize to gt_ser .
    gv_remaining = gv_remaining+256.
  enddo.

  if gv_remaining is not initial.
    add 1 to gs_ztest_serialize-seq.
    gs_ztest_serialize-str = gv_remaining.
    append gs_ztest_serialize to gt_ser .
  endif.

  modify ztest_serialize from table gt_ser .
  commit work and wait.
{{< /highlight >}}

The receiver will:

  1. Read the serialized instance from the database;

  2. Deserialize it, converting it again into an instance of the same class;

  3. Call the desired method

The method, which makes use of the class attribute, is the proof that the class state survived the cloning process.


{{< highlight ABAP >}}
report  zjrv_test_deserialize.

start-of-selection.

  data gv_xstring2 type xstring.
  data gt_ser type standard table of ztest_serialize.
  data gs_ser like line of gt_ser.
  data go_copy type ref to zcl_test_share_message .
  data gv_string type string.

  select *
  from ztest_serialize
  into table gt_ser.

  sort gt_ser by seq.

  clear gv_string.
  loop at gt_ser into gs_ser.
    concatenate gv_string gs_ser-str into gv_string .
  endloop.
  gv_xstring2 = gv_string.

  call transformation id_indent
    source xml gv_xstring2
    result obj = go_copy.

  go_copy->send_message( ).
{{< /highlight >}}

Serialization is very common in Java, C# and other more generic languages. But for some reason, ABAP uses it so seldomly that very few people know that it can be done. I hope this article lets more people know aobut this powerful and yet simple functionality. You'll not be using it every day. But that day may come in which it will be the perfect solution for your problem.

Note: the class code cannot change between the two different moments of its life, when it runs in the sender and when it is cloned in the receiver. Likewise, if the instance is sent between two different systems, boths these systems must share the exact same class. Otherwise, something will go wrong.

Thank you so much José Vília for this excelent contribution.

Greetings from Abapinho.

   [1]: images/serializar1.png
   [2]: images/serializar2.png
   [3]: images/serializar3.png
   [4]: images/serializar4.png
   [5]: images/serializar5.png
   [6]: images/serializar6.png
