---
title: '<!--:pt-->READ TABLE blablabla TRANSPORTING NO FIELDS<!--:-->'
slug: transporting-no-fields
date: 2009-08-20 04:51:19
tags: [estilo, performance]
categories: [dicas]
wordpressId: 109
draft: false
---
Por vezes ao fazer READ TABLE a uma tabela interna queremos apenas verificar se um determinado registo existe, e não nos preocupamos com os dados retornados. Algo tipo:


{{< highlight ABAP >}}
READ TABLE lt_kna1 INTO wa_kna1 WITH KEY kunnr = l_kunnr.
CHECK SY-SUBRC = 0.
{{< /highlight >}}

Ora já que a estrutura WA_KNA1 não vai ser necessária de qualquer forma, mais vale não a usar, usando antes a opção TRANSPORTING NO FIELDS:


{{< highlight ABAP >}}
READ TABLE lt_kna1 TRANSPORTING NO FIELDS WITH KEY kunnr = l_kunnr.
CHECK SY-SUBRC = 0.
{{< /highlight >}}

O Abapinho saúda-vos.
