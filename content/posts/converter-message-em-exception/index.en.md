---
title: "It's now so simple to convert a MESSAGE into an EXCEPTION"
slug: converter-message-em-exception
date: 2019-11-04 10:30:44
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4304
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Some years agor I [showed how to convert a normal MESSAGE into a typified exception][1]. Meanwhile ABAP evolved a lot and now, since version 7.40, that complex solution is no longer needed.

<!--more-->

Now the EXCEPTION command allows you to directly create an exception from a MESSAGE.

The most obvious scenario: when in a method you need to call a standard function module, most times the function module returns a exception code with a MESSAGE in SYST. But the method needs to return an exception so we need to convert the former into the latter. Now, it couldn't be simpler:

Look at the following function which generates a MESSAGE when it returns an error:

{{< highlight ABAP >}}
    CALL FUNCTION 'CONVERT_OTF'
      EXPORTING
        format                = 'PDF'
      IMPORTING
        bin_file              = r_pdf
      TABLES
        otf                   = it_otf
        lines                 = t_lines
      EXCEPTIONS
        err_max_linewidth     = 1
        err_format            = 2
        err_conv_not_possible = 3
        err_bad_otf           = 4
        OTHERS                = 5.
    IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
{{< /highlight >}}

Belive it or not, you just need to add a single line to convert the MESSAGE into an EXCEPTION:

{{< highlight ABAP >}}
    CALL FUNCTION 'CONVERT_OTF'
      EXPORTING
        format                = 'PDF'
      IMPORTING
        bin_file              = r_pdf
      TABLES
        otf                   = it_otf
        lines                 = t_lines
      EXCEPTIONS
        err_max_linewidth     = 1
        err_format            = 2
        err_conv_not_possible = 3
        err_bad_otf           = 4
        OTHERS                = 5.
    IF sy-subrc <> 0.
        <b>RAISE EXCEPTION TYPE zcx_proj1</b>
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
{{< /highlight >}}

This works because RAISE EXCEPTION TYPE now accepts MESSAGE as a parameter with the exact same syntax as the MESSAGE command.

Greetings from Abapinho.

   [1]: {{< ref "converter-excepcao-em-classe-de-excepcao" >}}
