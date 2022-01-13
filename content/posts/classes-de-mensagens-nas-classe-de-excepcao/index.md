---
title: 'Usa sempre classes de mensagens nas classe de excepção'
slug: classes-de-mensagens-nas-classe-de-excepcao
date: 2013-12-16 09:00:49
tags: [estilo, oo]
categories: [dicas]
wordpressId: 2511
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
As classes de excepção permitem declarar múltiplos textos que descrevem os diferentes erros possíveis que elas podem representar.

Há no entanto uma opção para a associar a uma classe de mensagens (SE91). Isto permite que, em vez de os textos serem definidos directamente ali na classe de excepção, sejam antes definidos como clássicas mensagens da SE91. E tem vantagens.

<!--more-->

À partida parece mais simples definir os textos directamente na classe de excepção. E foi isso que fiz até recentemente. Até que compreendi o que tinha a ganhar com a associação entre os dois.

Por exemplo, se o fizeres, em vez de teres de andar a recorrer ao método GET_TEXT() e a meter o resultado numa _string_ e depois fazer MESSAGE dessa string, podes usar directamente a instância da excepção com o comando MESSAGE. Não é fantástico?

Ou seja, em vez de:


{{< highlight ABAP >}}
DATA: text TYPE string.
TRY.
    RAISE EXCEPTION TYPE zcx_abapinho.
  CATCH zcx_abapinho INTO o_exc.
    text = o_exc->get_text( ).
    MESSAGE text TYPE 'I'.
ENDTRY.
{{< /highlight >}}

Podes fazer simplesmente:


{{< highlight ABAP >}}
TRY.
    RAISE EXCEPTION TYPE zcx_abapinho.
  CATCH zcx_abapinho INTO o_exc.
    MESSAGE o_exc TYPE 'I'.
ENDTRY.
{{< /highlight >}}

Isto acontece porque quando associas uma classe de excepção a uma classe de mensagens o SAP acrescenta automaticamente o interface IF_T100_MESSAGE à classe, permitindo assim esta conveniente funcionalidade adicional.

Outra vantagem é continuares a definir os erros como sempre o fizeste: usando as classes de mensagem da SE91, mantendo assim as coisas uniformizadas.

Obrigado a Sergio Aguirre pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/sergiodjt/3928105188/
