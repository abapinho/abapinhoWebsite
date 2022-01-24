---
title: 'Ecrãs de selecção com abas'
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
Os ecrãs de selecção dos programas ABAP têm várias funcionalidades que, embora sofisticadas e simples de usar, são geralmente ignoradas. Aqui mostrar-te-ei quão simples é criar abas para melhor organizar os parâmetros de um programa. Desta vez, excepcionalmente, vou poupar-te à verborreia. É uma aula prática.

<!--more-->

Vamos lá. O nosso ecrã de selecção terá 3 abas que representam 3 grupos distintos de parâmetros.

Como o que tem que ser tem muita força, comecemos pela declaração de dados:


{{< highlight ABAP >}}
REPORT  zzz_nfg_selscreen_tabs2.

TABLES: kna1.

DATA: ucomm1 LIKE sy-ucomm,
      ucomm2 LIKE sy-ucomm,
      ucomm3 LIKE sy-ucomm.
{{< /highlight >}}

A tabela KNA1 é declarada porque vai ser usada em SELECT-OPTIONS e as outras 3 variáveis são declaradas porque, embora como irão constatar, não sejam usadas para nada, é preciso declará-las senão o programa não compila.

Agora declaramos os 3 sub-ecrãs:


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

Agora que temos os sub-ecrãs definidos é só aplicá-los num TABBED BLOCK:


{{< highlight ABAP >}}
* Bloco normalíssimo só porque sim
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.
PARAMETERS: p_uname TYPE uname OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

* Tabbed strip
SELECTION-SCREEN BEGIN OF TABBED BLOCK tabs FOR 3 LINES.
SELECTION-SCREEN TAB (15) tab1 USER-COMMAND ucomm1 DEFAULT SCREEN 3010.
SELECTION-SCREEN TAB (30) tab2 USER-COMMAND ucomm2 DEFAULT SCREEN 3020.
SELECTION-SCREEN TAB (15) tab3 USER-COMMAND ucomm3 DEFAULT SCREEN 3030.
SELECTION-SCREEN END OF BLOCK tabs.
{{< /highlight >}}

Como vês, é simples. As variáveis TAB1, TAB2 e TAB3 são declaradas implicitamente e deverão conter os títulos das abas. Já as variáveis UCOMM1, UCOMM2 e UCOMM3 têm de ser declaradas explicitamente e definem o comando que poderá ser usado no SELECTION-SCREEN OUTPUT (equivalente ao PAI dos ecrãs) para controlar qualquer coisa adicional, mas neste caso não as vamos usar para mais nada.

O primeiro bloco com o P_UNAME está ali só para mostrar que os TABBED BLOCKS podem conviver com outros blocos normais.

Só falta definirmos os títulos das abas:


{{< highlight ABAP >}}
INITIALIZATION.
  tab1 = 'Filtros KNA1'(t01).
  tab2 = 'Opções'(t02).
  tab3 = 'Ficheiro'(t03).
{{< /highlight >}}

Já está. E o resultado é este:

![Ecrã de selecção com abas][1]

A partir daqui é o START-OF-SELECTION e o resto do programa é igual ao que seria sem as abas.

Ainda está a milhas do Adobe Flex, mas é melhor do que nada.

_Obrigado a[ensee_89][2] pela foto._

O Abapinho saúda-vos.

   [1]: images/ecra-seleccao-abas.png (Ecrã de selecção com abas)
   [2]: https://www.flickr.com/photos/ensee/
