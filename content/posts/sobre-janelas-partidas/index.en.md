---
slug: sobre-janelas-partidsa
title: On broken windows
description: Pay attention to the broken window theory
date: 2025-06-09T09:00:00+01:00
tags: []
categories: [artigos]
keywords: [broken window]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

The broken window theory says that if a window in a building is broken and not repaired quickly, people will be tempted to throw stones and break the other windows.

<!--more-->

By the same token, when you have to change existing code, if it's a mess, if, to use the metaphor of [windows][1], it's broken, you're likely to feel less motivated to create beautiful code in the changes you make there.

The problem is that SAP systems are often buildings full of broken windows.

The solution I've found is to create a new package (`ZCLEAN`?), completely independent of all the others, and announce to the team that all the code that is placed underneath that package must follow all the project's good practices (which nowadays should be in line with [Clean ABAP][2]). Assuming you have [ABAP Package Concept][3] enabled on the system (you should!), that package should be defined as `STRUCTURE` or at least `MAIN`. Then you create a series of sub-packages underneath that package where the new code will live.

Don't move anything old and broken into that top package. Instead, every time there's an opportunity to create a new module or rewrite an old one, create [a sub-package][4] underneath it for that new code.

You can then configure ATC to run a daily job that checks the code of all the packages under that new package. Then you monitor the ATC's results and make sure that any problems discovered (new broken windows) are resolved quickly so as not to let things get out of hand again.

For me, this is the best way to get a development team to give up old habits and start programming without breaking any more windows.

Greetins from Abapinho.

[1]: <https://pt.wikipedia.org/wiki/Teoria_das_janelas_quebradas>
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md>
[3]: {{< ref "pacotes-2-0" >}}
[4]: {{< ref "arvore-de-pacotes-z" >}}
