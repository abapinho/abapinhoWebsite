---
title: 'Evitando a concorrência num programa ABAP'
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
Dizem que a concorrência no comércio é boa. Boa para os consumidores, isto é. Faz descer os preços e assim. Mas dentro dos computadores prejudica quem os consome.

Normalmente em ABAP combate-se a concorrência ao nível dos dados, bloqueando ( _euqueue_ ) determinadas tabelas com base na sua chave. Mas por vezes pode ser necessário algo mais violento como garantir que um programa não pode correr mais do que uma vez ao mesmo tempo. Para fazer isso pode usar-se o objecto de bloqueio ESINDX.

<!--more-->

Assim:


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

Obrigado a [pylbug][1] pela foto.

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/pylbug/1678163229/
