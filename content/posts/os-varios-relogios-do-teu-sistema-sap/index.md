---
title: 'Os vários relógios do teu sistema SAP'
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
Ainda que o SAP nos apareça como um todo, este é constituído por várias partes independentes interligadas. Há um pequeno programa standard que verifica se os relógios de cada uma destas partes estão correctos e sincronizados.

Provavelmente não será de grande utilidade no dia-a-dia. Mas não deixa de ser uma curiosidade engraçada.

<!--more-->

O programa chama-se RSDBTIME e o resultado de quando o corri ainda agora é o seguinte:


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

Obrigado Sérgio Fraga pela dica.
Foto: [CallMeWhatEver][1]

O Abapinho saúda-vos.

   [1]: https://visualhunt.com/author2/4ba334
