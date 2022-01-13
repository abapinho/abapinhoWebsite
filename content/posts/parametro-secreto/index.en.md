---
title: 'Abracadabra reveals secret parameter'
slug: parametro-secreto
date: 2017-10-23 09:00:29
tags: [sapgui]
categories: [dicas]
wordpressId: 3875
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Here's a not very orthodox wat to deal with a report's selection screen.

Sometimes you may need to have a special parameter which you prefer to hide from normal users but still need access to. Example: a flag to activate a debug/trace mode. I'll show you how you can do this by just typing the magic word, ABRACADABRA.

It goes like this:


{{< highlight ABAP >}}
DATA: unhide_parameters TYPE flag.

PARAMETERS: p_debug AS CHECKBOX.

AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN 'ABRACADABRA'.
      unhide_parameters = abap_true.
    WHEN 'NORMAL'.
      CLEAR unhide_parameters.
  ENDCASE.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-name = 'P_DEBUG' AND unhide_parameters IS INITIAL.
      screen-active = 0.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
{{< /highlight >}}

Just type ABRACADABRA when you're at the selection screen and your secret parameter will magically show. If needed, you can then type NORMAL to make it disappear again.

O Abapinho saúda-vos.
