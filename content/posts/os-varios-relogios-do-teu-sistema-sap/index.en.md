---
title: 'The multiple clocks of your SAP system'
slug: os-varios-relogios-do-teu-sistema-sap
date: 2018-10-22 09:00:08
tags: [sysadmin]
categories: [dicas]
wordpressId: 4088
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Even though you look at an SAP system as a whole, it is composed by several distinct and interconnected parts. There is a small standard program which checks if each part's clock is correct and synchronised.

It probably won't be of much use for your daily work. Still, it's an interesting curiosity.

<!--more-->

The program is called RSDBTIME and the result I got when I ran it is here:


{{< highlight ABAP >}}
R/3 Time Diagnostic Program on srv01
------------------------------------

Universal Time Coordinated UTC....: 1539985264

Date and time of database.........: 19.10.2018 22:41:04

Date and Time of R/3-Kernel.......: 19.10.2018 22:41:04

Date and Time of ABAP-Processor...: 19.10.2018 22:41:04
ABAP Timezone Setup ..............:     0

Date and Time / localtime ........: 19.10.2018 22:41:04

No Time Inconsistencies detected !

Checking GET RUN TIME from 22:41:05 to 22:41:10 during 00:00:05
GET RUN TIME result ..............:  4.999.454  us

GET RUN TIME time measurement accuracy ok !
{{< /highlight >}}

Thank you Sérgio Fraga for the tip.
Photo: [CallMeWhatEver][1]

Greetings from Abapinho.

   [1]: https://visualhunt.com/author2/4ba334
