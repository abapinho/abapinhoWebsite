---
title: 'Bate às portas certas'
slug: portas-sap
date: 2011-04-02 08:49:57
tags: [sysadmin]
categories: [dicas]
wordpressId: 701
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Para tua conveniência, aqui tens as portas TCP/IP utilizadas pelo _NetWeaver Application Server ABAP_ e pelo _Internet Connection Manager (ICM)_ :

<!--more-->

|Serviço|Porta/Nome|Por defeito|Fixo|
|-|-|-|-|
|Dispatcher|32NN/sapdnNN|3200|x|
|Gateway|33NN/sapgwNN|3300|x|
|Gatewy|48NN/sapgwNNs|4800|x|
|ICM HTTP|80NN|8000||
|ICM HTTPS|443NN|Inactivo||
|ICM SMTP|25|Inactivo||
|Message server|36NN/sapmsSID|3600/sapmsC11||
|Message server HTTP|81NN|8100||
|Message server HTTPS|444N|Inactivo||
|Central System Log|UDP: 12NN, 13NN, 14NN, 15NN|Inactivo||

Para saberes mais consulta [este documento da SAP][1].

O Abapinho saúda-vos.

   [1]: https://archive.sap.com/kmuuid2/902ce392-dfce-2d10-4ba9-b4f777843182/Regular%20Expression%20Processing%20in%20ABAP.pdf
