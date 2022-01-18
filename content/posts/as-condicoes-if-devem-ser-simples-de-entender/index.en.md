---
title: 'IF conditions should be simple to read'
slug: as-condicoes-if-devem-ser-simples-de-entender
date: 2021-11-01 09:00:45
tags: [estilo]
categories: [dicas]
wordpressId: 4757
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['condições IF simples']
description: 'As condições IF devem ser simples de entender. Aprenda aqui como consegui-lo mesmo com condições complexas.'
---
Because...why should they be complex to read? It would only make it harder to maintain in the future.

Just because an IF condition is complex doesn't mean it has to be complicated.

<!--more-->

[Clean ABAP][1] has some nice suggestions on how to achieve this:

  * [Consider decomposing complex conditions][2]

  * [Consider extracting complex conditions][3]

  * [No empty IF branches][4]

  * [Prefer CASE to ELSE IF for multiple alternative conditions][5]

Here's an example of a complex If condition:


{{< highlight ABAP >}}
IF price > 1000 AND customer_debt > 10000 AND salesorder_status = '1'.
    " code to block invoice
 ENDIF.
{{< /highlight >}}

Ok, I concede that it's not that complex, but it will serve as example.

This would be an improvement:

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

Yes, this is clearly overkill. But I took it too far on purpose, just to exemplify what can be done to make the IF condition simpler to read and understand.

Greetings from Abapinho.

   [1]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md
   [2]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#consider-decomposing-complex-conditions
   [3]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#consider-extracting-complex-conditions
   [4]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#no-empty-if-branches
   [5]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-case-to-else-if-for-multiple-alternative-conditions
