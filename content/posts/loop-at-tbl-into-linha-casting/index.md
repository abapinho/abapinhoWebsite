---
title: 'LOOP at tbl ASSIGNING &lt;linha&gt; CASTING'
slug: loop-at-tbl-into-linha-casting
date: 2014-12-01 09:50:19
tags: [estilo]
categories: [dicas]
wordpressId: 2928
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Sabias que podes fazer LOOP de uma tabela interna com uma estrutura A para dentro de uma estrutura do tipo B?

<!--more-->

Imagina que tens os seguintes tipos:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_s_linha1,
               kunnr TYPE kunnr,
               name1 TYPE name1,
          END OF ty_s_linha1,

          BEGIN of ty_s_linha2,
               kunnr TYPE kunnr,
          END OF ty_s_linha2.
 {{< /highlight >}}

Tens uma tabela com registos do tipo LINHA1 e queres passar cada registo para uma estrutura tipo LINHA2.

Normalmente terias de converter manualmente a LINHA1 para a LINHA2:


{{< highlight ABAP >}}
    DATA: t_linha1 TYPE STANDARD TABLE OF ty_s_linha1,
              s_linha2 TYPE ty_s_linha2.

    FIELD-SYMBOLS: <s_linha1> TYPE ty_s_linha2.

   LOOP AT t_linha1 ASSIGNING <s_linha1>.
     MOVE-CORRESPONDING <s_linha1> TO s_linha2.
     faz_algo( s_linha2 ).
  ENDLOOP.
{{< /highlight >}}

Mas basta a palavrinha CASTING para a coisa ficar mais simples:


{{< highlight ABAP >}}
    DATA: t_linha1 TYPE STANDARD TABLE OF ty_s_linha1.
    FIELD-SYMBOLS: <s_linha2> TYPE ty_s_linha2.

   LOOP AT t_linha1 ASSIGNING <s_linha2> CASTING.
    faz_algo( s_linha2 ).
  ENDLOOP.
{{< /highlight >}}

Nota: não funciona com o INTO, só com o ASSIGNING.

Obrigado Nuno Morais pela dica.

Obrigado Eelco pela [foto][1].

   [1]: “https://www.flickr.com/photos/smiling_da_vinci/12781401”
