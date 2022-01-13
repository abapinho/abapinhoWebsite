---
title: 'Hey dad, look...no hands'
slug: olha-pai-agora-sem-maos
date: 2012-09-17 09:00:48
tags: [ui]
categories: [artigos]
wordpressId: 1948
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
In today's article I will show you (and explain!) how you can make a selection screen refresh itself on a regular basis without user intervention.

Are you ready?

<!--more-->

Our example shows a parameter that refreshes itself each second.

Because the code is simple I'll show it all at once and only then will explain it:


{{< highlight ABAP >}}
PARAMETERS : p_conta TYPE t DEFAULT 300.

CLASS lcl_handler DEFINITION. 
  PUBLIC SECTION.
    METHODS: corre_handler FOR EVENT finished OF cl_gui_timer. 
ENDCLASS. 

DATA o_temporizador TYPE REF TO cl_gui_timer .
DATA o_handler TYPE REF TO lcl_handler .

CLASS lcl_handler IMPLEMENTATION. 
  METHOD corre_handler. 
    CALL METHOD o_temporizador ->run. 
    CALL METHOD cl_gui_cfw =>set_new_ok_code 
      EXPORTING 
        new_code = 'REFR'.
  ENDMETHOD.
ENDCLASS.

INITIALIZATION.
  CREATE OBJECT o_temporizador. 
  CREATE OBJECT o_handler. 
  o_temporizador-> interval = '1' . 
  CALL METHOD o_temporizador-> run .
  SET HANDLER o_handler-> corre_handler FOR ALL INSTANCES. 

AT SELECTION-SCREEN OUTPUT . 
  p_conta = p_conta - 1 .
{{< /highlight >}}

The trick is in using CL_GUI_TIMER class in interaction with the event AT SELECTION-SCREEN OUTPUT.

  1. First we declare the parameter that should be automatically updated

  2. Then we declare a small class to implement the _handler_ of the event triggered by the end of the timer of CL_GUI_TIMER.

  3. Next we declare two instances, one from the timer (CL_GUI_TIMER) and another from our _handler_ LCL_HANDLER.

  4. INITIALIZATION event creates the timer and _handler_ objects, sets the timer and links your event to our _handler_.

  5. The implementation method _handler_ restarts the timer and launches an _OK code_ that refreshes the screen, running the event AT SELECTION-SCREEN OUPUT.

  6. Finally the event AT SELECTION-SCREEN OUTPUT only decreases our timer.

Quite simple, right? Any doubts?

Thank you Evil Saltine for the photo.

Greetings from Abapinho.
