---
title: 'Selection screen with tabs'
slug: ecra-seleccao-abas
date: 2012-01-16 10:00:23
tags: [ui]
categories: [dicas]
wordpressId: 1335
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
The selection screens of ABAP programs have several features that, although complex and easy to use, are generally ignored. Here, I will show you how easy it is to create tabs to better organise the parameters of a program. This time though, and uncommonly, I'll spare you the verbal onslaught. It’s a practical class.

<!--more-->

Let’s get stuck in then. Our selection screen will have 3 tabs that represent 3 different groups of parameters.

Since what has got to be is foremost, we start with the declaration of data:


{{< highlight ABAP >}}
REPORT  zzz_nfg_selscreen_tabs2.

TABLES: kna1.

DATA: ucomm1 LIKE sy-ucomm,
      ucomm2 LIKE sy-ucomm,
      ucomm3 LIKE sy-ucomm.
{{< /highlight >}}

The KNA1 table is declared because it will be used in SELECT-OPTIONS and the other three variables are declared because, although they are not used for anything, as will be seen, they have to be declared otherwise the program does not compile.

Now we declare the 3 sub-screens:

(...)

Now we have defined the sub-screens we just need to implement them in a TABBED BLOCK:

(...)

It’s easy, as you can see. The TAB1, TAB2 and TAB3 variables are implicitly declared and should contain the titles of the tabs. The UCOMM1, UCOMM2 and UCOMM3 variables have to be explicitly declared and they define the command that may be used in the SELECTION-SCREEN OUTPUT (equivalent to the PAI of the screens) to control any additional items, although in this case we are not going to use them for anything else.

The first block with P_UNAME is only there to show that the TABBED BLOCKS can coexist with other standard blocks.

The only thing left to do is define the titles of the tabs:


{{< highlight ABAP >}}
* Sub-ecrã: Filtros KNA1
SELECTION-SCREEN BEGIN OF SCREEN 3010 AS SUBSCREEN.
SELECT-OPTIONS: s_kunnr FOR kna1-kunnr,
                s_land1 FOR kna1-land1,
                s_ktokd FOR kna1-ktokd.
SELECTION-SCREEN END OF SCREEN 3010.

* Sub-ecrã: Opções
SELECTION-SCREEN BEGIN OF SCREEN 3020 AS SUBSCREEN.
PARAMETERS: p_opt1 AS CHECKBOX,
            p_opt2 AS CHECKBOX,
            p_opt3 AS CHECKBOX.
SELECTION-SCREEN END OF SCREEN 3020.

* Sub-ecrã: Ficheiro
SELECTION-SCREEN BEGIN OF SCREEN 3030 AS SUBSCREEN.
PARAMETERS: p_file TYPE rlgrap-filename DEFAULT '/ficheiro.txt'.
SELECTION-SCREEN END OF SCREEN 3030.
{{< /highlight >}}

That's it. And the result is this:

![Ecrã de selecção com abas][1]

From here it is the START-OF-SELECTION and the rest of the program is the same as it would be without tabs.

It’s still miles behind Adobe Flex, but it's better than nothing.

_Thank you to[ensee_89][2] for the photo._

Greetings from Abapinho.

   [1]: images/ecra-seleccao-abas.png (Ecrã de selecção com abas)
   [2]: http://www.flickr.com/photos/ensee/3092607303/
