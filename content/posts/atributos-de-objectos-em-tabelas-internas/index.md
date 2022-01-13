---
title: 'Pesquisar por atributos de objectos em tabelas internas'
slug: atributos-de-objectos-em-tabelas-internas
date: 2012-03-26 10:00:17
tags: [estilo, oo]
categories: [artigos]
wordpressId: 1551
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Há cada vez mais objectos em ABAP, cada vez menos medo deles e, vê só!, cada vez mais gente a escrevê-los e a usá-los. Ora, se começam a aparecer objectos por todo o lado, é normal e desejável que comecem a enfiá-los também dentro de tabelas internas. Também eu guardei há uns tempos um monte de objectos dentro de tabelas mas infelizmente na altura não sabia disto que vou ensinar aqui. Tinha-me dado jeito.

Mas afinal o que vou eu ensinar aqui?

<!--more-->

Eu, aqui, vou ensinar que se pode fazer pesquisas numa tabela interna usando como critérios atributos públicos de objectos guardados dentro dessa tabela interna. Compreendeste? Agora que já ensinei que se pode fazê-lo, vou ensinar como se faz.

Vamos por partes. Primeiro a classe. A classe é muito simples e permite apenas guardar uma chave e um valor:


{{< highlight ABAP >}}
CLASS my_class DEFINITION.
  PUBLIC SECTION.
    DATA: chave TYPE string,
          valor TYPE string.
ENDCLASS.                    "my_class DEFINITION

CLASS my_class IMPLEMENTATION.
  METHOD constructor.
    chave = i_chave.
    valor = i_valor.
  ENDMETHOD.                    "constructor
{{< /highlight >}}

Agora declaramos uma tabela interna que contenha objectos desta classe e preenchemo-la com dois registos:


{{< highlight ABAP >}}
START-OF-SELECTION.

  TYPES: BEGIN OF ty_data,
           idx TYPE i,
           obj TYPE REF TO my_class,
         END OF ty_data.

  DATA: t_data TYPE STANDARD TABLE OF ty_data,
        w_data LIKE LINE OF t_data,
        o_obj TYPE REF TO my_class.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'S'
      i_valor = 'Sim'.
  w_data-idx = 1.
  w_data-obj = o_obj.
  APPEND w_data TO t_data.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'N'
      i_valor = 'Não'.
  w_data-idx = 2.
  w_data-obj = o_obj.
  APPEND w_data TO t_data.
{{< /highlight >}}

E agora, nada nas mangas,... o truque:


{{< highlight ABAP >}}
  READ TABLE t_data INTO w_data WITH KEY obj->chave = 'S'.
  IF sy-subrc = 0.
    WRITE w_data-obj->valor.
  ENDIF.
{{< /highlight >}}

E o resultado é... "Sim", é possível fazer pesquisas a tabelas internas, usando directamente como critérios os atributos de objectos.

Levando a coisa um pouco mais longe e misturando-a com o recente [artigo sobre tabelas não estruturadas ][1], vamos alterar agora o exemplo para o caso de uma tabela interna não estruturada, ou seja, que contém apenas instâncias do objecto. A classe é exactamente a mesma, por isso não a repito. Partamos da declaração e preenchimento da tabela. Notem em particular a declaração da tabela interna:


{{< highlight ABAP >}}
START-OF-SELECTION.

  DATA: t_obj TYPE TABLE OF REF TO my_class,
        o_obj TYPE REF TO my_class.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'S'
      i_valor = 'Sim'.
  APPEND o_obj TO t_obj.

  CREATE OBJECT o_obj
    EXPORTING
      i_chave = 'N'
      i_valor = 'Não'.
  APPEND o_obj TO t_obj.
{{< /highlight >}}

E agora utilizamos a palavra especial TABLE_LINE para aceder aos atributos da classe:


{{< highlight ABAP >}}
  READ TABLE t_obj INTO o_obj WITH KEY table_line->chave = 'S'.
  IF sy-subrc = 0.
    WRITE o_obj->valor.
  ENDIF.
{{< /highlight >}}

Obrigado a Custodio Oliveira que deixou esta dica no comentário sobre o [table_line][1].

(E obrigado a [diepuppenstubensammlerin][2] pela foto)

O Abapinho saúda-vos.

   [1]: {{< ref "tabela-interna-nao-estruturada" >}}
   [2]: http://www.flickr.com/photos/diepuppenstubensammlerin/6451375637/in/photostream/
