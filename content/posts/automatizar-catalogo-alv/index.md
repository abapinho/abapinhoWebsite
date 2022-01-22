---
title: 'Automatizar catálogo de campos de ALV'
slug: automatizar-catalogo-alv
date: 2011-12-12 10:00:00
tags: [alv, estilo, i18n]
categories: [artigos]
wordpressId: 1187
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Às vezes pergunto-me qual será, no mundo, a percentagem de código ABAP desnecessário. Um exemplo paradigmático de como se pode desperdiçar tempo a escrever código que não serve para nada e só prejudica é a tão frequente definição das descrições dos campos de uma ALV directamente em ABAP.

<!--more-->

Cenário típico:

  1. define-se uma tabela interna

  2. preenche-se essa tabela com dados

  3. constrói-se o catálogo de campos da ALV

  4. apresenta-se a ALV

Não é incomum a definição do catálogo de campos extender-se por centenas de linhas, as quais se limitam a definir a ordem, o tipo de dados ou as descrições de cada um dos campos.

O problema começa logo no passo 1, a definição dos dados:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_data,
             campo1 TYPE char10,
             campo2 TYPE char15,
             campo3 TYPE char10,
             campo4 TYPE i,
          END OF ty_data.
DATA: t_data TYPE STANDARD TABLE OF ty_data.
{{< /highlight >}}

E continua no passo 3 porque, como esta definição de dados não explicita um contexto semântico para cada campo, depois, claro está, há que construir à mão o catálogo de campos da ALV:


{{< highlight ABAP >}}
DATA: o_table TYPE REF TO cl_salv_table,
          o_columns       TYPE REF TO cl_salv_columns.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = o_table
  CHANGING
    t_table      = t_data ).

o_columns = o_table->get_columns( ).

o_column = in_columns->get_column( 'CAMPO1' ).
o_column->set_short_text(  'Textito1' ).
o_column->set_medium_text( 'Texto 1' ).
o_column->set_long_text(   'Textão 1' ).

o_column = in_columns->get_column( 'CAMPO2' ).
o_column->set_short_text(  'Textito2' ).
o_column->set_medium_text( 'Texto 2' ).
o_column->set_long_text(   'Textão 2' ).

o_column = in_columns->get_column( 'CAMPO3' ).
o_column->set_short_text(  'Textito3' ).
o_column->set_medium_text( 'Texto 3' ).
o_column->set_long_text(   'Textão 3' ).

(etc... )

o_table->display( ).

{{< /highlight >}}

Ora uma solução muito simples para evitar estar a espalhar descrições dos campos pelo código é, em vez de definir a estrutura de dados directamente no código, usar uma estrutura do DDIC em que cada campo tem o seu contexto semântico devidamente definido através de um elemento de dados que contém já as descrições que se pretende ver aparecer no ALV. Assim, já não é preciso definir programaticamente nem as descrições nem a ordem nem o tipo dos campos pois tudo isto será deduzido automaticamente pelas classes/funções das ALV:


{{< highlight ABAP >}}
DATA: t_data TYPE STANDARD TABLE OF zxxxxx_alv,
          o_table TYPE REF TO cl_salv_table.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = o_table
  CHANGING
    t_table      = t_data ).

o_table->display( ).
{{< /highlight >}}

Poupam-se dezenas ou centenas de linhas no programa e além disso, desta forma os campos podem ser traduzidos, o que não é de pouca monta (cristalizar descrições no código é sempre de evitar). E se no futuro for necessário alterar a descrição de um campo basta modificar o elemento de dados a ele associado na estrutura. Cada coisa em seu lugar.

Como exemplo, um cenário real com que me deparei há uns dias: num relatório que apresentava os dados numa ALV foi-me pedido para adicionar a possibilidade de, ao invés, gravar os dados num Excel. Implementei esta opção (recorrendo ao fantástico ABAP2XLSX do qual falarei em breve) e depois constatei que os nomes das colunas no Excel eram todos feios tipo "CHAR10" ou descontextualizados tipo "Description" e "Text". Constatei que o programa até usava uma estrutura, mas os seus campos estavam definidos com elementos de dados genéricos. O catálogo de campos era modificado à mão sendo todas as descrições introduzidas programaticamente. Ora como o ABAP2XLSX também tem um catálogo de campos a solução mais simples e parva seria adicionar também as descrições ao catálogo de campos do ABAP2XLSX. Mas a solução melhor e mais saudável foi definir correctamente os elementos de dados da estrutura. Depois os campos passaram a aparecer automaticamente bem tanto no ALV como no Excel. E ainda pude apagar do programa todas as descrições directamente programadas.

(Obrigado [Editor B][1] pela imagem.)

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/editor/172690560/
