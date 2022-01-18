---
title: 'Is that RFC system alive?'
slug: aquele-sistema-rfc-esta-vivo
date: 2013-05-27 09:00:03
tags: [sysadmin]
categories: [dicas]
wordpressId: 2278
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
You want to call an RFC function in another system but, because you’re not a carrion eater, you only want to do it if it’s alive.

Hence, you need a way of checking whether that particular destination RFC system is alive.

How do you do that?

Charles Santana does it like this:


{{< highlight ABAP >}}
DATE: rfcdest         TYPE rfcdest,
           ping_status TYPE /sdf/e2e_traffic_light_numeric.

CALL FUNCTION '/SDF/RFC_CHECK'
 EXPORTING
   iv_destination = rfcdest
   iv_ping        = 'X'
*    iv_logon       = 'X'
*    iv_latency     = 'X'
 IMPORTING
   ev_ping_status = ping_status.
if lv_ping_status <> 1.
* it’s dead.
endif.
{{< /highlight >}}

Thanks Charles.

Greetings from Abapinho.
