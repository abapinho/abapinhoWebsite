---
title: 'Converter excepção em classe de excepção'
slug: converter-excepcao-em-classe-de-excepcao
date: 2015-06-01 09:00:21
tags: [estilo, oo]
categories: [artigos]
wordpressId: 3104
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Se ainda não usas classes de excepção fazes mal. Porque são muito boas para a saúde do código. Além de nutritivas, emagrecem-no e tornam-no mais resistente a doenças.

Mas há casos em que ainda é preciso lidar com as antigas excepções. Por exemplo quando se invoca um módulo de função.

Neste artigo apresento uma sugestão um bocado rebuscada mas que funciona muito bem para integrar as excepções antigas com classe de excepção de uma forma simples. A solução é rebuscada mas só tem de ser feita uma vez. Uma vez feita, a forma como se a usa não tem nada de rebuscado.

<!--more-->

Proponho o seguinte:

1\. Quando uma função devolve uma excepção presumimos que os detalhes da mensagem associada a essa excepção estão nos campos da SYST onde fica a última mensagem de sistema;
2\. Logo a seguir à chamada da função, se esta falhar, apenas temos de lançar uma classe de excepção por nós criada especificamente para encapsular essa última mensagem (a que chamei ZCX_SYST);
3\. A partir deste momento a excepção da função pode ser tratada como se fosse uma classe de excepção.

E como é que vamos conseguir isto?

1\. Criamos a classe de excepções com classe de mensagem chamada ZCX_SYST;
2\. Nela declaramos 4 atributos MSGV1, MSGV2, MSGV3 MSGV4 do tipo SYSMSGV;
3\. Finalmente precisamos de alterar o seu construtor para popular automaticamente os campos da T100KEY e os 4 atributos com os campos da SYST que contêm a última mensagem de sistema. Fica assim encapsulada a mensagem de sistema na classe de excepções. Mas como o SAP não permite alterar o CONSTRUCTOR das classes de excepção visto estas serem geradas automaticamente, temos de recorrer a uma manha: fazer um _enhancement_ no final do construtor da nossa classe. Geralmente os _enhancements_ são usados para alterar código standard mas aqui está um caso em que dão jeito em código Z.

Aqui está o código da ZCX_SYST:


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

Vamos agora ver como se usa isto.

O método CONVERTE_MSG_EM_EXP chama um módulo de função que lá dentro se limita a fazer MESSAGE E123(fi) RAISING erro. Claro que nos casos reais poderia ser uma BAPI ou qualquer outro módulo de funções que lance excepções com mensagens. Caso a chamada à função resulte numa excepção, o método lança uma excepção do tipo ZCX_SYST. Não precisa de fazer absolutamente mais nada porque a magia acontece dentro da ZCX_SYST.


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

Imagine-se que este método é chamado dentro de outro método que por sua vez é chamado dentro de outro método. Se não se tivesse transformado a excepção em classe de excepção esta teria de ser tratada em todos os níveis. Ou então teria de ser explicitamente convertida para uma excepção com o texto exacto da mensagem que enviou. Imagina um código complexo com várias chamadas a módulos de função, cada um destes módulos de função com várias excepções diferentes. Dava um trabalhão. Mas assim, graças à virtude de as classes de excepções fazerem cascata, tudo se torna automático. E no nível de topo poderemos ter:


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

Zás já tá.

Esta abordagem inspirou-se [neste artigo da SAP][1].

Obrigado Philipp Pohle pela [foto][2].

O Abapinho saúda-vos.

   [1]: http://help.sap.com/abapdocu_740/en/abenmessage_interface_abexa.htm
   [2]: https://www.flickr.com/photos/97321708@N07/9317424023
