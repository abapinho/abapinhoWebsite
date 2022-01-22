---
title: 'Ensina o ABAP a fazer malabarismo'
slug: processamento-paralelo
date: 2015-05-18 09:00:13
tags: [performance]
categories: [artigos]
wordpressId: 3049
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O que podemos fazer quando as noites não são suficientes para os processamentos diários?

<!--more-->
**Porquê?**

Com o passar dos tempos os sistemas SAP executam cada vez mais um volume de _jobs_ diários durante o período da noite. Mas o conceito de noite (entenda-se com menos utilizadores no sistema) facilmente se dissolve se considerarmos um sistema multi-geografia em que há utilizadores espalhados por todo o planeta. Estes _jobs_ são muitas vezes processos de integração/recálculo que podem envolver um volume considerável de dados.

Este tipo de processos normalmente são independentes, isto é, não é necessário esperar pela execução de um item do processo para podermos executar o próximo. Considerando estes pressupostos seria extremamente útil conseguir executá-los simultaneamente. Esta separação é possível implementando uma infraestrutura que permita processamento paralelo.

<!--more-->
**O que é?**

O processamento paralelo não é mais do que, como o nome indica, o processamento em simultâneo de tarefas independentes entre si. Um conceito similar às threads de algumas linguagens de programação OOP (C#, C++, Java).
Na prática o processamento paralelo é uma execução de RFC Assíncronos utilizando um RFC server group. Um RFC server group é um conceito criado pela SAP que permite configurar um identificador e associar múltiplos servidores aplicacionais bem como a percentagem de recursos disponíveis.

**Como funciona?**


{{< highlight ABAP >}}
CALL FUNCTION func STARTING NEW TASK task
              [DESTINATION {dest|{IN GROUP {group|DEFAULT}}}]
              [{PERFORMING subr}|{CALLING meth} ON END OF TASK]
              parameter_list.
{{< /highlight >}}

O elemento atómico desta abordagem será um módulo função _RFC enabled_ que se destine a processar um único item (ou um bloco de ítens, mas vamos simplificar para agora). E o ponto de ligação entre um RFC e o _RFC server group_ é a _keyword IN GROUP <nome definido na RZ12>_.

É também possível especificar um _callback_ de retorno, que será executado quando este processo terminar, _keyword PERFORMING subr ON END OF TASK_ ou _CALLING method ON END OF TASK_.

**Comparação entre processamento paralelo e processamento sequencial?**

Vamos ver um exemplo em que comparamos dois programas cujo objetivo é o mesmo. Vamos considerar o seguinte objetivo:

"Para cada país configurado no sistema na tabela T005 pretendemos efectuar um determinado cálculo e guardar o resultado numa tabela Z."

Para este efeito temos disponível um módulo de função "Z_PP_UNIT_TESTS" que será invocado pelos dois programas.


{{< highlight ABAP >}}
FUNCTION Z_PP_UNIT_TESTS.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     VALUE(DATA) TYPE  T005 OPTIONAL
*"  EXPORTING
*"     VALUE(RETURNINFO) TYPE  ZPP_EXECUTIONINFO
*"----------------------------------------------------------------------
  data: random_num  type qfranint,
        l_odd       type int4,
        l_count     type int4.

  returninfo-server = sy-host.
  CALL FUNCTION 'TH_GET_OWN_WP_NO'
    IMPORTING
      wp_pid = returninfo-wpinfo-wp_pid.

  WHILE 1 = 1.

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max = 100
        ran_int_min = 10
      IMPORTING
        ran_int     = random_num.

    l_odd = random_num mod 2.

    IF l_odd = 0.
      add 1 to l_count.
    ENDIF.

    IF data-XADDR = 'X' and l_count > 100000.
      exit.
    ELSEIF l_count > 150000.
      exit.
    ENDIF.
{{< /highlight >}}

**Processamento sequencial**

Pela sua extensão e complexidade apresentamos o código num ficheiro em separado que podes ver [aqui][1].

Mostro aqui a parte principal, o _loop_ :


{{< highlight ABAP >}}
  loop at it_t005 into wa_005.
    clear l_returninfo.

    CALL FUNCTION 'Z_PP_UNIT_TESTS'
      EXPORTING
        DATA       = wa_005
      IMPORTING
        RETURNINFO = l_returninfo.
    DO.
      ASSIGN COMPONENT sy-index OF STRUCTURE wa_005 TO <field>.
      IF sy-subrc NE 0.
        EXIT.
      ENDIF.
      move <field> TO tp_written.
      CONCATENATE tp_string_concat tp_written INTO tp_string_concat.
    ENDDO.
    wa_proc-info = tp_string_concat.
    wa_proc-server = l_returninfo-server.
    append wa_proc to git_processed.
  ENDLOOP.
{{< /highlight >}}

A medição:

[![processamento_sequencial_analise][2]][2]

O trace:

[![processamento_sequencial_trace][3]][3]

**Processamento paralelo**

O programa exemplo do processamento paralelo pode ser visto [aqui][4].

Mosto aqui apenas as partes principais, o _loop_ e a rotina de _callback_ :


{{< highlight ABAP >}}
  loop at it_t005_data into wa_005_data.
    l_tabix = sy-tabix.
    CONCATENATE 'Task' l_tabix into taskname.
    clear l_returninfo1.

    CALL FUNCTION 'Z_PP_UNIT_TESTS'
      STARTING NEW TASK taskname
      DESTINATION in group groupname
      PERFORMING callback_meth ON END OF TASK
      EXPORTING
        DATA                  = wa_005_data
      EXCEPTIONS
        resource_failure      = 1
        system_failure        = 2
        COMMUNICATION_FAILURE = 3.
    IF sy-subrc = 0.
      add 1 to gv_send.
      DO.
        ASSIGN COMPONENT sy-index OF STRUCTURE wa_005_data TO <field1>.
        IF sy-subrc NE 0.
          EXIT.
        ENDIF.
        WRITE <field1> TO tp_written1.
        CONCATENATE tp_string_concat1 tp_written1 INTO tp_string_concat1.
      ENDDO.
      wa_proc1-info = tp_string_concat1.
      append wa_proc1 to git_processed1.
    else.
      " Erro no processamento, efectuar nova tentativa? registar em log? ...
      " esperar pela libertação de recursos?
      " ...
    ENDIF.

  ENDLOOP.

  WAIT UNTIL gv_send >= gv_receive.
  " parallel processing is now finalized

----------------

FORM callback_meth using taskname.
  data: l_retinfo type ZPP_EXECUTIONINFO.

  RECEIVE RESULTS FROM FUNCTION 'Z_PP_UNIT_TESTS'
  IMPORTING
    returninfo = l_retinfo
    EXCEPTIONS
        resource_failure      = 1
        system_failure        = 2
        COMMUNICATION_FAILURE = 3.
  IF sy-subrc <> 0.
    " controlo de erros ... retry? log?
    " ...
  ENDIF.
  add 1 to gv_receive.

ENDFORM.                    "callback_meth
{{< /highlight >}}

A medição:

[![processamento_paralelo_analise][5]][5]

Os traces (são vários porque há vários processos a correr):

[![processamento_paralelo_trace4][6]][6]

[![processamento_paralelo_trace3][7]][7]

[![processamento_paralelo_trace2][8]][8]

[![processamento_paralelo_trace1][9]][9]

**Estou convencido, como utilizar?**

Para utilizarmos esta ferramenta temos que considerar alguns aspectos, entre eles:

  * Invocação do RFC com o respetivo _RFC Server Logon Group_ ;

  * Falta de recursos no _RFC Server Logon Group_ de momento;

  * Necessidade de codificar um callback por código.

Para contemplar estes e outros aspectos temos a necessidade de andar sempre com algum código atrás, isto é, a velha técnica do copiar, colar e alterar algumas coisas.

Para efeitos de simplificação criei uma _framework_ que permite simplificar este processo agrupando toda a lógica comum para que seja simples e práctico efectuar alterações de uma forma centralizada. Segue-se um exemplo da sua utilização:


{{< highlight ABAP >}}
report  zrep_pp_unit_test.

include zrep_pp_unit_test_top.
include zrep_pp_unit_test_dat.
include zrep_pp_unit_test_frm.

initialization.
  clear sp_loggr.
  sp_maxt = 3600.
  sp_tswt = 2.
  sp_maxr = 5.
  sp_tstn = 1.
  sp_logl = 0.

start-of-selection.

  " ****************************************************************
  " Retrieve some example data
  data: it_t005 type table of t005,
        l_input type int4.
  l_input = sp_lins.
  IF l_input > 0 and l_input < 255.
    " do nothing on purpose
  else.
    l_input = 10.
  ENDIF.

  select * into table it_t005 up to l_input rows from t005.

  try .
      " ************************************************************
      " Build instance
      l_pp_ref = zcl_pp_factory=>build_instance(
        pit_raw_data            = it_t005
        p_rfc_name              = 'Z_PP_UNIT_TESTS'
        p_logon_group           = sp_loggr
        p_max_execution_time    = sp_maxt
        p_task_wait_time        = sp_tswt
        p_task_max_retries      = sp_maxr
        p_task_wait_no_resource = sp_tstn
        p_log_level             = sp_logl ).

      " ************************************************************
      " Execute the processing
      l_pp_ref->run( ).

      " ************************************************************
      " Display results
      perform display_result using
                                l_pp_ref
                              changing
                                git_processed
                                git_unprocessed
                                git_error.

    catch zcx_pp_exception into cx.
      l_err = cx->if_message~get_text( ).
      message l_err type 'S' DISPLAY LIKE 'E'.
  endtry.
{{< /highlight >}}

**Onde posso obter a framework?**

Esta _framework_ foi elaborada para simplificar e mitigar a complexidade inerente à implementação de um processo que recorra ao processamento paralelo (criação do método com uma assinatura específica para _callback_ , código para controlar repetições e reprocessamentos que era constantemente copiado e colado, manutenção do código mais complexa, entre muitos outros problemas associados).

[Aqui está disponível][10] a documentação associada a esta _Framework_ bem como todo o código fonte disponibilizado no formato SAPLINK.

O António Vaz saúda-vos.

O Abapinho agradece a António Vaz e saúda-o.

   [1]: txt/processamento_sequencial.abap_.txt
   [2]: images/processamento_sequencial_analise.png
   [3]: images/processamento_sequencial_trace.png
   [4]: txt/processamento_paralelo.abap_.txt
   [5]: images/processamento_paralelo_analise.png
   [6]: images/processamento_paralelo_trace4.png
   [7]: images/processamento_paralelo_trace3.png
   [8]: images/processamento_paralelo_trace2.png
   [9]: images/processamento_paralelo_trace1.png
   [10]: https://scn.sap.com/people/antonio.vaz/blog/2014/03
