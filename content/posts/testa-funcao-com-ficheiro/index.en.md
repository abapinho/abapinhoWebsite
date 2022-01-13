---
title: 'Test function module with data loaded from a file'
slug: testa-funcao-com-ficheiro
date: 2018-06-04 09:00:33
tags: [se37, testes]
categories: [artigos]
wordpressId: 3982
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Transaction SE37 lets you test function modules. Sometimes these function modules use tables. And sometimes you need to load these tables with a lot of data records. But the only way to do it is manually. Or maybe not...

Here's a trick to do it using a file.

<!--more-->

1\. In SE37 choose the FM you want to test and entre debug mode:

[![][1]][1]

2\. Create a _break-point_ in function module RS_COMPLEX_OBJECT_EDIT:

[![][2]][2]

3\. Press F8 to continue. It should stop in the function with the break-point:

[![][3]][3]

4\. Inspect variable OBJECT (which is an internal table ) and enter into it with double click:

[![][4]][4]

5\. Press the tools icon to access the available tools:

[![][5]][5]

6\. Pick tool "Upload from file" and load the desired file (which must have the same structure as the table you're populating):

[![][6]][6]

7\. The table is now populated with the content of your file:

[![][7]][7]

8\. Press F8 again to go back to the test screen, now with the table populated and ready for you to run your test:

[![][8]][8]

Thank you Rui Couto for demonstrating this great trick.

Photo: [MGI Construction Corp.][9] in [Visualhunt.com][10] / [ CC BY-ND][11]

Greetings from Abapinho.

   [1]: images/Picture1.png
   [2]: images/Picture3.png
   [3]: images/Picture4.png
   [4]: images/Picture5.png
   [5]: images/Picture65.png
   [6]: images/Picture6.png
   [7]: images/Picture7.png
   [8]: images/Picture8.png
   [9]: https://visualhunt.com/author/c56abe
   [10]: https://visualhunt.com/re/0b3fcb
   [11]: http://creativecommons.org/licenses/by-nd/2.0/
