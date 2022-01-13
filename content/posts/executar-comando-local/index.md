---
title: 'Executa um comando no teu computador'
slug: executar-comando-local
date: 2011-02-16 21:33:38
tags: []
categories: [dicas]
wordpressId: 646
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Imagina que queres executar um programa no teu PC a partir de um programa ABAP. Não sei porque carga de água quererás tu fazer isto mas ok, se queres mesmo fazer, é assim:


{{< highlight ABAP >}}
DATA: i_returncode TYPE i.
CALL FUNCTION 'GUI_EXEC'
  EXPORTING
    command    = 'Notepad.exe'
    parameter  = 'eu_sou_um_texto.txt'
  IMPORTING
    returncode = i_returncode.
{{< /highlight >}}

É provável que dê para fazer coisas boas com isto. Mas está à vista a grande javardice que se pode fazer por isso pensa bem antes de começares para aí a escangalhar os computadores dos utilizadores todos. Mantém-te do lado do bem se fazes favor.

O Abapinho saúda-vos.

_Actualização: ver alternativa mais actual no comentário de Carlos Valentini._
