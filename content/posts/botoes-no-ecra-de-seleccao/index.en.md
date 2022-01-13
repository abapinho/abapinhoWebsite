---
title: 'Adding buttons to the selection screen'
slug: botoes-no-ecra-de-seleccao
date: 2012-04-16 10:00:45
tags: [ui]
categories: [dicas]
wordpressId: 1612
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Normally, when buttons must be generated for users to click, Screen Painter is used to create a screen which is then invoked by the report using CALL SCREEN. But, unless the screen being designed is already quite complex it is pointless creating a screen which will have no further use. Screens have always annoyed me.

I will demonstrate an example of using buttons on a completely normal selection screen resorting to a button called PUSHBUTTON and a very clever trick called ONLI.

<!--more-->

So let’s take it step-by-step as usual. First of all the screen statement:


{{< highlight ABAP >}}
REPORT zbotoes.

TABLES: sscrfields.
DATA: g_ucomm TYPE syucomm.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-200.
SELECTION-SCREEN PUSHBUTTON /1(35) p_but1 USER-COMMAND but1.
SELECTION-SCREEN PUSHBUTTON /1(35) p_but2 USER-COMMAND but2.
SELECTION-SCREEN PUSHBUTTON /1(35) p_but3 USER-COMMAND but3.
SELECTION-SCREEN END OF BLOCK b1.
{{< /highlight >}}

We use the PUSHBUTTONS and define the USER-COMMAND so that when they are pressed they instantly trigger the PAI of the screen (so-called AT SELECTION-SCREEN) without having to press ENTER or the F8 key.

Make a note of the statement tables SSCRFIELDS. This will be needed later in PAI to obtain the code for the button clicked.

The names of buttons P_BUT1, P_BUT2 and P_BUT3 are in fact variables that should contain the text that is to appear on the button. This is nothing short of bizarre and only shows that the guys who invented ABAP must have been drunk. But anyway, let’s define the texts:


{{< highlight ABAP >}}
INITIALIZATION.
  p_but1 = 'Carrega aqui'(001).
  p_but2 = 'Ou aqui'(002).
  p_but3 = 'Ou então aqui'(003).
{{< /highlight >}}

In this way we define the text of the buttons so that it can be translated [as explained earlier][1]. Next, PAI is implemented:


{{< highlight ABAP >}}
AT SELECTION-SCREEN.
* Se se carregou num dos botões, guarda o seu código e continua
  IF sscrfields-ucomm EQ 'BUT1' OR
      sscrfields-ucomm EQ 'BUT2' OR
      sscrfields-ucomm EQ 'BUT3'.
    g_ucomm = sscrfields-ucomm.
    sscrfields-ucomm = 'ONLI'. " Finge que carregou em F8. Belo truque ;)
  ENDIF.
{{< /highlight >}}

By redefining UCOMM as 'ONLI’ it is as though we have pressed the F8 key which moves the program along towards START-OF-SELECTION. And we move on:


{{< highlight ABAP >}}
START-OF-SELECTION.
  CASE g_ucomm.
    WHEN 'BUT1'.
      WRITE 'Carregaste no botão de cima'.
    WHEN 'BUT2'.
      WRITE 'Carregaste no botão do meio'.
    WHEN 'BUT3'.
      WRITE 'Carregaste no botão de baixo'.
ENDCASE.
{{< /highlight >}}

And the result is this:

![][2]

Got it? It’s unusual and it calls for a few nifty tricks but it’s no big deal. Enjoy.

Greetings from Abapinho.

   [1]: {{< ref "programas-poliglotas" >}}
   [2]: images/botoes-ecra-seleccao.png (Buttons on selection screen)
