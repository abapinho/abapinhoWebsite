---
slug: obsoletos
title: Avoid obsolete ABAP
description: Evita usar ABAP que a SAP considera obsoleto
date: 2022-03-07T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: [ABAP obsoleto]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

ABAP evolves (even though it stood mostly still for too many years). And as it evolves, it leaves behind some commands and syntax constructions which are replaced by better ones.

Besides learning what's new it is also important to learn what becomes obsolete.

<!--more-->

[This][1] page lists everything that SAP considers obsolete in ABAP 7.50 ([this is the one][6] for 7.40 if you're wondering).

Did you know that `FORM/ENDFORM` routines are [obsolete][2]? Or that the famous `LOOP TO SCREEN` using an implicit header is [obsolete too][3] and that you should now declare a `screen` structure and do `LOOP AT SCREEN INTO screen`? And we [don't need to talk][4] about `OCCURS`, right?

But what a lot of people still doesn't seem to know is that `CALL METHOD` is [obsolete too][5] because, for some strange reason, it is still widely used instead of the obviously better functional syntax. The only scenario in which it should still be used is in dynamic calls like `CALL METHOD (class)->(method)`.

What about you? Are you obsolete?

Thank you Vincent van Zeijst for the [photo][7].

Greetings from Abapinho.

  [1]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenabap_obsolete.htm
  [2]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenabap_subroutines.htm
  [3]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abaplocal.htm
  [4]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abapdata_occurs.htm
  [5]: https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abapcall_method_static.htm
  [6]: https://help.sap.com/doc/abapdocu_740_index_htm/7.40/en-US/abenabap_obsolete.htm
  [7]: https://commons.wikimedia.org/wiki/File:Slice_of_bread_with_mould_(1).jpg
