---
title: 'Converting an exception into an exception'
slug: converter-excepcao-em-classe-de-excepcao
date: 2015-06-01 09:00:21
tags: [estilo, oo]
categories: [artigos]
wordpressId: 3104
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
If you’re still not using exception classes, then you’re making a mistake. Cause they are very healthy for your code. They’re not only good nutrients for the system, they also make it lean and less vulnerable to diseases.

There are cases where you still need to deal with the old exceptions. For example, when a function module is invoked.

In this article I am presenting a suggestion that seems a little complex, but it works very well if you need to integrate the old exceptions with exception class in a simple way. And though it is sophisticated, you only need to do it once. Once it's done, it's easy to use.

<!--more-->

So here's my suggestion:

1. When a function returns an exception, we assume that the details of the message associated to that exception are in the SYST fields, where you can find the last message of the system;
2. If the function fails right after it is called, we just need to trigger an exception class created specifically to encapsulate this last message (which I have named as ZCX_SYST);
3. From this moment the function exception can be treated like an exception class.

How can we achieve this?

1. Create the exception class with message class ZCX_SYST.
2. Declare four SYSMSGV type attributes: MSGV1, MSGV2, MSGV3, MSGV4.
3. Finally we need to change the constructor to automatically populate the T100KEY fields and the four attributes in the SYST fields, which contain the last system message. This way the system message will be encapsulated in the exception class. But since in SAP it is not allowed to make changes in the exception class CONSTRUTCOR for automatically generated classes, we need to use a trick.: insert an enhancement at the end of the constructor of our class. Normally enhancements are used to make changes to the standard code, but this is an example where it can be very useful to apply them in Z-code.

And this is the ZCX_SYST code:


{{< highlight ABAP >}}
method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->MSGV1 = MSGV1 .
me->MSGV2 = MSGV2 .
me->MSGV3 = MSGV3 .
me->MSGV4 = MSGV4 .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
"""""""""$"$\SE:(1) Class ZCX_SYST, Method CONSTRUCTOR, End                                                                                                           *$*$-Start: (1)----------------------------------------$*$*
ENHANCEMENT 1  ZCX_SYST.    "active version

  me->msgv1 = sy-msgv1.
  me->msgv2 = sy-msgv2.
  me->msgv3 = sy-msgv3.
  me->msgv4 = sy-msgv4.
  if_t100_message~t100key-msgid = sy-msgid.
  if_t100_message~t100key-msgno = sy-msgno.
  if_t100_message~t100key-attr1 = 'MSGV1'.
  if_t100_message~t100key-attr2 = 'MSGV2'.
  if_t100_message~t100key-attr3 = 'MSGV3'.
  if_t100_message~t100key-attr4 = 'MSGV4'.

ENDENHANCEMENT.
*$*$-End:   (1)----------------------------------------$*$*
endmethod.
{{< /highlight >}}

Let’s see how we can use this.

The CONVERTE_MSG_EM_EXP method calls a function module that does nothing else than MESSAGE E123(fi) RAISING error. Of course, in real cases this could be a BAPI or any other function module that triggers exceptions with messages. If the function call results in an exception, the method will trigger a ZCX_SYST type exception. You don’t need to do anything else because all the magic happens within ZCX_SYST.


{{< highlight ABAP >}}
METHOD converte_msg_em_exp.

  CALL FUNCTION 'Z_FUNCAO_QUE_DA_ERRO'
    EXCEPTIONS
      erro   = 1
      OTHERS = 2.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_syst.
  ENDIF.

ENDMETHOD.
{{< /highlight >}}

Imagine that this method is called in another method, which in turn is called in another method. If you hadn’t transformed this exception in an exception class it would have to be treated on all levels. Or it would have to be explicitly converted into an exception with the exact text of the message sent. Imagine a complex code with several function module calls with each of the function modules having various different exceptions. A hell of a work. But with cascading exception classes all happens automatically. And on the top level we could have:


{{< highlight ABAP >}}
  DATA: o_exp TYPE REF TO zcx_syst,
            texto TYPE string.

  TRY.
      converte_msg_em_exp( 'NAO_EXISTE' ).
    CATCH zcx_syst INTO o_exp.
      texto = o_exp->get_text( ).
      WRITE texto.
  ENDTRY.
{{< /highlight >}}

And bingo, that’s it.

This approach was inspired by [this SAP article][1].

Best greetings from Abapinho.

   [1]: https://help.sap.com/abapdocu_740/en/abenmessage_interface_abexa.htm
