---
title: 'Be lazy when you write in ABAPese'
slug: modelos-de-codigo
date: 2011-12-26 00:11:42
tags: [sapgui]
categories: [dicas]
wordpressId: 1262
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
To find out which professions attract the laziest people, I googled the following:

Profession| Results
---|---

"médico preguiçoso (lazy doctor)"| 2,140,000

"advogado preguiçoso (lazy lawyer)"| 1,430,000

"gestor preguiçoso (lazy business administrator)"| 1,020,000

_"engenheiro preguiçoso (lazy engineer)"_|  _647,000_

"político preguiçoso (lazy politician)"| 602,000

"economista preguiçoso (lazy economist)"| 284,000

"pedreiro preguiçoso (lazy builder)"| 91,200

As this conclusively proves, engineers are not lazy enough as they are beaten by lawyers and doctors. This must change. And this tip will help. But not without making the following difference clear: lazy is not work-shy. I am talking here about noble laziness, the behaviour of those who like doing things but with the least possible effort. Lazy slobs are not included here.

SAP is something that evolves slowly, and it launched a new editor a few years ago that is full of [capabilities][1] many of which, while handy, are barely used. One of them is called ‘Code templates’ which I will now demonstrate:

<!--more-->

  1. Go to SE38, SE24, SE37 or any other transaction that offers the ABAP editor;
  2. In the bottom right-hand corner there is an icon looking like a _clipboard_. Click on it;
  3. The editor options appear;
  4. From the options on the left, select ‘Code templates’;
  5. There you will see various pre-defined templates (e.g. TRY) and you can set up more of your own.

Here is the code templates definition:
![][2]

As you write code, just write the name of one of the models anywhere and hit TAB to replace that name with its model.

Tip within a tip: ideal for "nuno was here!" type lines - de rigueur whenever splicing into someone else’s code.

Let’s be lazy!

Greetings from Abapinho.

   [1]: https://wiki.sdn.sap.com/wiki/display/ABAP/New+ABAP+Editor
   [2]: images/modelo_codigo_abap.png (modelo_codigo_abap)
