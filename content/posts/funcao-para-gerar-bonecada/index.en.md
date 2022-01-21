---
title: 'Function to create cartoons'
slug: funcao-para-gerar-bonecada
date: 2013-11-11 09:00:47
tags: [sapgui]
categories: [dicas]
wordpressId: 2460
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Cartoons always look good in a report. In a SAPGui that is boredom in blue, the more colours and cartoons there are the better it is. Luís Rocha showed me a very convenient function to fill up a report with icons.

<!--more-->

The function is called ICON_CREATE and it can be used as follows, for example: First declare a button in the selection screen:

{{< highlight ABAP >}}
SELECTION-SCREEN PUSHBUTTON (40) isel_all VISIBLE LENGTH 4.
{{< /highlight >}}

Then define your text in the INITIALIZATION event. But insert the result of the function instead of the text:

{{< highlight ABAP >}}
INITIALIZATION.

  CALL FUNCTION 'ICON_CREATE'
    EXPORTING
      name   = icon_select_all
    IMPORTING
      result = isel_all.
{{< /highlight >}}

ICON_SELECT_ALL is the name of the icon. A list of all the possibilities can be found in the ICON table.
Try doing a SE16N to the ICON table and see how beautiful the table becomes.

Basically, the only thing this function does is convert the ID of the icon in the character string that defines it in SAP. But this does not make it less practical.

Extra tip: you can also use it to write icons on the screen with WRITE. I tried to use it to write a love letter to my girlfriend but I didn’t find the heart icon. It’s sad. Nevertheless, there are still enough icons for you to do a comic strip.

Greetings from Abapinho.
