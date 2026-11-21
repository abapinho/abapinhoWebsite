---
slug: strangler-fig-pattern
title: Strangle the old unmanageable code
description: Here is a technique to gradually replace legacy with modern code
date: 2026-11-23T09:00:00Z
tags: []
categories: [artigos]
keywords: [strangler fig pattern]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When I teach OOP and _Clean ABAP_, one of the most common concerns I hear is:

_This all makes a lot of sense, but how can I apply it to old code with horrible routines that are thousands of lines long?_
<!--more-->

It's true that, with a few rare exceptions, rewriting those thousands of lines so they follow today's best practices is out of the question. But all is not lost.

The solution is to use the [Strangler Fig Pattern][1]: whenever you need to change some part of one of those routines, do the following:

1. Identify the piece of code involved in that change, which will therefore need to be retested (see that as an opportunity to rewrite it);
2. Extract that code into a new method, ideally in a separate class (using an existing one or creating a new one if none is suitable, but the important thing is that it ends up isolated in a method);
3. Create a parameter for each variable (input and output) involved in that code, so that the method becomes self-contained and doesn't depend on any global variable. That keeps it flexible enough to, for example, be moved to another class later, and it also makes it easier to test;
4. Rewrite that now isolated and independent routine so that it's up to date and modern and follows current best practices;
5. Now the old huge routine, instead of this old code, should contain just a call to the new method;
6. Test and confirm that it still works as before;
7. Finally, implement the changes that led you to touch this code in the first place;
8. Test again, this time with the new changes in place.

Every time that old code needs changing is an opportunity to strangle it a little more, replacing parts of the old, hard-to-manage code with small, modern modules that are more robust and easier to maintain.

Future modifications to the parts of the code that have already been modernized should be easier and safer to make.

After a few iterations, you may reach the point where a good part of that code is no longer unmanageable and is now just a series of calls to small modern modules. At that point it may even be realistic to consider a project to rewrite whatever is left of the old code.

Above all, what matters is adopting the discipline of never missing the opportunity to isolate and modernize the parts of the legacy code that you have to modify. With every change, always try to leave the code better than you found it.

Obrigado Peter Woodard pela [foto][2].

Greetings from Abapinho.

[1]: <https://en.wikipedia.org/wiki/Strangler_fig_pattern>
[2]: <https://commons.wikimedia.org/wiki/Special:Redirect/page/5920414>
