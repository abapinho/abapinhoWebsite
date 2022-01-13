---
title: 'Jump The Wall'
slug: salta-a-parede
date: 2012-08-06 09:00:31
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1877
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Turn down the music.
Close the door.
Look around.
Is anyone looking at you?
Are you being watched?
Are there any security cameras?
If not, we can go on.

<!--more-->

Focus.

And do the following:

  1. In SE38 open the LSKEYF00 program, search for the JUMP_THE_WALL FORM and insert a _breakpoint_ on the line CHECK SY-SUBRC NE 0;
  2. While still in SE38, open any _standard_ program you want to alter and click on "modify". The debugger opens up (it pains me to call it by its Portuguese name, “depurador”);
  3. Alter the value of the SY-SUBRC variable to 0 (zero) and then advance with F8. Repeat this step as many times as necessary;
  4. Make all the changes you want to the _standard_ program;
  5. Click on the activate button. The system will stop at the _breakpoint_ and therefore you will have to resume again at step 3.

That's it. You've changed a _standard_ program in a devious and illegal manner and now you will probably have to make a run for it because your username was registered there as the last person who made alterations, and sooner or later they will discover what you have done.

Put on some headphones with [this track][1] and catch a plane to [here][2].

Note 1: This only works in the development machine.
Note 2: It doesn’t just work in SE38. It also works with tables, structures, classes, functions, etc.

Thanks to Jose Faria for risking his life to share this tip.

And thanks to [K. D.][3] for the photo.

Greetings from Abapinho.

   [1]: http://www.youtube.com/watch?v=U0gjwpMb-k8
   [2]: http://pt.wikipedia.org/wiki/Istambul
   [3]: http://www.flickr.com/photos/kaidolata/5139787330/
