---
title: 'INSERT wa INTO itbl REFERENCE INTO ref. Bug?'
slug: reference-into-ref-bug
date: 2016-10-03 09:00:43
tags: [estilo]
categories: [artigos]
wordpressId: 3627
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Tenho usado cada vez mais referências em ABAP. Primeiro usava REF TO só para classes mas agora vou percebendo as vantagens de as usar também para estruturas de dados.

Recentemente descobri um comportamento muito lamentável do seguinte comando:


{{< highlight ABAP >}}
INSERT wa INTO itbl REFERENCE INTO ref.
{{< /highlight >}}

Mas antes de me queixar sobre isso, dou um bocado de contexto.

<!--more-->

Tens o método GET_REF_TO_T001 que retorna uma REF TO T001:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001
  IMPORTING
    I_BUKRS TYPE BUKRS
  RETURNING
    RO_T001 TYPE REF TO T001.
{{< /highlight >}}

Imagina a seguinte implementação:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.
  SELECT * INTO S_T001 WHERE BUKRS = I_BUKRS.
  GET REFERENCE FROM S_T001 INTO RO_T001.
ENDMETHOD
{{< /highlight >}}

O método deveria devolver uma referência para a estrutura T001 preenchida com o registo do I_BUKRS. Mas isso não acontece. Em vez disso, no debugger pode ver-se que o conteúdo do RO_T001 é algo tipo #FREEDXXX. E faz todo o sentido que assim seja. Porquê? Porque a referência aponta para a variável local S_T001 que deixou de existir no momento em que se saiu do método.

Vê agora esta implementação alternativa em que os dados todos da T001 são guardados em cache numa tabela interna GT_T001 que é atributo da classe:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  IF GT_T001[] IS INITIAL.
    SELECT * INTO TABLE GT_T001 FROM T001.
  ENDIF.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
ENDMETHOD
{{< /highlight >}}

Este já funciona. Porquê? Porque a tabela GT_T001, sendo um atributo da classe, continua a existir em memória enquanto a instância da classe existir.

Tudo certo?

Voltemos agora ao problema que referi no início. Imaginem agora esta terceira implementação em que, em vez de fazer cache de tudo, apenas queremos ir acrescentando à cache os registos que forem sido pedidos:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  IF SY-SUBRC <> 0.
    SELECT SINGLE * FROM T001 INTO S_T001 WHERE BUKRS = I_BUKRS.
    INSERT S_T001 INTO GT_T001 REFERENCE INTO RO_T001.
  ENDIF.
ENDMETHOD.
{{< /highlight >}}

Primeiro tentamos obter a linha a partir da cache. Caso não exista seleccionamos para uma estrutura que depois adicionamos à cache. Ora como o comando INSERT permite logo obter uma referência daquilo que inserimos parece que conseguimos obter logo a referência à linha inserida no momento em que a inserimos.

Não funciona!

Porquê? Porque o ABAP, estúpido, em vez de devolver uma referência para a linha inserida, devolve uma referência para a estrutura local S_T001.

De que me serve o comando INSERT devolver uma referência para a estrutura? Nada.
Alguém que me explique o porquê deste comportamento. Isto tem todo o ar de ser um bug.

O Abapinho saúda-vos.
