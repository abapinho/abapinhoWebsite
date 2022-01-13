---
title: 'Communication by event between programmes'
slug: comunicacao-por-evento-entre-programas
date: 2014-12-22 09:00:11
tags: []
categories: [artigos]
wordpressId: 2943
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
In Greek mythology, the gods’ most commonly used means of communication with mortals was rape. They would rape for no reason whatsoever.

The closest thing we have to rape in ABAP is the command “SUBMIT”, which is also the most common way of communicating between two programmes.

<!--more-->

But there are less crude ways for a programme to communicate with another, e.g. by using an event.

Let’s imagine you have a programme called ZEUS (strictly speaking, it would be ZEUS_TOURO, but OK) that wants to communicate with another called ZEUROPA.

  1. In the SM62 transaction, you create the event with a type Z* name. Let’s call it ZAS! Once it is created, you can find it near the end of the long list of events, next to the other events created by the client;

  2. If you right-click, you can do a whole lot of things with it. One of these is to transport it, i.e. add it to a transport order;

  3. In the ZEUS programme, in the place where ZEUROPA should be called up, enter the following code:


{{< highlight ABAP >}}
CALL FUNCTION 'BP_EVENT_RAISE'
  EXPORTING
    eventid                      = 'ZAS'
 EXCEPTIONS
   BAD_EVENTID                  = 1
   EVENTID_DOES_NOT_EXIST       = 2
   EVENTID_MISSING              = 3
   RAISE_FAILED                 = 4
   OTHERS                       = 5
{{< /highlight >}}

  4. In the SM36 transaction, create a _job_ ZEUS_ZAS_EUROPA with a single step, the execution (heaven forbid) of ZEUROPA;

  5. In the execution conditions of the _job_ choose the option "after event" and select the ZAS event. Save.

Alright then.
When you run the ZEUS programme,
It launches the event ZAS,
Which triggers the job ZEUS_ZAS_EUROPA,
Which executes (heaven forbid) ZEUROPA.

Greetings from Abapinho.
