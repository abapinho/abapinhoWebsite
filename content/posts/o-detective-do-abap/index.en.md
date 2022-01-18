---
title: 'The ABAP detective'
slug: o-detective-do-abap
date: 2014-03-10 09:00:42
tags: [estilo, sapgui]
categories: [artigos]
wordpressId: 2622
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When a development is completed in SAP, the time to send it to other systems where it can be duly tested and then executed by users has finally arrived.
Before that occurs, however, it has to be checked for lapses, errors and other problems that could lead to our programmes behaving in an unpredictable manner.
There is a very useful tool that allows some of these errors and gaps to be filtered out. It is called ABAP Code Inspector.

<!--more-->

[![odetectivedoabap1][1]][1]

**What is the Code Inspector?**

bjects in a static way, in order to diagnose problems of performance, security, syntax and adherence to naming conventions of the customers.

Using the SCI transaction, inspections can be made with the results made available for viewing in the system.
The inspections may be made on individual objects or sets of objects. Each inspection is based on check variants that configure the filters and criteria to be taken into account in the analysis.
There already are many standard check variants that can be used but new ones can also be created, adapted to the specific requirements of our customers/projects.

The Code Inspector is, therefore, a code analysis tool.

There are also performance analysis tools provided by SAP, such as SE30 (Runtime Analysis Tool), ST05 (Performance Trace) and ST30 (Global Performance Analysis Function). But we won't focus on those in this article.

It can be called in two ways:

  1. Directly from the SE37, SE38 and SE24 transactions, to inspect individual objects;

  2. Independently, via the SCI transaction. This is undoubtedly the most powerful form of calling it, since Object Sets may be configured by this means to define a set of objects to be inspected and the check variants, as we shall see below.

SCI Transaction:

[![odetectivedoabap2][2]][2]

**How do you perform an inspection via SCI?**

Firstly we name the inspection. Then we choose Object Set, Request, or Single. In this case we chose Single Object to analyse only one programme and we leave the DEFAULT variant.

There are 2 execution options: immediately or in background.

[![odetectivedoabap3][3]][3]

Clicking on the 'Result' button returns a list of errors, warnings and information that we will be able to use to detect, correct and improve the analysed code. Each line has detailed information about what was detected and how it can be corrected, and it enables you to navigate directly to the exact place in the source code.

[![odetectivedoabap4][4]][4]

**Configuring Object Sets**

We may want to, unlike in the previous example, analyse a set of specific elements. We create an Object Set to do this:

[![odetectivedoabap5][5]][5]

Once created, the Object Set is available to be used in all future inspections.

**Creating Check Variants**

As already stated, a check variant allows you to exactly define the criteria to be considered during the analysis. We have an extensive list of possibilities at our disposal when creating a check variant, which can be configured as required. Each line has a help text that explains its effect.

[![odetectivedoabap6][6]][6]

In the example here we have the possibility of checking naming conventions:

[![odetectivedoabap7][7]][7]

We can define performance filters (search for SELECTs or interlinked LOOPs), look for executions that may cause critical and unstable performance (critical statements), check if the SY-SUBRC is duly tested and also if table indexes and keys are being used in the most correct way. Moreover, there is a whole set of possibilities for filters and searches for critical elements of our code.
It should be noted that the more criteria you add the longer it will take for the inspection to be performed and more warnings will be presented.

Inspection, Object Set and Check Variant can be created as local objects (only visible to the user) or as global objects (available to all authorised users).
Just click on the symbol in front of your name to change from local to global.

The Code Inspector is a powerful tool that allows the performance of programmes to be optimised and prevents inefficient and counter-productive behaviour.
It also helps us to write more readable programmes that comply with the global conventions indicated by SAP.

**Find out more**

[http://help.sap.com/saphelp_nwpi711/helpdata/en/8d/ 4b64488cce3945ba42b059319d62dc/content.htm][8]

<http://scn.sap.com/docs/DOC-15932>

<http://scn.sap.com/community/abap/testing-and-troubleshooting/blog/2007/03/12/code-inspector-s-performance-checks-i>

Abapinho thanks Artur Moreira.

   [1]: images/odetectivedoabap1.jpg
   [2]: images/odetectivedoabap2.jpg
   [3]: images/odetectivedoabap3.jpg
   [4]: images/odetectivedoabap4.jpg
   [5]: images/odetectivedoabap5.jpg
   [6]: images/odetectivedoabap6.jpg
   [7]: images/odetectivedoabap7.jpg
   [8]: http://help.sap.com/saphelp_nwpi711/helpdata/en/8d/4b64488cce3945ba42b059319d62dc/content.htm
