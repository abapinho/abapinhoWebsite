---
title: 'Aquele sistema RFC está vivo?'
slug: aquele-sistema-rfc-esta-vivo
date: 2013-05-27 09:00:03
tags: [sysadmin]
categories: [dicas]
wordpressId: 2278
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Queres invocar uma função RFC noutro sistema mas, porque não és necrófago, só o queres fazer se ele estiver vivo.

Precisas então de uma forma de saber se esse determinado sistema destino RFC está vivo.

Como fazes?

O Charles Santana faz assim:


{{< highlight ABAP >}}
DATA: rfcdest         TYPE rfcdest,
            ping_status TYPE /sdf/e2e_traffic_light_numeric.

CALL FUNCTION '/SDF/RFC_CHECK'
  EXPORTING
    iv_destination = rfcdest
    iv_ping        = 'X'
    iv_logon       = 'X'
    iv_latency     = 'X'
  IMPORTING
    ev_ping_status = ping_status.
if lv_ping_status <> 1.
* está morto.
endif.
{{< /highlight >}}

Obrigado Charles.

O Abapinho saúda-vos.
