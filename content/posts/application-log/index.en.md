---
title: '<!--:pt-->O maravilhoso mundo do Application Log<!--:-->'
slug: application-log
date: 2009-09-19 09:51:49
tags: []
categories: [artigos]
wordpressId: 159
draft: false
---
Uma boa parte dos reports, interfaces ou jobs, têm de produzir algum tipo de relatório. É normal ver isso feito recorrendo ao comando WRITE. Ora nos dias que correm, usar o comando WRITE para isto é como recorrer a um par de pedras para acender uma fogueira. Afinal, porque não usar o Application Log que é muito mais simples e prático e standard e é só vantagens?

[![Application log][1]][2]

O Application Log é um sistema standard do SAP para guardar logs aplicacionais e é usado por várias transacções standard. Ao utilizá-lo podemos simplificar e uniformizar os logs dos nossos programas. Vamos aprender aqui como é simples usá-lo nos nossos desenvolvimentos.

<!--more-->
**Como usar?**

Durante a execução de um programa, vamos acumulando mensagens no log. No final podemos optar por apresentar as mensagens no ecrã e/ou gravá-las na base de dados para posterior consulta na SLG1. Há casos em que não faz sentido guardar para a posterioridade; outros há, como os jobs, em que não faz sentido apresentá-los no ecrã. Nota: caso o objectivo seja só apresentar o log no ecrã, não é necessário definir um objecto/sub-objecto.

**Mas como usar??**

Funciona assim:

  1. Configurar o objecto e sub-objecto (na SLG0);

  2. Inicializar log (definindo os seus objecto e sub-objecto);

  3. Adicionar-lhe mensagens até que a voz nos doa;

  4. Gravando-o na base de dados (para mais tarde recordar na SLG1);

  5. Apresentar o log no ecrã.

Segue-se uma descrição detalhada de cada passo. No final do artigo deixo-vos o código de um grupo de funções Z feito por um amigo meu que simplifica ainda mais a utilização do Application Log.

**0\. Configurar na SLG0**

A transacção SLG0 permite fazer a manutenção dos **objectos** e **sub-objectos** , os dois identificadores que servem para identificar os logs. Trolha que contém 2 interfaces e um job diário. Então na SLG0 pode definir-se o objecto ZTROLHA e debaixo destes um sub-objecto para cada um dos programas específicos: INTER1, INTER2, JOB1. O objecto tem de começar por Z ou Y; já os sub-objectos começam pelo que bem se entender.

**1\. Inicializar**

A partir daqui vamos usar módulos de funções do grupo de funções SBAL. A função para inicializar o log é a BAL_LOG_CREATE. No entanto, esta inicialização só é necessária caso se deseje vir a guardar o log na base de dados. Se o objectivo for apenas apresentá-lo no ecrã este passo pode ser ignorado.

{{< highlight ABAP >}}
  DATA: wa_log TYPE bal_s_log.

  wa_log-object = object.
  wa_log-subobject = subobject.
  wa_log-alprog = sy-repid.            

  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = wa_log
    IMPORTING
      e_log_handle            = log_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.
{{< /highlight >}}
Há que guardar este log_handle. No caso de querermos gerir mais que um log ao mesmo tempo, é este log_handle que permite distingui-los.

2\. Amealhar

A função BAL_LOG_MSG_ADD serve para adicionar mensagens ao log.

{{< highlight ABAP >}}
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = log_handle
        i_s_msg          = msg
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.
{{< /highlight >}}
Como boa prática sugiro evitar mensagens dinâmicas. [Ver a dica aqui no Abapinho sobre isso][3].

3\. Gravar

{{< highlight ABAP >}}
  CALL FUNCTION 'BAL_DB_SAVE'
    EXPORTING
      i_t_log_handle   = it_log_handle[]
    EXCEPTIONS
      log_not_found    = 1
      save_not_allowed = 2
      numbering_error  = 3
      OTHERS           = 4.
{{< /highlight >}}
Pronto. Assim fica guardado para a posteridade. Normalmente usamos só um log ao mesmo tempo mas esta função pede uma tabela interna de log_handles. Enfim, é fazê-la.

4\. Apresentar no ecrã

{{< highlight ABAP >}}
  CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
    EXPORTING
*      i_s_display_profile  = display_profile
      i_t_log_handle       = it_log_handle[]
      i_amodal             = space
    EXCEPTIONS
      profile_inconsistent = 1
      internal_error       = 2
      no_data_available    = 3
      no_authority         = 4
      OTHERS               = 5.
{{< /highlight >}}
Esta função apresenta o(s) log(s) no ecrã. De notar o parâmetro display_profile que está comentado. Esse parâmetro permite configurar a forma como os logs são apresentados. O grupo de funções tem lá várias funções para configurar isto.

Pronto. Simples, não?

Mas para ficar ainda mais simples, aqui fica um grupo de funções Z feito pelo meu amigo letão Reinis Dzenis que pode ser usado em vez do standard:

{{< highlight ABAP >}}
FUNCTION-POOL z_application_log.            "MESSAGE-ID ..

CONSTANTS: object_zall TYPE balobj_d VALUE 'ZALL'.

* Global log handle
DATA: it_log_handle TYPE bal_t_logh,
         log_handle TYPE balloghndl.

FUNCTION z_appl_log_initialize .
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"  EXCEPTIONS
*"      INIT_ERROR
*"--------------------------------------------------
  DATA: wa_log TYPE bal_s_log.

* Initialize current log object
  CLEAR: log_handle.

* Log object
  IF object IS NOT INITIAL.
    wa_log-object = object.
  ELSE.
    wa_log-object = object_zall.
  ENDIF.

* Log subobject
  wa_log-subobject = subobject.
* External ID
  wa_log-extnumber = extnumber.
* Report
  wa_log-alprog = repid.

* Initialize log
  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = wa_log
    IMPORTING
      e_log_handle            = log_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
    RAISE init_error.
  ENDIF.

* Collect log handles in table
  INSERT log_handle INTO TABLE it_log_handle.

ENDFUNCTION.              

FUNCTION z_appl_log_write.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(MSG) TYPE  BAL_S_MSG OPTIONAL
*"     REFERENCE(MSG_TAB) TYPE  BAL_T_MSG OPTIONAL
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID OPTIONAL
*"  EXCEPTIONS
*"      INIT_ERROR
*"      WRITE_ERROR
*"--------------------------------------------------
  FIELD-SYMBOLS:  LIKE LINE OF msg_tab.

* Initialize log if needed
  IF log_handle IS INITIAL.
    CALL FUNCTION 'Z_APPL_LOG_INITIALIZE'
      EXPORTING
        object     = object
        subobject  = subobject
        extnumber  = extnumber
        repid      = repid
      EXCEPTIONS
        init_error = 1
        OTHERS     = 2.
    IF sy-subrc <> 0.
      RAISE init_error.
    ENDIF.
  ENDIF.

* Write passed message to log (if there is some...)
  IF msg IS NOT INITIAL.
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = log_handle
        i_s_msg          = msg
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.
    IF sy-subrc <> 0.
      RAISE write_error.
    ENDIF.
  ENDIF.

* Write passed table of messages to log (if there are some...)
  LOOP AT msg_tab ASSIGNING .
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = log_handle
        i_s_msg          = 
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.
    IF sy-subrc <> 0.
      RAISE write_error.
    ENDIF.
  ENDLOOP.

ENDFUNCTION.

FUNCTION z_appl_log_write_msg_syst.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"  EXCEPTIONS
*"      NO_SYST_MESSAGE
*"      WRITE_ERROR
*"--------------------------------------------------

  DATA: msg_type    TYPE msgty,
        msg_id      TYPE msgid,
        msg_no      TYPE msgno.

* Check if SYST contains valid message
  IF sy-msgty IS INITIAL OR
     sy-msgid IS INITIAL.
    RAISE no_syst_message.
  ENDIF.

* Write Message to Log
  CALL FUNCTION 'Z_APPL_LOG_WRITE_MSG'
    EXPORTING
      msg_type    = sy-msgty
      msg_id      = sy-msgid
      msg_no      = sy-msgno
      msg_v1      = sy-msgv1
      msg_v2      = sy-msgv2
      msg_v3      = sy-msgv3
      msg_v4      = sy-msgv4
      object      = object
      subobject   = subobject
      extnumber   = extnumber
      repid       = repid
    EXCEPTIONS
      write_error = 1
      OTHERS      = 2.
  IF sy-subrc <> 0.
    RAISE write_error.
  ENDIF.

ENDFUNCTION.

FUNCTION z_appl_log_from_bapiret.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(BAPIRET2) TYPE  BAPIRET2_T
*"  CHANGING
*"     REFERENCE(BAL_MSG_TAB) TYPE  BAL_T_MSG
*"--------------------------------------------------
  DATA: bal_msg LIKE LINE OF bal_msg_tab.
  FIELD-SYMBOLS:  LIKE LINE OF bapiret2.

  LOOP AT bapiret2 ASSIGNING .
    CLEAR: bal_msg.
*   Save message via message class and no
    IF -id IS NOT INITIAL.
      bal_msg-msgty = -type.
      bal_msg-msgid = -id.
      bal_msg-msgno = -number.
      bal_msg-msgv1 = -message_v1.
      bal_msg-msgv2 = -message_v2.
      bal_msg-msgv3 = -message_v3.
      bal_msg-msgv4 = -message_v4.
      INSERT bal_msg INTO TABLE bal_msg_tab.
*   Save message as text
    ELSEIF -message IS NOT INITIAL.
      bal_msg-msgty = -type.
      bal_msg-msgid = 'ZAPPLOG'.
      bal_msg-msgno = '000'.
      bal_msg-msgv1(50) = -message(50).
      bal_msg-msgv2(50) = -message+50(50).
      bal_msg-msgv3(50) = -message+100(50).
      bal_msg-msgv4(50) = -message+150(50).
      INSERT bal_msg INTO TABLE bal_msg_tab.
    ENDIF.
  ENDLOOP.

ENDFUNCTION.

FUNCTION z_appl_log_write_bapiret.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(BAPIRET2) TYPE  BAPIRET2_T
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"  EXCEPTIONS
*"      BAPIRET_INITIAL
*"      WRITE_ERROR
*"--------------------------------------------------
  DATA: bal_msg_tab TYPE bal_t_msg.

* See if valid BAPIRET was passed
  IF bapiret2[] IS INITIAL.
    RAISE bapiret_initial.
  ENDIF.

* Create Application Log Message from BAPIRET
  CALL FUNCTION 'Z_APPL_LOG_FROM_BAPIRET'
    EXPORTING
      bapiret2    = bapiret2[]
    CHANGING
      bal_msg_tab = bal_msg_tab[].

* Write Application Log Message
  CALL FUNCTION 'Z_APPL_LOG_WRITE'
    EXPORTING
      msg_tab     = bal_msg_tab[]
      object      = object
      subobject   = subobject
      extnumber   = extnumber
      repid       = repid
    EXCEPTIONS
      init_error  = 1
      write_error = 2
      OTHERS      = 3.
  IF sy-subrc <> 0.
    RAISE write_error.
  ENDIF.

ENDFUNCTION.

FUNCTION z_appl_log_write_text.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(MSG_TXT) TYPE  CHAR200
*"     REFERENCE(MSG_TYPE) TYPE  MSGTY DEFAULT 'I'
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"  EXCEPTIONS
*"      WRITE_ERROR
*"--------------------------------------------------
  DATA: msg TYPE bal_s_msg.

  msg-msgty = msg_type.
  msg-msgid = 'ZAPPLOG'.
  msg-msgno = '000'.
  msg-msgv1(50) = msg_txt(50).
  msg-msgv2(50) = msg_txt+50(50).
  msg-msgv3(50) = msg_txt+100(50).
  msg-msgv4(50) = msg_txt+150(50).

  CALL FUNCTION 'Z_APPL_LOG_WRITE'
    EXPORTING
      msg         = msg
      object      = object
      subobject   = subobject
      extnumber   = extnumber
      repid       = repid
    EXCEPTIONS
      init_error  = 1
      write_error = 2
      OTHERS      = 3.
  IF sy-subrc <> 0.
    RAISE write_error.
  ENDIF.

ENDFUNCTION.

FUNCTION Z_APPL_LOG_READ_FROM_DB .
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(EXTERNALID) TYPE  BALNREXT
*"  EXPORTING
*"     REFERENCE(MSG_TAB) TYPE  BAL_T_MSG
*"--------------------------------------------------

  DATA: ls_bal_s_lfil TYPE bal_s_lfil,
        ls_bal_s_extn TYPE bal_s_extn,
        lt_msg_handle TYPE bal_t_msgh,
        ls_msg_handle LIKE LINE OF lt_msg_handle,
        ls_msg TYPE bal_s_msg,
        l_line TYPE string,
        lt_log_header TYPE balhdr_t.

* Configure filter with external id
  ls_bal_s_extn-sign = 'I'.
  ls_bal_s_extn-option = 'EQ'.
  ls_bal_s_extn-low = externalid.
  APPEND ls_bal_s_extn TO ls_bal_s_lfil-extnumber.

* The log is still in memory so we use
* this function to get message headers
  CALL FUNCTION 'BAL_GLB_SEARCH_MSG'
    EXPORTING
      i_s_log_filter = ls_bal_s_lfil
    IMPORTING
      e_t_msg_handle = lt_msg_handle
    EXCEPTIONS
      msg_not_found  = 1
      OTHERS         = 2.
  IF sy-subrc NE 0.
    CALL FUNCTION 'BAL_DB_SEARCH'
      EXPORTING
        i_s_log_filter     = ls_bal_s_lfil
      IMPORTING
        e_t_log_header     = lt_log_header
      EXCEPTIONS
        log_not_found      = 1
        no_filter_criteria = 2
        OTHERS             = 3.
    CALL FUNCTION 'BAL_DB_LOAD'
      EXPORTING
        i_t_log_header     = lt_log_header
      IMPORTING
        e_t_msg_handle     = lt_msg_handle
      EXCEPTIONS
        no_logs_specified  = 1
        log_not_found      = 2
        log_already_loaded = 3
        OTHERS             = 4.
  ENDIF.

* Get messages and write them to the log file
  refresh msg_tab.
  LOOP AT lt_msg_handle INTO ls_msg_handle.
    CLEAR ls_msg.
    CALL FUNCTION 'BAL_LOG_MSG_READ'
      EXPORTING
        i_s_msg_handle                 = ls_msg_handle
      IMPORTING
        e_s_msg                        = ls_msg
*     E_EXISTS_ON_DB                 =
*     E_TXT_MSGTY                    =
*     E_TXT_MSGID                    =
*     E_TXT_DETLEVEL                 =
*     E_TXT_PROBCLASS                =
*     E_TXT_MSG                      =
*     E_WARNING_TEXT_NOT_FOUND       =
      EXCEPTIONS
        log_not_found                  = 1
        msg_not_found                  = 2
        OTHERS                         = 3.
    append ls_msg to msg_tab.
  ENDLOOP.

ENDFUNCTION.       

FUNCTION z_appl_log_db_save .
*"--------------------------------------------------
*"*"Local interface:
*"  EXCEPTIONS
*"      LOG_NOT_INITIALIZED
*"      DB_SAVE_ERROR
*"--------------------------------------------------
* See if log has been initialized
  IF it_log_handle[] IS INITIAL.
    RAISE log_not_initialized.
  ENDIF.

* Try to save log to DB
  CALL FUNCTION 'BAL_DB_SAVE'
    EXPORTING
      i_t_log_handle   = it_log_handle[]
    EXCEPTIONS
      log_not_found    = 1
      save_not_allowed = 2
      numbering_error  = 3
      OTHERS           = 4.
  IF sy-subrc <> 0.
    RAISE db_save_error.
  ENDIF.

ENDFUNCTION.

FUNCTION z_appl_log_display.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(MODE) TYPE  NUM1 DEFAULT '0'
*"  EXCEPTIONS
*"      LOG_NOT_INITIALIZED
*"      DISPLAY_ERROR
*"--------------------------------------------------
  DATA: display_profile TYPE bal_s_prof.

* See if log has been initialized
  IF it_log_handle[] IS INITIAL.
    RAISE log_not_initialized.
  ENDIF.

  CASE mode.
    WHEN '0'.
      CALL FUNCTION 'BAL_DSP_PROFILE_STANDARD_GET'
        IMPORTING
          e_s_display_profile = display_profile.
    WHEN '1'.
      CALL FUNCTION 'BAL_DSP_PROFILE_NO_TREE_GET'
        IMPORTING
          e_s_display_profile = display_profile.
    WHEN '2'.
      CALL FUNCTION 'BAL_DSP_PROFILE_POPUP_GET'
        IMPORTING
          e_s_display_profile = display_profile.
    WHEN '3'.
      CALL FUNCTION 'BAL_DSP_PROFILE_SINGLE_LOG_GET'
        IMPORTING
          e_s_display_profile = display_profile.
    WHEN OTHERS.
      CALL FUNCTION 'BAL_DSP_PROFILE_STANDARD_GET'
        IMPORTING
          e_s_display_profile = display_profile.
  ENDCASE.

* Display log
  CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
    EXPORTING
      i_s_display_profile  = display_profile
      i_t_log_handle       = it_log_handle[]
      i_amodal             = space
    EXCEPTIONS
      profile_inconsistent = 1
      internal_error       = 2
      no_data_available    = 3
      no_authority         = 4
      OTHERS               = 5.
  IF sy-subrc <> 0.
    RAISE display_error.
  ENDIF.

ENDFUNCTION.

FUNCTION z_appl_log_clear.
*"--------------------------------------------------
*"*"Local interface:
*"--------------------------------------------------
  FIELD-SYMBOLS:  LIKE LINE OF it_log_handle.

* Remove all created logs
  LOOP AT it_log_handle ASSIGNING .
    CALL FUNCTION 'BAL_LOG_REFRESH'
      EXPORTING
        i_log_handle  = 
      EXCEPTIONS
        log_not_found = 1
        OTHERS        = 2.
  ENDLOOP.

  REFRESH: it_log_handle[].
  CLEAR:   log_handle.

ENDFUNCTION.

FUNCTION z_appl_log_get_handle.
*"--------------------------------------------------
*"*"Local interface:
*"  EXPORTING
*"     REFERENCE(E_LOG_HANDLE) TYPE  BALLOGHNDL
*"     REFERENCE(ET_LOG_HANDLE) TYPE  BAL_T_LOGH
*"  EXCEPTIONS
*"      NO_HANDLE
*"--------------------------------------------------
* See if log is initialized
  IF it_log_handle[] IS INITIAL AND log_handle IS INITIAL.
    RAISE no_handle.
  ENDIF.

  e_log_handle    = log_handle.
  et_log_handle[] = it_log_handle[].

ENDFUNCTION.

FUNCTION z_appl_log_write_param.
*"--------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(PARAMETER)
*"     REFERENCE(MSG_TYPE) TYPE  MSGTY DEFAULT 'I'
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"  EXCEPTIONS
*"      WRITE_ERROR
*"--------------------------------------------------
  DATA: msg_txt TYPE char200,
        tmp     TYPE string.

  DATA: fieldname TYPE fieldname,
        ddtext    TYPE ddtext.

* Spell fieldname
  CALL FUNCTION 'Z_SPELL_FIELDNAME'
    EXPORTING
      field     = parameter
    IMPORTING
      ddtext    = ddtext
      fieldname = fieldname.

  IF parameter IS INITIAL.
    CONCATENATE: 'SELECTION:' ddtext 'is empty'
    INTO msg_txt SEPARATED BY space.
  ELSE.
    WRITE: parameter TO msg_txt.
    SHIFT msg_txt LEFT DELETING LEADING space.
    CONCATENATE: 'SELECTION:' ddtext 'is equal to' msg_txt
    INTO msg_txt SEPARATED BY space.
  ENDIF.

* Write to log...
  CALL FUNCTION 'Z_APPL_LOG_WRITE_TEXT'
    EXPORTING
      msg_txt     = msg_txt
      msg_type    = msg_type
      object      = object
      subobject   = subobject
      extnumber   = extnumber
      repid       = repid
    EXCEPTIONS
      write_error = 1
      OTHERS      = 2.
  IF sy-subrc <> 0.
    RAISE write_error.
  ENDIF.

ENDFUNCTION.
{{< /highlight >}}

Paldies Reinis!

O Abapinho saúda-vos.

Actualização: aqui fica o código dos módulos de função em falta:


{{< highlight ABAP >}}
FUNCTION z_appl_log_initialize .
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"     REFERENCE(UNAME) TYPE  SY-UNAME DEFAULT SY-UNAME
*"  EXCEPTIONS
*"      INIT_ERROR
*"----------------------------------------------------------------------
  DATA: wa_log TYPE bal_s_log.

* Initialize current log object
  CLEAR: log_handle.

* Log object
  IF object IS NOT INITIAL.
    wa_log-object = object.
  ELSE.
    wa_log-object = object_zall.
  ENDIF.

* Log subobject
  wa_log-subobject = subobject.
* External ID
  wa_log-extnumber = extnumber.
* Report
  wa_log-alprog = repid.
* User name
  wa_log-aluser = uname.

* Initialize log
  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = wa_log
    IMPORTING
      e_log_handle            = log_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
    RAISE init_error.
  ENDIF.

* Collect log handles in table
  INSERT log_handle INTO TABLE it_log_handle.

ENDFUNCTION.

FUNCTION z_appl_log_write.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(MSG) TYPE  BAL_S_MSG OPTIONAL
*"     REFERENCE(MSG_TAB) TYPE  BAL_T_MSG OPTIONAL
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"     REFERENCE(UNAME) TYPE  SY-UNAME DEFAULT SY-UNAME
*"  EXCEPTIONS
*"      INIT_ERROR
*"      WRITE_ERROR
*"----------------------------------------------------------------------
  FIELD-SYMBOLS: <msg> LIKE LINE OF msg_tab.

* Initialize log if needed
  IF log_handle IS INITIAL.
    CALL FUNCTION 'Z_APPL_LOG_INITIALIZE'
      EXPORTING
        object     = object
        subobject  = subobject
        extnumber  = extnumber
        repid      = repid
        uname      = uname
      EXCEPTIONS
        init_error = 1
        OTHERS     = 2.
    IF sy-subrc <> 0.
      RAISE init_error.
    ENDIF.
  ENDIF.

* Write passed message to log (if there is some...)
  IF msg IS NOT INITIAL.
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = log_handle
        i_s_msg          = msg
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.
    IF sy-subrc <> 0.
      RAISE write_error.
    ENDIF.
  ENDIF.

* Write passed table of messages to log (if there are some...)
  LOOP AT msg_tab ASSIGNING <msg>.
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = log_handle
        i_s_msg          = <msg>
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.
    IF sy-subrc <> 0.
      RAISE write_error.
    ENDIF.
  ENDLOOP.
ENDFUNCTION.

FUNCTION z_appl_log_write_msg.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(MSG_TYPE) DEFAULT 'I'
*"     REFERENCE(MSG_ID)
*"     REFERENCE(MSG_NO)
*"     REFERENCE(MSG_V1) OPTIONAL
*"     REFERENCE(MSG_V2) OPTIONAL
*"     REFERENCE(MSG_V3) OPTIONAL
*"     REFERENCE(MSG_V4) OPTIONAL
*"     REFERENCE(OBJECT) TYPE  BALOBJ_D OPTIONAL
*"     REFERENCE(SUBOBJECT) TYPE  BALSUBOBJ OPTIONAL
*"     REFERENCE(EXTNUMBER) TYPE  BALNREXT OPTIONAL
*"     REFERENCE(REPID) TYPE  SY-REPID DEFAULT SY-CPROG
*"     REFERENCE(UNAME) TYPE  SY-UNAME DEFAULT SY-UNAME
*"  EXCEPTIONS
*"      WRITE_ERROR
*"----------------------------------------------------------------------
  DATA: msg TYPE bal_s_msg.

  msg-msgty = msg_type.
  msg-msgid = msg_id.
  msg-msgno = msg_no.
  WRITE: msg_v1 TO msg-msgv1.
  SHIFT msg-msgv1 RIGHT DELETING TRAILING space.
  SHIFT msg-msgv1 LEFT  DELETING LEADING  space.

  WRITE: msg_v2 TO msg-msgv2.
  SHIFT msg-msgv2 RIGHT DELETING TRAILING space.
  SHIFT msg-msgv2 LEFT  DELETING LEADING  space.

  WRITE: msg_v3 TO msg-msgv3.
  SHIFT msg-msgv3 RIGHT DELETING TRAILING space.
  SHIFT msg-msgv3 LEFT  DELETING LEADING  space.

  WRITE: msg_v4 TO msg-msgv4.
  SHIFT msg-msgv4 RIGHT DELETING TRAILING space.
  SHIFT msg-msgv4 LEFT  DELETING LEADING  space.

  CALL FUNCTION 'Z_APPL_LOG_WRITE'
    EXPORTING
      msg         = msg
      object      = object
      subobject   = subobject
      extnumber   = extnumber
      repid       = repid
      uname       = uname
    EXCEPTIONS
      init_error  = 1
      write_error = 2
      OTHERS      = 3.
  IF sy-subrc <> 0.
    RAISE write_error.
  ENDIF.

ENDFUNCTION.

FUNCTION Z_SPELL_FIELDNAME .
*"----------------------------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(FIELD)
*"  EXPORTING
*"     REFERENCE(DDTEXT) TYPE  DDTEXT
*"     REFERENCE(FIELDNAME) TYPE  FIELDNAME
*"----------------------------------------------------------------------
  DATA: type_ref TYPE REF TO cl_abap_typedescr.

  DATA: langu LIKE sy-langu.

* Get current data element decription
  type_ref ?= cl_abap_typedescr=>describe_by_data( field ).
  fieldname = type_ref->get_relative_name( ).

  DO 2 TIMES.
    CASE sy-index.
      WHEN 1.
        langu = sy-langu.
      WHEN 2.
        langu = 'E'.
    ENDCASE.

    SELECT SINGLE dd04t~ddtext FROM dd04t
    INTO ddtext
    WHERE dd04t~rollname   = fieldname AND
          dd04t~ddlanguage = langu     AND
          as4local         = 'A'.
    IF sy-subrc = 0 OR langu = 'E'.
      EXIT.
    ENDIF.

  ENDDO.

  IF ddtext IS INITIAL.
    ddtext = fieldname.
  ENDIF.

ENDFUNCTION.
{{< /highlight >}}

   [1]: images/screenshot-application-log4.png (Application log)
   [2]: images/screenshot-application-log4.png
   [3]: {{< ref "evitar-mensagens-dinamicas" >}}
