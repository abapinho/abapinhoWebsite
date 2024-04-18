---
slug: eclipse-adt-f2
title: The magical F2 in Eclipse ADT
description: eclipse-adt-f2
date: 2024-04-17T17:06:45+01:00
tags: []
categories: []
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Eclipse ADT calls it _Code element information_.

<!--more-->

And it's great.

Imagine the following scenario: you're modifying a method in a class. In that method there's a variable and you need to know what values are declared in its domain.

## In SAPGUI

1. Double-click on the variable. If the variable is declared, the editor jumps to another part of the screen and displays the declaration of that variable. If the variable was created _in-line_ then it jumps to where it was created, which is more confusing because you still don't know what type the variable is. But let's assume that it has been declared.
2. Now you have to double-click on the data element with which it was declared.
3. A pop-up appears asking you if you want to save the code because you have to jump to another context. This is where it gets tricky, because you wouldn't save it yet since you're in the middle of a change and the code is not even compiling. But you don't have a choice, you have to save or you won't get out.
4. So you do it. And off you go to the third context: the `SE11` screen with the details of the data element.
5. Now double-click again, this time on the domain. You go to the fourth context: the `SE11` screen with the domain details.
6. Click on the _Value range_ tab, which takes you to the fifth and final context: the list of values associated with the domain. You've seen what you need to see to clear your doubts and you're ready to get back to the code. But... you're so far away from it. You've probably been distracted to something else by now. To get there you have to do
7. `F3`,
8. `F3`,
9. `F3`,
10. `F3`,
11. `F3`.

Do you think that's reasonable? I don't.

## In Eclipse ADT

1. Place the cursor over the variable and press `F2`. A small contextual pop-up appears, giving you a link to the data element and its associated documentation. The code remains in the same place.
2. Click on the link and in the same small window you now see the details of the data element, with all its descriptions and a link to the domain.
3. Click on the domain and you now have the domain details, including the values associated with it. That's it. How do you get back to the code now? Actually, you're still in the code. You never left it. You just have a small popup window on top of it.
4. Click somewhere outside the window and it disappears. That's it. You can continue what you were doing without being interrupted by 5 different contexts. And you can do this all the time, which is what I do.

It's great.

## Conclusion

So if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho
