---
title: 'Teach ABAP to juggle'
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
What can be done when a night is not enough to complete the daily processes?

<!--more-->
**Why?**

In the course of time, the volume of daily jobs executed in the SAP systems that are processed during the night, keeps on increasing. However, the concept of night, that is, the time with less active users in the system, becomes more and more meaningless when considering a multi-country system where the users are distributed all over the world. Those jobs consist mostly of integration/recalculation processes, which may involve a substantial amount of data.

Theses types of processes are normally independent, i.e., they are not dependent on the execution of a particular item before processing the next. Taking this assumption into account, it would be extremely useful to be able to process the items parallelly. This separation can be achieved by implementing an infrastructure that allows for parallel processing.

<!--more-->
**What is parallel processing?**

Parallel processing, as the name refers, is nothing else than processing simultaneously those tasks, that are independent from each other. It is a similar concept as the threads in some of the OOP languages (C#, C++, Java).
In practice, parallel processing is the execution of asynchronous RFC, using an RFC server group. The RFC server group is an SAP concept that allows for configuring an identifier and associate multiple application servers as well as the percentage of available resources.

**How does it work?**


{{< highlight ABAP >}}
CALL FUNCTION func STARTING NEW TASK task
              [DESTINATION {dest|{IN GROUP {group|DEFAULT}}}]
              [{PERFORMING subr}|{CALLING meth} ON END OF TASK]
              parameter_list.
{{< /highlight >}}

The smallest constituent of this approach is an _RFC enabled_ function module, aimed at processing one single item (or a block of items, but let’s keep it simple for now). And the connecting point between an RFC and the _RFC server group_ is a _keyword IN GROUP <name defined in RZ12>_.

You can also define a return _callback_ , that is executed when this process is finished, _keyword PERFORMING subr ON END OF TASK_ or _CALLING method ON END OF TASK_.

**Comparing parallel and sequential processing**

Let’s have a look at an example that compares two programs which have the same objective. Let’s assume the following objective:

“For each country configured in the system in T005 table we want to run a specific calculation and store the result in a Z-table.”

To achieve this, we use the "Z_PP_UNIT_TESTS" function module, that will be invoked by both programs.


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

**Sequential Processing**

Due to the length and complexity of the code, we provide it separately in a file, that can be checked [here][1]

Here I show you the main part, the _loop_ :


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

Measurement:

[![processamento_sequencial_analise][2]][2]

Trace:

[![processamento_sequencial_trace][3]][3]

**Parallel processing**

The example program for parallel processing can be checked [here][4].

I show here only the main parts, the _loop_ and the _callback_ routine:


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

Measurement:

[![processamento_paralelo_analise][5]][5]

Traces (there are several because there are various processes running):

[![processamento_paralelo_trace4][6]][6]

[![processamento_paralelo_trace3][7]][7]

[![processamento_paralelo_trace2][8]][8]

[![processamento_paralelo_trace1][9]][9]

**I’m convinced. How can I use it?**

In order to use this tool we have to consider some aspects, such as:

  * Invoke the RFC with the respective _RFC Server Logon Group_ ;

  * Currently not enough resources in the _RFC Server Logon Group_ available;

  * Need to encode a callback by coding

To account for these and other aspects we always need to take back some coding, that is, use the old technique of copy, paste and change some stuff.

To make things easy, I created a framework that allows for simplifying this process by grouping all common logic, making it easy and practical to perform changes centrally. Here’s an example of how to use it:


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

**Where can I get this framework?**

This framework was created to simplify and reduce the complexity inherent to the implementation of a process that uses parallel processing (creation of the method with a specific signature for callback, code for controlling repetitions and reprocessing, which was constantly copied and pasted, more complex code maintenance, among many other associated problems).

[Get here][10] the associated documentation for this Framework, as well as all the source code provided in SAPLINK format.

Greetings from António Vaz.

From Abapinho, many thanks and greetings to António Vaz.

   [1]: https://abapinho.com/wp-content/uploads/2015/03/processamento_sequencial.abap_.txt
   [2]: images/processamento_sequencial_analise.png
   [3]: images/processamento_sequencial_trace.png
   [4]: https://abapinho.com/wp-content/uploads/2015/03/processamento_paralelo.abap_.txt
   [5]: images/processamento_paralelo_analise.png
   [6]: images/processamento_paralelo_trace4.png
   [7]: images/processamento_paralelo_trace3.png
   [8]: images/processamento_paralelo_trace2.png
   [9]: images/processamento_paralelo_trace1.png
   [10]: http://scn.sap.com/people/antonio.vaz/blog/2014/03
