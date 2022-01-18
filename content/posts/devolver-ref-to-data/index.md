---
title: 'Como devolver um REF TO data sem fazer asneira'
slug: devolver-ref-to-data
date: 2017-01-02 09:00:26
tags: [estilo]
categories: [artigos]
wordpressId: 3689
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['ref to data']
description: 'Aprende aqui como usar o REF TO DATA para passar referências de dados entre métodos. E aprender também como fazer asneira a tentá-lo.'
---
Tenho usado cada vez mais referências em ABAP.

Primeiro usava REF TO só para classes mas vou percebendo cada vez mais as vantagens de as usar também para estruturas de dados. Mas, tal como acontece em C++, há que ter cuidado quando se lida con referências para dados pois facilmente a coisa pode dar para o torto.

Neste artigo tento mostrar como usar e como não usar o REF TO data. Comecemos por ver um exemplo de como não usar:

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
    SELECT * INTO TABLE GT_T001
      FROM T001.
  ENDIF.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
ENDMETHOD
{{< /highlight >}}

Este já funciona. Porquê? Porque a tabela GT_T001, sendo um atributo da classe, continua a existir em memória enquanto a instância da classe existir.

Tudo certo?

Agora vou mostrar-te uma limitação estranha do REFERENCE INTO. Imagine agora esta terceira implementação em que, em vez de fazer cache de tudo, apenas queremos ir acrescentando à cache os registos que forem sido pedidos:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  IF SY-SUBRC <> 0.
    SELECT SINGLE * FROM T001 INTO S_T001 WHERE BUKRS = I_BUKRS.
    INSERT S_T001 INTO TABLE GT_T001 REFERENCE INTO RO_T001.
  ENDIF.
ENDMETHOD.
{{< /highlight >}}

Primeiro tentamos obter a linha a partir da cache. Caso não exista seleccionamos para uma estrutura que depois adicionamos à cache. Ora como o comando INSERT permite logo obter uma referência daquilo que inserimos parece que conseguimos obter logo a referência à linha inserida no momento em que a inserimos.

Mas não! Não funciona.

Porquê? Porque o ABAP, cretino, em vez de devolver uma referência para a linha inserida, devolve uma referência para a estrutura local S_T001.

Mas para que é que me serve um comando INSERT devolver uma referência para a estrutura? Para nada. Alguém que me explique o porquê deste comportamento. Isto tem todo o ar de ser um bug.

A solução tem de passar por tornar a fazer um READ:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  IF SY-SUBRC <> 0.
    SELECT SINGLE * FROM T001 INTO S_T001 WHERE BUKRS = I_BUKRS.
    INSERT S_T001 INTO TABLE GT_T001.
    READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  ENDIF.
ENDMETHOD.
{{< /highlight >}}

De qualquer forma espero que estes exemplos tenham servido para entenderes melhor como podes usar o REF TO data.

Foto: [haroldmeerveld][1] via [Visualhunt][2] / [CC BY-NC][3]

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/haroldmeerveld/15173387023/
   [2]: https://visualhunt.com
   [3]: http://creativecommons.org/licenses/by-nc/2.0/
