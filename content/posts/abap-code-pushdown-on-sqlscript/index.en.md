---
title: 'ABAP Code PushDown in HANA'
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
[Guest post by Artur Moreira]

From ABAP version 7.4, SAP introduced the code pushdown concept, which means using more database for calculations (data aggregation, sums and previous calculations).

<!--more-->

These new ABAP capabilities arise associated with recent database SAP HANA, which is owned by SAP AG.

With these tools, we can do JOINs and aggregations, which can optimize our ABAP code in terms of performance.
We intend to know how this can be achieved in ABAP:

For this purpose can be created CDS Views (Core Data Services Views) or can be performed procedures HANA database (AMDP - ABAP Managed Stored Procedure).

CDS Views are simply SQL DDL code that give rise to views that can be found in SE11 transaction and still be consumed by ABAP code.

The AMDPs are procedures that can be called in ABAP programs by calling the appropriated method, which runs the code directly in HANA.

CDS Views and AMDPs are created and modified by HANA Studio tool, but may latter be found in SAP through the well know SAP GUI (cannot however be modified via SAP GUI).

The code of CDSs and AMDPs is written in the database language to which SAP called SQL Script. The base of the language is SQL AINSI plus some specific features of SAP HANA.

For those who want to learn more about SQLScript, SAP provides the following document:
<http://help.sap.com/hana/SAP_HANA_SQL_Script_Reference_en.pdf>

About CDS Views:
<http://scn.sap.com/docs/DOC-70385>

About AMDPs:
<http://scn.sap.com/docs/DOC-51146>

SQL Script language can also be used directly in the SAP HANA database, through HANA Studio in various perspectives and levels, but in this case, outside the ABAP scenario.

Thank you, Artur Moreira, for this interesting post.

Photo credit: [MysteryBee][1] via [VisualHunt][2] / [CC BY-SA][3]

   [1]: https://www.flickr.com/photos/mysterybee/1659329016/
   [2]: https://visualhunt.com
   [3]: http://creativecommons.org/licenses/by-sa/2.0/
