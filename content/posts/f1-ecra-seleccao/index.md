---
title: 'F1 nos campos do ecrã de selecção'
slug: f1-ecra-seleccao
date: 2012-07-09 09:00:07
tags: []
categories: [dicas]
wordpressId: 1817
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Acabaste de fazer um belíssimo relatório encabeçado por um ecrã de selecção atafulhado de campos muito interessantes. Mas o mais normal é que, se tiver alguma complexidade, quem correr o teu relatório não saiba para que serve cada um dos campos. Para isso há, claro, as especificações técnica e funcional. Há? E mesmo que haja, não seria mais simples se ela pudesse fazer F1 em cima de cada campo e logo ali aprender para que serve?

Vou mostrar-te duas formas possíveis de dares informação individualizada sobre os campos de um ecrã de selecção.

<!--more-->

A primeira utiliza uma simples mensagem da SE91; a segunda recorre aos textos da SE61. Ambas fazem uso do seguinte evento:


{{< highlight ABAP >}}
AT SELECTION-SCREEN ON HELP-REQUEST FOR campo.
{{< /highlight >}}

**Alternativa A - Mensagem da SE91**

Este caso não podia ser mais simples. Escolhes a mensagem e mostra-la com o comando MESSAGE no evento ON HELP-REQUEST.

**Alternativa B - Texto da SE61**

  1. Vai à transacção SE61;

  2. Escolhe a classe "Texto geral" e o idioma que usares;

  3. Introduz o "Nome" que desejares;

  4. Carrega em "Criar";

  5. Compõe o texto (vê o exemplo aqui na imagem);

  6. Grava;

  7. No programa, no evento ON HELP-REQUEST invoca a função DSYS_SHOW_FOR_F1HELP conforme o programa aqui exemplificado.


{{< highlight ABAP >}}
REPORT zzz_abapinho_f1_selscreen.

PARAMETERS: p_uname1 TYPE syuname. "Assassino
PARAMETERS: p_uname2 TYPE syuname. "Vítima

AT SELECTION-SCREEN ON HELP-REQUEST FOR p_uname1.
  CALL FUNCTION 'DSYS_SHOW_FOR_F1HELP'
    EXPORTING
      dokclass         = 'TX'
      doklangu         = sy-langu
      dokname          = 'ZZZ_ABAPINHO_UNAME1_F1'
*      doktitle         = 'Aqui metes um título opcional'
    EXCEPTIONS
      class_unknown    = 1
      object_not_found = 2
      OTHERS           = 3.

AT SELECTION-SCREEN ON HELP-REQUEST FOR p_uname2.
  MESSAGE i052(00).
{{< /highlight >}}

Como este artigo é sobre ajuda decidi ilustrá-lo com o Palácio Nacional da Ajuda, claro.

Obrigado a [Morgaine][1] pela foto.

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/morgaine/3976750744/
