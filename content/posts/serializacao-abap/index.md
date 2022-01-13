---
title: 'Serialização - Clona a Dolly em ABAP'
slug: serializacao-abap
date: 2017-10-30 09:00:20
tags: [estilo, oo]
categories: [artigos]
wordpressId: 3882
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Este artigo é da autoria de José Vília.

A ovelha Dolly está no ABAP e eu não sabia.

Depois de criar uma instância de uma classe, gostava de partilhá-la com outro programa totalmente independente para que este outro programa posso usá-la como se a tivesse instanciado.

Como se de uma fábrica de ovelhas Dollies se tratasse, o ABAP pode utilizar serialização para resolver o problema.

<!--more-->

Antes de mais necessito de criar uma classe que implemente a interface: IF_SERIALIZABLE_OBJECT

[![Interface IF_SERIALIZABLE_OBJECT][1]][1]

A nossa classe é muito simples, tendo só um atributo, um construtor e um método:

[![Atributos da class][2]][2]

[![Métodos da classe][3]][3]

No construtor, preencho o atributo; no método uso o atributo como uma mensagem:

[![Construtor da classe][4]][4]

[![Método da classe][5]][5]

A forma de comunicação a utilizar entre os dois programas será aqui uma tabela da base de dados. Mas poderia também ser uma chamada RFC entre diferentes sistemas. Ou até um email.

A tabela:

[![Tabela de transporte][6]][6]

Segue-se o código dois dois programas: o emissor e o receptor.

O programa emissor tem de:

  1. instanciar a classe;

  2. serializá-la para uma XSTRING;

  3. guardar o resultado da serialização na tabela da base de dados.


{{< highlight ABAP >}}
report  zjrv_test_serialize.

types: ty_xline(1096)  type x,
       ty_ta_xline type standard table of ty_xline.
data: gt_tab_res         type ty_ta_xline.
data: gs_tab             like line of gt_tab_res.
data: gt_ser             type standard table of ztest_serialize.
data: gs_ztest_serialize type ztest_serialize.

data:  go_original       type ref to ZCL_TEST_SHARE_MESSAGE.

data gv_string    type string.
data gv_remaining type string.
data gv_int       type i.

parameters:
p_msg type string default 'HERE GOES DOLLY THE SHEEP'.

start-of-selection.

* Create Object
  create object go_original
    exporting
      i_text = p_msg.

* Transform the object into xstring.
  call transformation id_indent
    source obj = go_original
    result xml gt_tab_res.

  data gv_xstring type xstring.
  loop at gt_tab_res into gs_tab.
    concatenate gv_xstring gs_tab into gv_xstring in byte mode.
  endloop.

* handle the xtring as a string and put it into a db table
  gv_remaining = gv_xstring.
  do .
    gv_int =  strlen( gv_remaining ).
    if gv_int le 256.
      exit.
    endif.
    gv_string = gv_remaining(256).

    add 1 to gs_ztest_serialize-seq.
    gs_ztest_serialize-str = gv_string.
    append gs_ztest_serialize to gt_ser .
    gv_remaining = gv_remaining+256.
  enddo.

  if gv_remaining is not initial.
    add 1 to gs_ztest_serialize-seq.
    gs_ztest_serialize-str = gv_remaining.
    append gs_ztest_serialize to gt_ser .
  endif.

  modify ztest_serialize from table gt_ser .
  commit work and wait.
{{< /highlight >}}

O programa receptor tem de:

  1. Ler a instância serializada da base de dados;

  2. Deserializá-la, convertendo-a novamente numa instância da mesma classe;

  3. Invocar o método desejado

O método, que utiliza um atributo da classe, prova que o estado da classe sobreviveu a esta clonagem.


{{< highlight ABAP >}}
report  zjrv_test_deserialize.

start-of-selection.

  data gv_xstring2 type xstring.
  data gt_ser type standard table of ztest_serialize.
  data gs_ser like line of gt_ser.
  data go_copy type ref to zcl_test_share_message .
  data gv_string type string.

  select *
  from ztest_serialize
  into table gt_ser.

  sort gt_ser by seq.

  clear gv_string.
  loop at gt_ser into gs_ser.
    concatenate gv_string gs_ser-str into gv_string .
  endloop.
  gv_xstring2 = gv_string.

  call transformation id_indent
    source xml gv_xstring2
    result obj = go_copy.

  go_copy->send_message( ).
{{< /highlight >}}

A serialização é algo muito comum em Java, C# e outras linguagens mais genéricas. Mas por alguma razão o ABAP faz tão pouco uso dela que pouca gente conhece estas possibilidades. Espero que este artigo dê a conhecer a mais gente esta funcionalidade tão poderosa mas tão simples e acessível. Não sendo algo de que se necessite frequentemente, pode ser a solução perfeita para algum problema bicudo que surja um dia.

Nota: o código da classe não pode mudar entre os dois momentos da sua vida, o primeiro quando corre no emissor e o segundo quando corre no receptor. Da mesma forma, caso a instância seja enviada entre dois sistemas diferentes, ambos os sistemas têm de ter exactamente iguais. Caso contrário a coisa correrá mal.

O Abapinho saúda-vos e agradece, contente, a José Vília pela excelente contribuição.

   [1]: images/serializar1.png
   [2]: images/serializar2.png
   [3]: images/serializar3.png
   [4]: images/serializar4.png
   [5]: images/serializar5.png
   [6]: images/serializar6.png
