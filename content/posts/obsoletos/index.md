---
slug: obsoletos
title: Evita o ABAP obsoleto
description: Evita usar ABAP que a SAP considera obsoleto
date: 2022-03-07T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: [ABAP obsoleto]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

O ABAP evolui (embora durante muitos anos não parecesse). E à medida que evolui vai deixando para trás alguns comandos ou formas de fazer as coisas porque disponibiliza outras melhores.

Para além de aprender a usar as novidades é também importante aprender a deixar de usar o que vai ficando obsoleto.

<!--more-->

[Nesta][1] página encontra-se tudo o que a SAP considera obsoleto no ABAP 7.50 (já agora [esta][6] é a da versão 7.40).

Sabias, por exemplo, que as rotinas `FORM/ENDFORM` estão [obsoletas][2]? Ou que o `LOOP AT SCREEN` usando uma cabeçalho implícito também está [obsoleto][3] e que se deve declarar uma estrutura `screen` e fazer `LOOP AT SCREEN INTO screen`? E do `OCCURS` nem vale a pena [falar][4], certo?

Mas o que aparentemente muita gente parece não saber é que o `CALL METHOD` também está [obsoleto][5] pois continua a usar-se por todo o lado em vez de usar a sintaxe funcional que é em tudo melhor. A única situação em que ainda deve ser usado é em chamadas dinâmicas tipo `CALL METHOD (classe)->(method)`.

E tu, és obsoleto?

Obrigado Vincent van Zeijst pela [foto][7].

O Abapinho saúda-vos.

  [1]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenabap_obsolete.htm
  [2]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenabap_subroutines.htm
  [3]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abaplocal.htm
  [4]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abapdata_occurs.htm
  [5]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abapcall_method_static.htm
  [6]: https://help.sap.com/doc/abapdocu_740_index_htm/7.40/en-US/abenabap_obsolete.htm
  [7]: https://commons.wikimedia.org/wiki/File:Slice_of_bread_with_mould_(1).jpg
