---
title: 'Ignore function module exceptions'
slug: ignorar-excepcoes-de-um-modulo-de-funcao
date: 2015-01-26 09:00:25
tags: [estilo]
categories: [dicas]
wordpressId: 2985
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When calling a function module which returns exceptions you normally give them sequential numbers like this:


{{< highlight ABAP >}}
CALL FUNCTION 'GO_BUT_PLEASE_COME_BACK'
  EXPORTING
    ali = 'To the moon'
  EXCEPTIONS
    NOT_FOUND = 1
    GOT_LOST  = 2
    OTHERS    = 3.
{{< /highlight >}}

But Code Inspector may be configured to report a warning if afterwards you are not careful to add an IF or a CASE to look at SY-SUBRC,

<!--more-->

There are, nevertheless, occasions in which you're 100% sure that the function module will success and can do without checking SY-SUBRC.

In those cases you can do two things to avoid the Code Inspector warning:

1\. Use the pseudocomment "#EC CI_SUBRC
2\. Set all return values = 0. Like this:


{{< highlight ABAP >}}
CALL FUNCTION 'GO_BUT_PLEASE_COME_BACK'
  EXPORTING
    ali = 'To the moon'
  EXCEPTIONS
    NOT_FOUND = 0
    GOT_LOST  = 0
    OTHERS    = 0.
{{< /highlight >}}

I found this last one quite amusing.

Thanks Leo Reynolds for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/lwr/1162472323
