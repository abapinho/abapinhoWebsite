---
title: 'Insert variables in standard texts'
slug: mete-variaveis-dentro-de-textos-standard
date: 2012-04-30 10:00:06
tags: [i18n]
categories: [artigos]
wordpressId: 1652
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Everyone uses standard texts. But did you know that standard texts can have dynamic fields in the middle? SAP calls them "text symbols". The way to do it is identical to that of the old forms of the harmful SE71, in other words wrapping them in the & symbol. Thus: &KNA1-NAME1;&. It’s really handy. I’ll show you how it’s done.

<!--more-->

First of all you have to define the text in SO10. Choose an ID (which represents a group of texts), then a unique name for our text and finally the language in which you are going to define it:

![][1]

Next, define the text:

![so10b][2]

Now the text is defined you can get it anywhere using the READ_TEXT function. The result of this function is an internal table with the lines of the text:

![][3]

As you see, the dynamic fields to be replaced are still there. So far, everything is standard. Now comes the trick. We are going to use two functions for this: TEXT_SYMBOL_SETVALUE and TEXT_SYMBOL_REPLACE. The first must be invoked once for each text symbol to individually replace each one for the desired value. This just prepares these changes in the memory. The second function has to be invoked to make the changes effective. All together it is like this:


{{< highlight ABAP >}}
DATA: w_thead TYPE thead,
           t_tline TYPE STANDARD TABLE OF tline.

    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        id                      = 'ZZST'
        language                = 'P'
        name                    = 'ABAPINHO'
        object                  = 'TEXT'
      IMPORTING
        header                  = w_thead
      TABLES
        lines                   = t_tline
      EXCEPTIONS
        id                      = 1
        language                = 2
        name                    = 3
        not_found               = 4
        object                  = 5
        reference_check         = 6
        wrong_access_to_archive = 7
        OTHERS                  = 8.
   CHECK sy-subrc = 0.

*     Substitui valor da encomenda
        CALL FUNCTION 'TEXT_SYMBOL_SETVALUE'
          EXPORTING
            name  = '&VBAK-NETWR&'
            value = w_vbak-netwr.

*      Substitui moeda da encomenda
        CALL FUNCTION 'TEXT_SYMBOL_SETVALUE'
          EXPORTING
            name  = '&VBAK-WAERK&'
            value = w_vbak-waerk.

        CALL FUNCTION 'TEXT_SYMBOL_REPLACE'
          EXPORTING
            header = w_thead
          TABLES
            lines  = t_tline.
{{< /highlight >}}

If you look at the lines now you will see that the symbols have been replaced with the desired values.

The letter can now be sent to make another mother and child happy.

Greetings from Abapinho.

   [1]: images/so10a.png (so10a)
   [2]: images/so10b.png
   [3]: images/read_text.png (read_text)
