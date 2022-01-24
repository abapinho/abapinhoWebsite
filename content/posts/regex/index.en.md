---
title: 'Have you used regular expressions before?'
slug: regex
date: 2013-07-15 09:00:55
tags: []
categories: [artigos]
wordpressId: 2392
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Regularly expressions have been around for ages. But they’re not very well known and even less used. They are a sort of descriptive language that allows for making research and very sophisticated replacements in alpha-numeric chains.

A simple example: to validate an email address. If you have to do this through an algorithm you’ll have to work hard. However, with regular expressions, only two or three code lines and the regular expression ["\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\b"][1] are enough.

It’s almost always necessary to research and to make relatively complex replacements within alpha-numeric chains, and it’s almost certain that resorting to regular expressions is preferable to developing your own algorithm.

There are two steps in using regular expressions.

  1. Creating the ABAP code to do what we want, either a research, a validation, or a replacement;

  2. Determining the regular expression per se that solves our problem.

Considering the first step there are two possible approaches to use regular expressions in ABAP:

  * Use the FIND and REPLACE commands, together with REGEX;

  * Use CL_ABAP_REGEX and CL_ABAP_MATCHER classes.

The first one is more simple and direct, but the second one is much more flexible and has the advantage of better performance if we intend to apply the thing on a mass level.

[Here][2] you’ll find the online official SAP documentation on regular expressions in ABAP. All over the web, there are examples and documentation on how to use regular expressions in ABAP.

Concerning the second step, it’s important to keep in mind that:

  * Regular expressions are a pattern, available in most programming languages, and as such, the same regular expression should have a similar behaviour in ABAP, Java or any other language implementing it. Thus, in order to learn regular expressions, you won’t have to do it in the ABAP context;

  * You are not inventing the wheel. By being so powerful, regular expressions are complex. On most typical circumstances there’s already a regular expression created by someone which will do exactly what you need. Thus, before you waste time trying to make your own regular expression, search for one that's already been made. There are regular expressions databases online, such as [this][4];

  * [Here][5] you have a good tutorial on regular expressions. It’s based on .NET, but that’s not relevant, since, as I’ve said, it’s all the same;

  * The fabulous program **DEMO_REGEX_TOY** (SE38) allows you to test your regular expression and adjust before you finally place it on the program where you intend to use it.

I seldom use regular expressions. But when I do, I know the alternative would be painful. Above all, what you need to know is that they exist, their scope and how they work, in order to realise the advantage of using them.

If you’re curious, [Wikipedia][6] is a good starting point to learn about this fascinating tool.

Thank you, Irene Nobrega for the [photo][7].

Greetings from Abapinho.

   [1]: https://www.regular-expressions.info/email.html
   [2]: https://help.sap.com/abapdocu_70/en/ABENREGULAR_EXPRESSIONS.htm
   [4]: https://regexlib.com/
   [5]: https://www.codeproject.com/Articles/9099/The-30-Minute-Regex-Tutorial
   [6]: https://en.wikipedia.org/wiki/Regular_expression
   [7]: https://www.flickr.com/photos/irenewn/
