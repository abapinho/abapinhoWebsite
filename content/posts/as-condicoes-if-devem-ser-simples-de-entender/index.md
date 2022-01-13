---
title: 'As condições IF devem ser simples de entender'
slug: as-condicoes-if-devem-ser-simples-de-entender
date: 2021-11-01 09:00:45
tags: [estilo]
categories: [dicas]
wordpressId: 4757
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Porque haveria de ser difícil lê-las? Só tornaria mais difícil a vida de quem vier a precisar de a entender.

Lá porque uma condição IF é complexa não é por isso que tem de ser complicada.

<!--more-->

O [Clean ABAP][1] tem algumas sugestões para conseguir isto:

  * [Considera decompor condições complexas][2]

  * [Considera extrair condições complexas][3]

  * [Evita ramos vazios no IF][4]

  * [Prefere CASE a ELSE IF em múltiplas condições alternativas][5]

Aqui está um exemplo de uma condição IF difícil de ler:

{{< highlight ABAP >}}
IF price > 1000 AND customer_debt > 10000 AND salesorder_status = '1'.
    " code to block invoice
 ENDIF.
{{< /highlight >}}

Ok, concedo que não é assim tão difícil, mas serve-nos como exemplo.

Isto seria uma evolução:

{{< highlight ABAP >}}
IF should_be_blocked( ).
   " code to block invoice
ENDIF.

METHOD should_be_blocked.
  result = COND #(
    WHEN is_expensive( price ) AND
      customer( kunnr ).is_deadbeat( ) AND
      NOT salesorder( vbeln ).is_delivered( ) THEN abap_true
    ELSE abap_false ).
ENDMETHOD.

(...)
{{< /highlight >}}

Sim, até pode ser um exagero. Mas levei a coisa longe demais de propósito só para exemplificar o que pode ser feito para tornar aquele IF inicial mais simples de ler e entender.

O Abapinho saúda-vos.

   [1]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md
   [2]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#consider-decomposing-complex-conditions
   [3]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#consider-extracting-complex-conditions
   [4]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#no-empty-if-branches
   [5]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-case-to-else-if-for-multiple-alternative-conditions
