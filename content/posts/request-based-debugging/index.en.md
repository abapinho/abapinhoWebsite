---
title: 'Request Based Debugging'
slug: request-based-debugging
date: 2014-05-12 09:00:10
tags: [debug, sapgui]
categories: [artigos]
wordpressId: 2665
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
If you look up the UNAME system variable in _debug_ within a RFC call you may think it kind of odd to find a username that is not your own. What happens is that the system adopts a specific username for remote calls and a new session is started. A new session implies a new execution context and, hence, all our strategically placed _breakpoints_ will no longer be recognised.

This problem can hinder a simple _debug_ forcing us to run through the code looking for THAT remote call to THAT particular system.

SAP has a solution.

<!--more-->

To avoid such situations SAP provides, since Netweaver Release 7.02, the _debug_ by _Terminal ID_ function. _Terminal ID_ identifies the Microsoft Windows user who started the session and it is stored in the Windows registry under the _HKEY_CURRENT_USER\Software\SAP\ABAP Debugging_ key.

This unique identifier ensures the debugger doesn't get confused with the session changes and responds to all external _breakpoints_ (subscribed at a particular _Terminal ID_ ) with the serenity we are accustomed to.

The steps to start a debugging session per terminal ID are as follows:

  1. _Login_ on the system we want to _debug_ ;

  2. Open the object to be tested in the ABAP Editor (SE38, SE80, SE37, SE24) and input the required external _breakpoints_ ;

  3. Open the debugging menu and choose the debug by _terminal ID_ option:
_Tools>Settings>ABAP Editor>Debugging_
Note: A new ID will be generated and stored in the Windows Registry if one doesn't already exist;

  4. On accepting, the system will ask if the already existing _breakpoints_ should remain active. The answer to this is "yes". At this point we now have external breakpoints associated with a terminal ID;

  5. In the source system we can now run the program that calls our RFC in _debug_ , but instead of using the **/h** command we use the **/htid** command telling the _debug_ that it must stop at all _breakpoints_ associated with my _terminal ID_.

This is a very useful feature that can also be applied in HTTP calls. But this scenario requires the installation of a _plug-in_ in the browser that allows the propagation of the terminal ID to the lower layers.

Note: In this scenario we assume that the user running the program is the same one that has added the breakpoints in the RFC to be tested, and the terminal ID will therefore be the same. There may, however, be two distinct users and for these cases we can use the following commands to enable/disable the terminal ID-based debugging:

/hset tid=<tid>
| <tid> = of the user who inserted the breakpoints

---|---

/hget tid
| Display the assigned terminal ID

/hdel tid
| Remove assignment to a terminal ID

Abapinho thanks Miguel Jorge for writing this article.

Thanks to Howard Dickins for the [photo][1].

   [1]: https://www.flickr.com/photos/dorkomatic/6182110293/in/photostream/
