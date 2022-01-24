---
title: 'Se um desconhecido te oferecer valores, isso é Input'
slug: call-selection-screen
date: 2012-01-23 10:00:08
tags: [ui]
categories: [dicas]
wordpressId: 1356
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Num relatório, os valores são normalmente pedidos ao utilizador no ecrã de selecção inicial, antes da execução do programa. Mas e se quiseres pedir-lhe mais alguns valores, interactivamente, a meio da execução do programa?

Uma forma de o fazer é criar um ecrã com os campos desejados e depois invocá-lo com CALL SCREEN. Mas desenhar o ecrã e definir o PAI e o PBO é uma valente maçada.

Outra solução é recorrer às funções POPUP_GET_VALUES ou POPUP_GET_VALUES_DB_CHECKED. São bastante versáteis mas ainda assim algo chatas de utilizar e com algumas limitações.

Mas há uma forma mais simples de o fazer. É através do CALL SELECTION-SCREEN. Passo a explicar:

Primeiro há que definir o ecrã de selecção. A sua definição é praticamente igual à do ecrã de selecção inicial de um relatório:


{{< highlight ABAP >}}
TABLES: t001.

SELECTION-SCREEN BEGIN OF <b>SCREEN 3000</b>.
PARAMETERS: p_uname TYPE syuname.
SELECT-OPTIONS: p_bukrs FOR t001-bukrs.
SELECTION-SCREEN END OF <b>SCREEN 3000</b>.
{{< /highlight >}}

Depois, onde quer que te apeteça invocar o ecrã é só... invocares o ecrã:


{{< highlight ABAP >}}
START-OF-SELECTION.

* faz não sei quê antes

  <b>CALL SELECTION-SCREEN 3000 STARTING AT 5 5.</b>

* e mais não sei quê depois
{{< /highlight >}}

E dá nisto:

![CALL SELECTION-SCREEN][1]

Se meteres o STARTING AT ele vai criar uma janela de diálogo modal. Se não meteres nada, o ecrã ocupará a janela toda. O ecrã de selecção pode ser tão complicado quanto quiseres, podendo incluir abas e tudo o mais. Além disso, porque para o SAP ele não passa de um ecrã de selecção como os outros, poderás gravar variantes e tudo.

Nota que esta abordagem pode também ser usada em transacções, sendo a única desvantagem o facto de exigir F8 em vez de ENTER para submeter os valores.

_Obrigado a[cristinacosta][2] pela foto._

O Abapinho saúda-vos.

   [1]: images/call-selection-screen.png (CALL SELECTION-SCREEN)
   [2]: https://www.flickr.com/photos/cristinacosta/
