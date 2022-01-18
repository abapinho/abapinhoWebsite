---
title: 'How to not screw up when returning a REF TO DATA'
slug: devolver-ref-to-data
date: 2017-01-02 09:00:26
tags: [estilo]
categories: [artigos]
wordpressId: 3689
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['ref to data']
description: 'Aprende aqui como usar o REF TO DATA para passar referências de dados entre métodos. E aprender também como fazer asneira a tentá-lo.'
---
I've been using more and more references in ABAP.

I used to use REF TO only for classes but I've been finding more and more advantages in using them for other data types. But, just like in C++, care must be used when dealing with data references. Things can easily go very wrong.

In this article, I'll try to show you how to use and how not to use REF TO DATA. Let's start by an example of how not to do it.

<!--more-->

You have a method called GET_REF_TO_T001 which returns a REF TO T001:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001
  IMPORTING
    I_BUKRS TYPE BUKRS
  RETURNING
    RO_T001 TYPE REF TO T001.
{{< /highlight >}}

Let's assume the following implementation:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.
  SELECT * INTO S_T001 WHERE BUKRS = I_BUKRS.
  GET REFERENCE FROM S_T001 INTO RO_T001.
ENDMETHOD
{{< /highlight >}}

The method should return a reference to the T001 structure filled with the record requested in parameter I_BUKRS. But that's not what happens. By using the debugger you'll find that, instead, you'll get something like #FREEDXXX. And as weird as it may seem, it makes perfect sense. Why? Because the reference you returned was pointing to the method's local variable S_T001 which stopped existing the moment you went out of it.

Now look at this other implementation in which all T001 data is cached in a persistent internal table GT_T001 which is a private instance attribute of the class:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  IF GT_T001[] IS INITIAL.
    SELECT * INTO TABLE GT_T001
      FROM T001.
  ENDIF.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
ENDMETHOD
{{< /highlight >}}

This one works. Why? Because table GT_T001, being an attribute of the class, will exist for as long as the class instance exists.

Get it?

Now I'll show you an annoying and strange limitation of the REFERENCE TO command. Imagine this third implementation in which, instead of caching the whole table, you'll just cache the records already requested:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  IF SY-SUBRC <> 0.
    SELECT SINGLE * FROM T001 INTO S_T001 WHERE BUKRS = I_BUKRS.
    INSERT S_T001 INTO TABLE GT_T001 REFERENCE INTO RO_T001.
  ENDIF.
ENDMETHOD.
{{< /highlight >}}

First we try to get the line from the cache. If we don't find it there, we select it from the database into a structure and insert that table into the cache table, at the same time getting its reference. We do this because the INSERT command allows us to get a reference of what is being inserted.

But... it doesn't work.

why? Because ABAP, sadly, for some strange reason, instead of getting a reference to the inserted line, gets the reference of the original structure being inserted: the local variable S_T001.

Why would you need the INSERT command to return a reference to the structure you already have? This sounds almost like a bug to me. My guess is that whoever wrote this feature could have done a better job.

The workaround solution is... to make an extra READ:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  IF SY-SUBRC <> 0.
    SELECT SINGLE * FROM T001 INTO S_T001 WHERE BUKRS = I_BUKRS.
    INSERT S_T001 INTO TABLE GT_T001.
    READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  ENDIF.
ENDMETHOD.
{{< /highlight >}}

Presto. Now it works.

I hope all these examples help you understand how to properly send REF TO stuff across methods.

Photo credit: [haroldmeerveld][1] via [Visualhunt][2] / [CC BY-NC][3]

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/haroldmeerveld/15173387023/
   [2]: https://visualhunt.com
   [3]: http://creativecommons.org/licenses/by-nc/2.0/
