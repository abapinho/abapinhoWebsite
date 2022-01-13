---
title: 'Gregarious constants'
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
If you are one of those who insert the values directly in code instead of using constants, then read no more and go and stand over there in the corner on punishment for 1 hour to learn not to be lazy. If you've come back from punishment or you usually use constants, then please continue reading.

<!--more-->

Imagine using the following constants:


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

As you can see there are two groups of constants which would ideally be grouped together, and they are not. They can be grouped as follows:


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

Thus, the declaration makes much more sense because the constants are grouped logically. The use is almost identical. It is so obvious. Yet, I only discovered that this can be done a few days ago.

Thanks to [suki suk][1] for the photo.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/vanesuki/2172430914/
