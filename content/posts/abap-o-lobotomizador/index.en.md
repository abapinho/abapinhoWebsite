---
title: 'ABAP, the lobotomizer'
slug: abap-o-lobotomizador
date: 2018-10-15 09:27:05
tags: [estilo]
categories: [historias]
wordpressId: 4072
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'ABAP lobotolizador'
description: 'Quando alguém começa a programar em ABAP é lobotomizado, as boas prácticas que aprendeu no passado desaparecem e volta a programar como no ZX Spectrum.'
---
João studies Computer Science at his College where he learns Java, polymorphism, encapsulation and a lot of other programming techniques and best practices. When he graduates, he decides to join a company to work in SAP. At the introduction training which his new company offers, the first thing he learns is how to make a program in ABAP. Here's how they teach it:

_"Go to transaction SE38, create program ZJOAO and then create includes ZJOAO_TOP, ZJOAO_FRM and ZJOAO_SEL. You declare all variables in _TOP, the selection screen you put in _SEL and all the FORMS must go into _FRM. Then write START-OF-SELECTION and under that put all the SELECTs and finally write END-OF-SELECTION and there you show the results in an ALV. It's that simple. Welcome to ABAP."_

<!--more-->

Finally João is ready to start working in a real customer. Once he's there, he realises that, indeed, almost all programs have a _TOP, a _SEL and a _FORM and start with START-OF-SELECTION. Although he is intrigued because only some have END-OF-SELECTION.

One month later João is already quite at ease with SE38. By now he barely recalls what he learned in college. One year later he's become a trusted programmer, delivering serious and complex work. His programs have thousands of lines, divided into multiple FORMs with hundreds of lines each (which he dutifully writes in the _FRM). His forms don't use parameters because it would be foolish to keep passing the variables from one FORM to the other when they are already accessible by all since they're declared in the _TOP include anyway. And thus, the _TOP include of his programs has several pages and dozens of variables.

And then one day someone tells him about [encapsulation][1] and he says:

_"What? You mean reusable Function Modules in SE37? Yeah, I could make some, but I'm quite sure that no one will ever use these things again so it's not worth it."_

And then one day someone tells him about [ABAP OO][2] and transaction [SE24][3] and he says:

_"Oh, classes? I know, I know, but firmly believe classes in ABAP are bad because they take much longer to make, it's a lot of extra work and much worse to debug and in this client I would never have time for that. And besides I don't see any advantage in using them."_

So he carries on, adding more and more lines to his beloved _FRM and _TOP includes.

And then one day someone tells him about [Software][4] [Design][5] [Patterns][6] and João says:

_"Man! I had to learn UML in College and I hated it. It's useless. No one uses it in real life. And besides, those are classes and in SAP I don't think classes make any sense."_

And then one day someone tells him about the virtues of [SOLID][7] and he says:

_"Hum... that looks interesting. I wish I had the time to learn it. But not for SAP because ABAP is different and that doesn't apply to the way we program in ABAP."_

And then one day someone tells him about [ATC (ABAP Test Cockpit)][8] and he says:

_"What's that? I tried running it on the program I made and the list of errors was so long and useless that I didn't have the patience to look into it. Anyway my program is working fine."_

And off he goes, back to his SE38, filling his includes, oblivious of vulnerabilities, naming conventions, semantic flaws, uncaught exceptions, unreachable code, etc.

And then one day someone tells him about [TDD (Test Driven Development)][9] and [ABAP Units][10] and he becomes confused and says:

_"Test what? I already saw those ABAP Units somewhere in SE80 but never really cared to understand what they are. Anyway, I usually ask a functional person for some test data to do my tests and then, if it works, I just tell them it's ready and let them do most of the tests."_

And then one day someone tells him that [Shared][11] [Objects][12] are a great way to cache data across processes and he says:

_"Cache? When I need to cache something I usually create a table ZRESULTS and INSERT all the cached data into that table and then SELECT from it whenever I need it. It's fast and it works. And then I make a program that deletes the cache once per month. No one ever complained."_

And then one day someone tells him about [SAP Package Concept][13] and the advantages of using [Package Interfaces][14] and he says:

_"Packages? If it's FI I put it in package ZFI, if it's SD it goes into package ZSD and all MM stuff goes into package ZMM. This way I never get it wrong."_

And then one day someone tells him about [ADT (ABAP Development Tools)][15] and [Eclipse][16] and he says:

_"I used Eclipse in College. But that was for Java. I don't see any advantage in using it for ABAP. That's silly."_

And then one day someone tells him about [abapGit][17]m an open source project which lets you use the wonderful [git][18] with ABAP, and he says:

_"But I can already make versions in ABAP! And besides, when I need to store versions of my programs or copy them to another system I use NOTEPAD.EXE and it never failed me."_

And because, in the SAP world, customers almost never care about the quality of their code, don't have to comply with coding industry standards, rarely enforce any kind of quality control (and when they do, it's done by someone who thinks like João), 10 years later João is still proudly chained to his SE38, creating _TOP, _FRM and _SEL includes.

And then one day someone asks him what he does for a living. And he says:

"I am a Computer Engineer."

Não he's not.

   [1]: https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)
   [2]: https://archive.sap.com/documents/docs/DOC-10236
   [3]: http://zevolving.com/category/abapobjects/
   [4]: https://en.wikipedia.org/wiki/Software_design_pattern
   [5]: https://en.wikipedia.org/wiki/Design_Patterns
   [6]: http://shop.oreilly.com/product/9780596007126.do
   [7]: https://en.wikipedia.org/wiki/SOLID
   [8]: https://blogs.sap.com/2012/10/18/getting-started-with-the-abap-test-cockpit-for-developers/
   [9]: https://en.wikipedia.org/wiki/Test-driven_development
   [10]: https://wiki.scn.sap.com/wiki/display/ABAP/ABAP+Unit
   [11]: https://help.sap.com/doc/saphelp_nw70/7.0.31/en-US/14/dafc3e9d3b6927e10000000a114084/frameset.htm
   [12]: https://blogs.sap.com/2015/02/19/how-to-use-shared-object-memory-and-sap-memory-to-share-the-objects-for-processing-in-sap-with-an-example/
   [13]: https://blogs.sap.com/2011/12/04/abap-package-concept-part-1-the-basics/
   [14]: {{< ref "pacotes-2-0" >}}
   [15]: https://blogs.sap.com/2012/06/12/faqs-abap-development-tools-for-eclipse/
   [16]: https://blogs.sap.com/2014/03/17/how-to-get-your-colleges-into-abap-in-eclipse/
   [17]: https://github.com/larshp/abapGit
   [18]: https://git-scm.com/
