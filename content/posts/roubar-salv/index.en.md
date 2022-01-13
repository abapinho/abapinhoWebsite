---
title: 'Steal data from a SALV'
slug: roubar-salv
date: 2013-10-14 10:04:02
tags: [salv, segredo]
categories: [artigos]
wordpressId: 2444
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
A friend of a friend of a friend said that a friend of his knew a friend who explained to him in a shady club bar in the docks area of Lisbon how to steal data from a SALV.

<!--more-->

Let’s assume there already exists a programme that displays your results in a SALV and they ask you to do something more to those data. Such as saving them in a file, or whatever. Until a short while ago, I thought I would have to change that programme and add some code to it before it presented the ALV, then get the data and do what I wanted with them. But imagine it’s a standard programme that cannot be changed. What do I do? Make a copy of the standard? That’s something to always be avoided.

The trick is to manipulate the environment around the ALV to ensure it is not displayed and then, without the SALV even noticing, go and get the results from the memory. It’s far-fetched, but nothing complicated. I’ll teach you how it’s done:

The first deception is to run a very special command that causes the data of the SALV not to be displayed.


{{< highlight ABAP >}}
cl_salv_bs_runtime_info=> set(
      display  = abap_false
      metadata = abap_false
      data     = abap_true ). 
{{< /highlight >}}

Sly. Veeeery sly.

Now that the environment is controlled you can order any programme to run that displays a SALV. Only, it won’t be displayed. So, you can do something like this:


{{< highlight ABAP >}}
SELECT-OPTIONS: so_budat FOR mkpf-budat.
SUBMIT rm07mlbd WITH datum IN so_budat AND RETURN.
{{< /highlight >}}

This report usually ends with a SALV. But not this time. This time it ends in silence.

Finally, to obtain the SALV data you need a second deception, a genuine sleight of hand:


{{< highlight ABAP >}}
DATA: ls_data TYPE REF TO data.

cl_salv_bs_runtime_info=>get_data_ref(
  IMPORTING r_data = ls_data ).
ENDTRY.
{{< /highlight >}}

And hey presto! The data of the SALV are in your possession. Now you can use them as you see fit:


{{< highlight ABAP >}}
FIELD-SYMBOLS: <lt_data> TYPE table,
               <l_data> TYPE data.
DATA: s_belege TYPE stab_belege.

ASSIGN ls_data->* TO <lt_data>.
LOOP AT <lt_data> ASSIGNING <l_data>.
  MOVE-CORRESPONDING <l_data> TO s_belege.
  WRITE: / s_belege-mblnr.
ENDLOOP. 
{{< /highlight >}}
{{< highlight ABAP >}}
FIELD-SYMBOLS: <lt_data> TYPE table,
               <l_data> TYPE data.
DATA: s_belege TYPE stab_belege.

ASSIGN ls_data->* TO <lt_data>.
LOOP AT <lt_data> ASSIGNING <l_data>.
  MOVE-CORRESPONDING <l_data> TO s_belege.
  WRITE: / s_belege-mblnr.
ENDLOOP. 
{{< /highlight >}}

Note that the GET_DATA_REF() method launches the exception CX_SALV_BS_SC_RUNTIME_INFO if something fails, so it would be convenient to wrap your call in a TRY CATCH block.

Thank you Luís Rocha for sharing the information from your friend’s friend of a friend of a friend.

Greetings from Abapinho.
