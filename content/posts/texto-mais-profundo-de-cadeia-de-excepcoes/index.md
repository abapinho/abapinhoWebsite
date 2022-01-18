---
title: 'Obtém o texto mais profundo de cadeia de excepções'
slug: texto-mais-profundo-de-cadeia-de-excepcoes
date: 2017-01-16 10:34:04
tags: [estilo, oo]
categories: [artigos]
wordpressId: 3703
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'texto de cadeia de excepções'
description: 'Como conseguir obter automaticamente o texto da excepção mais profunda de uma cadeia de excepções sem que o programa cliente precise de código específico'
---
Nos dias que correm se não estás a usar objectos [és totó][1].

Se usas objectos, espero que estejas a seguir a [boa práctica][2] de usar classes de excepções.

E se usas classes de excepção é bom que entendas a melhor forma de as usar, particularmente as [vantagens de as encadear][3].

Com tudo isto esclarecido, chegamos ao que nos traz aqui hoje. No artigo sobre [cadeias de excepções][3] mostrei como, para obter o texto da excepção mais profunda, a que foi inicialmente espoletada, se pode fazer um DO WHILE:

<!--more-->


{{< highlight ABAP >}}
DATA: text TYPE string,
      o_exp TYPE REF TO cx_root.
(…)
CATCH cx_fruta INTO o_exp.
    WHILE o_exp->previous IS BOUND.
        o_exp = o_exp->previous.
    ENDWHILE.
    text = o_exp->get_text( ).
ENDTRY.
{{< /highlight >}}

Mas num cenário em que tens uma aplicação com muitas excepções, todas derivadas da mesma, podes fazer algo mais interessante:

  1. Crias uma excepção raiz para a aplicação ZCX_FRUTA

  2. Todas as excepções da aplicação herdam dessa (ZCX_FRUTA_BANANA, ZCX_FRUTA_ANANAS, etc.)

  3. Na excepção raiz ZCX_FRUTA fazes override ao método GET_TEXT() e encapsulas lá a lógica para obter o texto da mais profunda

O código do ZCX_FRUTA->GET_TEXT() será algo tipo:


{{< highlight ABAP >}}
METHOD GET_TEXT.
  if me->previous is bound.
    result = me->previous->get_text( ).
  else.
    result = super->if_message~get_text( ).
  endif.
ENDMETHOD.
{{< /highlight >}}

Também convém fazer o mesmo ao método GET_LONG_TEXT() se estiveres a pensar usá-lo.

E pronto, agora já não precisas de fazer o WHILE no código que trata as excepções. Elas próprias saberão tratar de si. Basta chamares o GET_TEXT() da excepção que receberes e terás sempre a certeza de que recebes o texto mais profundo, que deverá ser o que melhor descreve o erro que ocorreu. E o código até é mais bonito por ser recursivo.

Nota 1: isto só fará sentido num cenário em que não queres dar uso aos textos de cada elemento da cadeia de excepções, que diria ser o mais comum. No passado já precisei de todas, para fazer log delas.

Nota 2: Infelizmente esta técnica não é compatível com o comando MESSAGE o_exp TYPE ‘E’. Por alguma razão quando fazes isto obténs sempre o texto da excepção de topo. Pena.

Foto via [JanDix][4] via [Visualhunt][5]

O Abapinho saúda-vos.

   [1]: {{< ref "mariquinhas-pe-de-salsa" >}}
   [2]: {{< ref "usaras-classes-de-excepcao" >}}
   [3]: {{< ref "cadeias-de-excepcoes" >}}
   [4]: https://visualhunt.com/profile/jandix/
   [5]: https://visualhunt.com/
