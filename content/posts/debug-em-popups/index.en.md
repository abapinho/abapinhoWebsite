---
title: 'Debugging while in modal dialogue boxes'
slug: debug-em-popups
date: 2012-01-09 10:00:29
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1307
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
There are times when you can’t do /H to launch _debugger_. The most common one is when a pop-up window is open. However there is a simple, if Heath-Robinson, way to do it:

<!--more-->

1\. Create a simple text file containing the following:
[FUNCTION]
Command=/H
Title=Debugger
Type=SystemCommand

2\. Save the file in a folder or on the desktop

3\. Drag the file from where you saved it and drop it on top of the dialogue box, while yelling ABRACADABRA.

And that, in a curious way, as if by magic, if you yelled, is how _debug_ can be activated, to your boundless joy.

It is true that everyone probably knows this one already, but it is so important that Abapinho decided it had to go in.

(Thanks to [alandberning][1] for the photo)

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/14617207@N00/4609793276/
