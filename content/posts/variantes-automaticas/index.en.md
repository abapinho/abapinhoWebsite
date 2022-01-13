---
title: 'Automatic variants in reports'
slug: variantes-automaticas
date: 2011-10-17 10:00:57
tags: []
categories: [dicas]
wordpressId: 1071
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When developing a report with a selection screen it is very annoying that every time we test it we have to input the test data to the selection screen. We usually end up creating a variant of the test to save us from this hassle. But, every time we run the report we still have to manually call this variant.

Here is a simple way to automatically call a variant.
This code can be inserted into the INITIALIZATION event during the development of the program:


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

Thank you Sérgio Fraga for the tip.

(And thank you to [Telstar Logistics][1] for the photo)

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/telstar/3339736213/
