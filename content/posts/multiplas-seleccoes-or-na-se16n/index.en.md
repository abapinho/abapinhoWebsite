---
title: 'Multiple OR selections in SE16N'
slug: multiplas-seleccoes-or-na-se16n
date: 2015-08-03 09:00:15
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 3156
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
If you are one of those persons who still uses SE16, this article is not for you. If you keep reading, you might find yet another reason to finally start using SE16N (as if all others were not enough already).

Imagine that you want to select all materials whose name contains "PREGO" and whose type is "FERRAGENS", and all materials whose name contains "GUARDANAPO" and whose type is "COMIDA". In other words, "PREGO_NO_PAO" or "GUARDANAPO_PAPEL" won't be part of the result set. What you want is this:

(MATNR = “PREGO%” AND MTART = “FERR” ) OR (MATNR = “GUARDANAPO%” AND MAKT = “COMI” )

As you know, using SE16N in a regular way (which doesn't use what I'm about to show you) you would need to execute it twice and manually compare data, because the selection screen does not allow you to make multiple OR selections.

Or does it?

<!--more-->

Yes it does.

  1. Start by activating technical view on "Extras -> Technical View ON";

  2. Then, insert the first part of the condition in the regular selection screen;

  3. Go to "Extras" menu and choose the "Multiple Entry" option. A window will popup with a new empty selection screen;

  4. Fill this new selection screen with the second part of the condition;

  5. You can further complicate the selection by introducing extra criteria, using the left/right arrows;

  6. When you're satisfied, execute and the union of the multiple selection results will be presented to you;

Thank you Carlos Constantino for the tip.
And thank you Diogo Simões for the translation.

Greetings from Abapinho.
