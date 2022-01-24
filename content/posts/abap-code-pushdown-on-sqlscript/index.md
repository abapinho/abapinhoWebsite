---
title: 'ABAP Code PushDown em HANA'
slug: abap-code-pushdown-on-sqlscript
date: 2016-07-25 09:00:10
tags: [hana, sapgui, sql]
categories: [artigos]
wordpressId: 3587
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
[Artigo por Artur Moreira]

A SAP introduziu a partir da versão 7.4 do ABAP o conceito de Code PushDown, que significa utilizar mais a base de dados para cálculos (agregação de dados, somas e vários cálculos prévios).

<!--more-->

Essas novas potencialidades do ABAP surgem associadas à recente Base de Dados SAP HANA, da qual a SAP é proprietária.

Com essas ferramentas, podemos efetuar JOINs e Agregações, que poderão otimizar o nosso código ABAP em termos de performance.

Pretendemos saber como é que isso pode ser feito em ABAP:

Para esse efeito podem ser criadas CDS Views(Core Data Services Views) ou podem ser executados procedures da Base de Dados HANA (AMDP – ABAP Managed Stored Procedure).

As CDS Views são código SQL DDL que dá origem a views que podem depois ser consultadas na transação SE11 e ainda consumidas pelo código ABAP.

As AMDPs são procedures que podem ser chamados em programas ABAP através da chamada do respetivo método, sendo o código executado diretamente em HANA.

As CDS Views e AMDPs são criadas e modificadas através da ferramenta HANA Studio, podendo no entanto ser consultadas em SAP através do bem conhecido SAP GUI (não podem no entanto ser modificadas via SAP GUI).

O código das CDSs e AMDPs é escrito na linguagem de Base de Dados à qual a SAP chamou SQL Script. A base da linguagem é SQL AINSI, como algumas funcionalidades específicas do HANA.

Para quem queira aprender mais sobre SQLScript, a SAP disponibiliza o seguinte documento:
<https://help.sap.com/hana/SAP_HANA_SQL_Script_Reference_en.pdf>

Sobre CDS Views:
<https://scn.sap.com/docs/DOC-70385>

Sobre AMDPs:
<https://scn.sap.com/docs/DOC-51146>

A linguagem SQLScript pode ainda ser utilizada diretamente na Base de Dados SAP HANA, através do HANA Studio, em várias perspetivas e âmbitos, mas neste caso, já fora do cenário ABAP.

Obrigado Artur Moreira por este interessante artigo.

Foto: [MysteryBee][1]

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/mysterybee/1659329016/
