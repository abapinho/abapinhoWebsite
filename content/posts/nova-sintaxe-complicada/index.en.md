---
slug: nova-sintaxe-complicada
title: To all those whole criticize 7.4 syntax
description: There are always some who resist instead of adapt
date: 2024-01-15T09:01:01Z
tags: [7.4]
categories: [historias]
keywords: [ABAP reactionary]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

This post is addressed to the collective character that represents all the people who have told me that they like some things in the new 7.4 functional syntax but think that you shouldn't overdo it and should avoid using `REDUCE` and all the other unnecessarily weird things because the code gets more obscure, it's slower and they don't see any advantages.

Are you serious?

<!--more-->

I'm not surprised you say that. After all, you also spent years telling me that you didn't see any advantages in object-oriented programming and you continued to surround yourself comfortably with `FORM`s and `FUNCTION MODULE`s until recently.

And it was also you who, when your project finally forced you to adopt classes, started using them as if they were functions without ever really understanding how to think in OO.

It's fascinating to me that you live peacefully adding one more IF inside another IF inside another IF to your 2500-line methods every day, but then you get stuck with a 4-line `REDUCE` that you can't decipher the first time you look at it. And instead of learning it and starting to use it to gain experience, you choose to theorize about its obvious disadvantages.

But that's okay. The SAP world, being so backward and removed from the rest of the industry, allows this to happen. Fear not. You've been getting away with it and you will continue to do so.

So let's get to your arguments:

- Speed: let's start with the simplest. You haven't tried it, have you? If you had, you would have been surprised: in all the experiments I've done, the new syntax is faster or similar. This reminds me of when you used to say that using classes and methods was bad because it slowed down SAP by taking too long to instantiate classes and call methods. And while saying this, you were spreading `SELECT`s throughout the code without ever worrying about the fact that a `SELECT` is several orders of magnitude slower than anything else you do in ABAP;

- Obscure: this coming from someone who uses global variables (now in the form of class attributes) so as not to have to pass things around in parameters, but ok. Of course, a command can become obscure if you try to do everything at once. But just because the new syntax is so powerful that it allows it, doesn't mean you should do it. That's like saying gunpowder is bad because it blows people up. The solution is always the same: learn to use it and use it sensibly. I'd even say that the potential for functional commands to become too dense is an advantage because, if a command becomes too complicated, it stands out and makes you want to subdivide it into 2 or 3 to keep it readable. With imperative code, on the other hand, as each command is simple to understand, what happens is that you add another IF here and another auxiliary variable there and suddenly you have an unmanageable algorithm with 300 lines in which each bit remains simple but the whole is already so confusing that you're afraid to touch it. Now that's a disadvantage;

- No advantages: man, go read. Read [Clean Code][1], [Head First Design Patterns][2] and [Refactoring][3], watch this lesson by [Uncle Bob on SOLID principles][4] and here are some links to enlighten you: [SOLID principles][5], [Clean ABAP][6], [Refactoring][7], [Design patterns][8].

See you soon.

Greetings from Abapinho.

[1]: <https://app.thestorygraph.com/books/0fb5f91c-d628-4366-88b1-eda9c4bfdc75>
[2]: <https://drive.google.com/file/d/1U_9ZtNsO3qGLD7YwM94dp_cFjio33QjK/preview>
[3]: <https://app.thestorygraph.com/books/3b87bb83-ff18-425d-be63-055b43299e25>
[4]: <https://www.youtube.com/watch?v=zHiWqnTWsn4&t=12s>
[5]: <https://en.wikipedia.org/wiki/SOLID>
[6]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md>
[7]: <https://refactoring.guru/refactoring>
[8]: <https://refactoring.guru/design-patterns>
