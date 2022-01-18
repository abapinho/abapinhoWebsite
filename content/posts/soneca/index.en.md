---
title: 'Taking a nap'
slug: soneca
date: 2011-06-17 11:43:28
tags: [performance]
categories: [dicas]
wordpressId: 832
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Whatever the case, it is necessary to put a program to sleep. And, as with almost everything else, there are several ways to do this, some better than others.

The most _standard_ way to do this in ABAP is as follows:


{{< highlight ABAP >}}
WAIT UP TO 10 SECONDS.
{{< /highlight >}}

The advantage of WAIT UP TO N SECONDS is that the process is freed up during these 10 seconds, thereby making it available for those who want it. The big disadvantage is that it makes an implicit COMMIT, which is not always so good. If you don’t mind the COMMIT, this is the best way to make your program fall asleep. Please note that you cannot sleep for 1.5 seconds as the parameter only accepts whole numbers.

If a COMMIT doesn’t suit you, because you have a cursor open for the database or you're in the middle of a transaction, you can always do this:


{{< highlight ABAP >}}
DATA: ZTIME LIKE SY-UZEIT.

GET TIME.

ZTIME = SY-UZEIT + 10.

DO.
  GET TIME.
  IF SY-UZEIT >= ZTIME.
     EXIT.
   ENDIF.
ENDDO.
{{< /highlight >}}

Doing this, though, is not very clever. It’s called active standby and it is the last thing you want to do in a program because it is the same as making it run on a gym treadmill: it gets tired and goes nowhere.

Fortunately there is a healthier alternative that, while not freeing up the process, avoids the ill-fated COMMIT:


{{< highlight ABAP >}}
CALL FUNCTION 'ENQUE_SLEEP'
    EXPORTING
        seconds    = 10.
{{< /highlight >}}

Greetings from Abapinho.

_Thank you[Sweet-Rainb0w][1] for the photo._

   [1]: http://www.flickr.com/photos/il0vepullip/3954087408/
