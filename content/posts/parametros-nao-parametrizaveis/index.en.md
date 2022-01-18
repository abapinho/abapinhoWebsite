---
title: 'Unparameterisable parameters'
slug: parametros-nao-parametrizaveis
date: 2011-09-12 10:00:52
tags: [estilo]
categories: [dicas]
wordpressId: 995
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Every now and then you get a client who asks a programmer to create a write-protected parameter on the program selection screen. It’s a bit dumb given that the whole idea of parameters is that they are parameterisable.

But there you go, it takes all sorts.

Clients have so much imagination that SAP should create a cinema module, SAP CI, especially so they can screen all the films they carry around in their heads. I am sure some real sci-fi blockbusters would come out of it. And a few comedies too.

Well, if anyone asks you for this, do as follows:


{{< highlight ABAP >}}
REPORT ZTEST1.
PARAMETERS: nao_mexe LIKE mara-matnr DEFAULT '220705' MODIF ID ro.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF SCREEN-GROUP1 = 'RO' .
      SCREEN-INPUT = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

START-OF-SELECTION.
  WRITE: / nao_mexe.
{{< /highlight >}}

Seriously though, the idea of write-protecting parameters is interesting if it depends on the values of other parameters. For example, if ‘save file’ is checked, you can add the file name, if not, it is write-protected. Here’s my suggestion: just add the conditions you want to the code.

Greetings from Abapinho.
