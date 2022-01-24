---
title: 'F1 in the selection screen fields'
slug: f1-ecra-seleccao
date: 2012-07-09 09:00:07
tags: []
categories: [dicas]
wordpressId: 1817
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
You have just produced a wonderful report headed by a selection screen crammed full of very interesting fields. But usually those running the report will not know, if it has some complexity, what each of the fields does. There are, of course, the technical and functional specifications for this. But are there? And even if there are, wouldn’t it be easier if you could press F1 on top of each field and find out there and then what it’s for?

I'll show you two possible ways to give individualized information about the fields of a selection screen.

<!--more-->

The first uses a simple message of SE91, the second uses the texts of SE61. Both make use of the following event:


{{< highlight ABAP >}}
AT SELECTION-SCREEN ON HELP-REQUEST FOR campo.
{{< /highlight >}}

**Alternative A – Message of SE91**

This couldn’t be easier. Choose the message and display it with the command MESSAGE in the ON HELP-REQUEST event.

**Alternative B – Text of SE61**

  1. Go to transaction SE61;

  2. Choose the "General text" class and the language you use;
  3. Input the "Name" you want;
  4. Click on "Create";
  5. Compose the text (see the example here in the image);
  6. Save;
  7. In the program, call the DSYS_SHOW_FOR_F1HELP function in the ON HELP-REQUEST event, as demonstrated in the program here.

As this article is to provide help I decided to illustrate it with Ajuda (help in Portuguese) National Palace, of course.
Thanks to [Morgaine][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/morgaine/3976750744/
