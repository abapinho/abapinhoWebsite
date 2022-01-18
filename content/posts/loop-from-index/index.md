---
title: 'LOOP FROM INDEX'
slug: loop-from-index
date: 2011-03-10 12:15:12
tags: [performance]
categories: [dicas]
wordpressId: 553
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
É muito fácil meter os pés pelas mãos no que toca a performance quando se manipula tabelas internas. Principalmente quando elas são assim a tender para o grandalhonas. É até comum que estes problemas só surjam passados uns meses, quando as tabelas tendem a crescer com o tempo.

Por exemplo, quando fazes loop a duas tabelas, uma de cabeçalhos e outra de itens, fazes assim?


{{< highlight ABAP >}}
LOOP AT itab1 ASSIGNING <fs1>.
   LOOP AT itab2 ASSGNING <fs2> WHERE field1 = <fs1>-field1.
   ENDLOOP.
ENDLOOP.
{{< /highlight >}}

Sabias que, para tabelas grandes, isto pode demorar séculos porque o _LOOP WHERE_ corresponde a fazer uma leitura sequencial da _itab2_ para cada entrada da _itab1_?

Porque é que não fazes antes assim?


{{< highlight ABAP >}}
SORT itab2 BY field1.

LOOP AT itab1 ASSIGNING <fs1>.

   READ TABLE itab2 WITH KEY field1 = <fs1>-field1
      BINARY SEARCH TRANSPORTING NO FIELDS.
   CHECK SY-SUBRC = 0.
   lv_tabix = sy-tabix.

   LOOP AT itab2 FROM lv_tabix ASSIGNING <fs2>.
      IF <fs2>-field1 <> <fs1>-field1.
         EXIT.
      ENDIF.
   ENDLOOP.

ENDLOOP.
{{< /highlight >}}

É que a diferença é da noite para o dia em termos de performance. Tanto maior quanto mais dados tiver a _itab2_.

Esta vantagem do _LOOP FROM INDEX_ também pode ser conseguida se, em vez de tabelas internas normais, se usar uma _SORTED TABLE_. Mas isso fica para um próximo artigo.

Obrigado ao Bruno Filipa por esta dica.

O Abapinho saúda-vos.
