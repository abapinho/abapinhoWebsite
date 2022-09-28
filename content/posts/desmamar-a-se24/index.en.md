---
slug: desmamar-a-se24
title: Let go of SE24
description: Get rid of the bicycle training wheels
date: 2022-10-03T09:09:09+01:00
tags: [se24]
categories: [artigos]
keywords: [se24]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
In SE24 the class code is partially hidden from the programmer behind a GUI. This is apparently convenient but ultimately limitative.

<!--more-->

## Why

Because it:

- 🍼 Prevents the programmer from really know the full syntax of an ABAP class
- 🚢 Requires a lot of navigation which is slow and confusing
- 🌎 Makes it hard to look at the class as a whole

And then there is the shame issue, of course:

```text
- Hello, do you know ABAP?
- Yes I do.
- Can you write an "Hello World" class in ABAP, right here, right now?
- No, not without SE24.
- Oh, I thought you knew ABAP. Bye.
```

By letting go of the _user-friendly_ `SE24` GUI, you'll regain control over all the aspects mentioned above.

## How

First remember: _no pain, no gain_ 😓:

- 🤔 Acknowledge that, after so many years relying on `SE24` to navigate an ABAP class, switching to raw code will not be immediately intuitive;
- 🧘‍♂️ Understand and believe that soon the strangeness will be gone and you'll be loathing every time you're forced to endure the awkward `SE24` navigation.

### Start as a Padawan

- Keep working in `SE24` but...
- switch to _Source-Code-Based_ and...
- slowly learn the syntax needed to fully define and implement a class, its methods, attributes, etc...
- switching back to _Form-Based_ navigation whenever you're stuck or are not sure about something.

### Then become a Jedi

- Install Eclipse and ADT ([ABAP Development Tools][1])
- Connect Eclipse to your development systems
- Add the packages on which you need to work
- Enjoy a modern IDE: raw code + navigation + inspection + extra functionalities:
  - Refactoring (rename galore!)
  - All errors immediately flagged in the code without having to compile it
  - Open dozens of (splittable) windows
  - See details on any variable _in loco_, without context switching
  - Etc

Greetings from Abapinho

  [1]: <https://developers.sap.com/tutorials/abap-install-adt.html>
