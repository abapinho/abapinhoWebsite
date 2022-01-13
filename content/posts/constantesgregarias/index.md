---
title: 'Constantes gregárias'
slug: constantesgregarias
date: 2012-05-14 10:00:28
tags: [estilo]
categories: [dicas]
wordpressId: 1671
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Se és daqueles que, em vez de usarem constantes, espetam com os valores directamente no código, então pára de ler isto e vai ali para o canto de castigo durante 1 hora que é para aprenderes a não ser mandrião. Quando voltares podes continuar a ler.

<!--more-->

Se já voltaste do castigo ou se costumas usar constantes, então faz o favor de continuar a ler.

Imagina o seguinte uso de constantes:


{{< highlight ABAP >}}
CONSTANTS:
  C_BUKRS_ESPANHA TYPE BUKRS VALUE '1111',
  C_BUKRS_FRANCA   TYPE BUKRS VALUE '2222',
  C_BUKRS_INDIA       TYPE BUKRS VALUE '3333',
  C_MODE_ERRO        TYPE XFELD VALUE 'E',
  C_MODE_INFO         TYPE XFELD VALUE 'I',
  C_MODE_WARN       TYPE XFELD VALUE 'W'.

START-OF-SELECTION.

  CASE l_bukrs.
    WHEN C_BUKRS_ESPANHA.
      txt = 'Hola'.
   WHEN C_BUKRS_FRANCA.
     txt = 'Bonjour'.
   WHEN C_BUKRS_INDIA.
     txt = 'Namaste'.
  ENDCASE.
  WRITE txt.
{{< /highlight >}}

Como vêem há 2 grupos de constantes que idealmente estariam agrupados e não estão. Podem agrupar-se assim:


{{< highlight ABAP >}}
CONSTANTS:
  BEGIN OF C_BUKRS,
    ESPANHA TYPE BUKRS VALUE '1111',
    FRANCA TYPE BUKRS VALUE '2222',
    INDIA TYPE BUKRS VALUE '3333',
  END OF C_BUKRS,

  BEGIN OF C_MODE,
    ERRO        TYPE XFELD VALUE 'E',
    INFO         TYPE XFELD VALUE 'I',
    WARN       TYPE XFELD VALUE 'W',
  END OF C_MODE.

START-OF-SELECTION.

  CASE l_bukrs.
    WHEN C_BUKRS-ESPANHA.
      txt = 'Hola'.
   WHEN C_BUKRS-FRANCA.
     txt = 'Bonjour'.
   WHEN C_BUKRS-INDIA.
     txt = 'Namaste'.
  ENDCASE.
  WRITE txt.
{{< /highlight >}}

Assim a declaração faz muito mais sentido porque as constantes ficam agrupadas logicamente. E a utilização é quase igual. Tão óbvio. E no entanto só há uns dias é que descobri que isto se pode fazer.

Obrigado a [suki suk][1] pela foto.

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/vanesuki/2172430914/
