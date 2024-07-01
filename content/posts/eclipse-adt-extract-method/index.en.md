---
slug: eclipse-adt-extract-method
title: eclipse-adt-extract-method
description: eclipse-adt-extract-method
date: 2024-06-30T14:34:34+01:00
tags: []
categories: []
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

When you have a very large method, you should subdivide it into several smaller ones.

<!--more-->

Clean ABAP [says that][1] methods should ideally have 3 to 5 commands and suggests a maximum of 20 in extreme cases. If you're still making 300-line methods, think about it, be ashamed of yourself and go and subdivide them.

Mr Martin Fowler has studied in depth the optimum processes for refactoring programmes and has published his results in an excellent book called [Refactoring][2] which I strongly advise you to read. Alternatively, you can consult the website [refactoring.guru][3].

The book _Refactoring_ describes systematic processes for carrying out each of the cases. These are the steps it proposes for the [Extract Method][4] technique:

1. Create a new method and name it in a way that makes its purpose self-evident.
2. Copy the relevant code fragment to your new method. Delete the fragment from its old location and put a call for the new method there instead.
3.  Find all variables used in this code fragment. If they’re declared inside the fragment and not used outside of it, simply leave them unchanged—they’ll become local variables for the new method.
4. If the variables are declared prior to the code that you’re extracting, you will need to pass these variables to the parameters of your new method in order to use the values previously contained in them. Sometimes it’s easier to get rid of these variables by resorting to Replace Temp with Query.
5.  If you see that a local variable changes in your extracted code in some way, this may mean that this changed value will be needed later in your main method. Double-check! And if this is indeed the case, return the value of this variable to the main method to keep everything functioning.

## In SAPGUI

Right. Same old poo. If you want to extract part of the code from one method to another, you have to do it all by hand. There's no automation here. No wonder people who use SAPGUI tend to make long methods. SAPGUI should be called an IUE instead of an IDE, the U standing for Underdeveloped.

## In Eclipse ADT

1. Select the code you want to extract
2. Right button, _Source code > Extract method_
3. Name the new method and adjust the parameters
4. Next, next, finish.

There, that's it. The 5 steps described above have been carried out automatically. Follow them.

## Conclusion

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#keep-methods-small>
[2]: <https://martinfowler.com/books/refactoring.html>
[3]: <https://refactoring.guru>
[4]: <https://refactoring.guru/extract-method>
