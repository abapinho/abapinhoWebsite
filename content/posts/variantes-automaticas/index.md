---
title: 'Variantes automáticas em reports'
slug: variantes-automaticas
date: 2011-10-17 10:00:57
tags: []
categories: [dicas]
wordpressId: 1071
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando se está a desenvolver um relatório com um ecrã de selecção, é muito chato de cada vez que o testamos ter de preencher o ecrã de selecção com os dados de teste. Normalmente acabamos por criar uma variante de teste para nos poupar a esse chatice. Mas mesmo assim, de cada vez que corremos o relatório, temos de invocar manualmente esta variante.

Aqui está uma forma simples de invocar automaticamente uma variante. Este código pode ser inserido no evento INITIALIZATION durante o desenvolvimento do programa:


{{< highlight ABAP >}}
INITIALIZATION.

  CALL FUNCTION 'RS_SUPPORT_SELECTIONS'
    EXPORTING
      report                     = sy-repid
      variant                    = 'TESTE'
 EXCEPTIONS
   VARIANT_NOT_EXISTENT       = 1
   VARIANT_OBSOLETE           = 2
   OTHERS                     = 3.
{{< /highlight >}}

Obrigado Sérgio Fraga pela dica.

(E obrigado a [Telstar Logistics][1] pela foto)

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/telstar/3339736213/
