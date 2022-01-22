---
title: 'Preventing competition in an ABAP program'
slug: evitando-a-concorrencia-num-programa-abap
date: 2012-07-30 09:00:27
tags: []
categories: [dicas]
wordpressId: 1865
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
They say that competition in trade is good. Good for consumers, that is. It lowers prices and so on. But inside computers it creates problems for those using them.

Usually, competition is contained in ABAP at the data level, blocking ( _euqueue_ ) certain tables based on their key. But sometimes, something more violent may be required to ensure that a program may not run more than once at the same time. The ESINDX lock object can be used to do this.

<!--more-->

And thus:


{{< highlight ABAP >}}
  DATA srtfd LIKE indx-srtfd.
  srtfd = sy-repid.
  DO.
    CALL FUNCTION 'ENQUEUE_ESINDX'
      EXPORTING
        mandt          = sy-mandt
        relid          = 'GN'
        srtfd          = srtfd
        srtf2          = 0
      EXCEPTIONS
        foreign_lock   = 1
        system_failure = 2
        OTHERS         = 3.
    IF sy-subrc = 0.
      EXIT.
    ELSE.
      WAIT UP TO 1 SECONDS.
    ENDIF.
  ENDDO.
{{< /highlight >}}

Thanks to [pylbug][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/pylbug/1678163229/
