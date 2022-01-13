---
title: 'Test a sequence of function modules in SE37'
slug: testa-uma-sequencia-de-funcoes-na-se37
date: 2018-07-09 09:00:17
tags: [se37, segredo, testes]
categories: [dicas]
wordpressId: 4008
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
I was sure I had already posted about this before but I can't find it so here it goes (again?).

Some function modules save global data which must then be used by another function module belonging to the same function group. So, if you need to test them, they must run in sequence inside the same transaction.

Everybody knows you can use SE37 to test a function module. What few people know is that you can also use SE37 to test a sequence of function modules inside the same transaction. Those who don't know this end up creating a small program to call those functions in sequence and that's also ok. But here's how you can avoid that.

<!--more-->

  * In the first screen of SE37 go to menu Function Module > Execute > Test sequences;

  * You'll get a popup with a list where you can enter the function modules in the order you want them to run;

  * Press F8 and you'll get a screen with the parameters for the first. Populate them;

  * Press F8 again to test the first function module. You'll get its results;

  * Press F3 to go back and, surprise, you'll now get the parameter screen for the next function module. Populate them;

  * Press F8 yet again to test the second function module. You'll get its results.

And this is how you can use SE37 to test several functions in sequence.

A classical example of the need for this is when a function module needs a COMMIT afterwards. The SE37 function testing tool doesn't commit in the end. As a solution you can create a sequence with the function module you want to test followed by BAPI_TRANSACTION_COMMIT. Presto!

Greetings from Abapinho.
