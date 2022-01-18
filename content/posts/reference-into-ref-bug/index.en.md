---
title: 'INSERT wa INTO itbl REFERENCE INTO ref. Bug?'
slug: reference-into-ref-bug
date: 2016-10-03 09:00:43
tags: [estilo]
categories: [artigos]
wordpressId: 3627
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['reference into']
description: 'Recentemente descobri um comportamento muito lamentável do seguinte comando: INSERT wa INTO itbl REFERENCE INTO ref. Passo a explicar.'
---
Every day I use more reference variables in ABAP. First I used REF TO just for classes but, as I become more familiarized with its advantages, I start using them more and more for data structures, instead of field-symbols.

But I recently found na unfortunate behavior of the following command:


{{< highlight ABAP >}}
INSERT wa INTO itbl REFERENCE INTO ref.
{{< /highlight >}}

Let me give you some context before I complain about it.

<!--more-->

Let’s say you have the method GET_REF_TO_T001 which returns a REF TO T001:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001
  IMPORTING
    I_BUKRS TYPE BUKRS
  RETURNING
    RO_T001 TYPE REF TO T001.
{{< /highlight >}}

Consider the following implementation:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.
  SELECT * INTO S_T001 WHERE BUKRS = I_BUKRS.
  GET REFERENCE FROM S_T001 INTO RO_T001.
ENDMETHOD
{{< /highlight >}}

You expect the method to return a reference to a T001 structure filled with the record with key I_BUKR. But that’s not what happens. Instead, the debugger shows you that the RO_T001 content is something like #FREEDXXX. And that makes perfect sense. Why? Because the reference the method returned was pointing at local variable S_T001 which ceased to exist the moment we exited the method.

Now look at this alternate implementation where all T001 data is cached in internal table GT_001 which is an instance attribute of the class:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  IF GT_T001[] IS INITIAL.
    SELECT * INTO TABLE GT_T001 FROM T001.
  ENDIF.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
ENDMETHOD
{{< /highlight >}}

This one will work fine. Why? Because table GT_001, being an instance attribute, will continue to exist in memory for as long as the class instance exists.

Get it?

Let’s now go back to the problem I was complaining about. Picture a third implementation that, instead of caching the full table, will do an incremental cache of only the requested records:


{{< highlight ABAP >}}
METHOD GET_REF_TO_T001.
  DATA: S_T001 TYPE T001.

  READ TABLE GT_T001 REFERENCE INTO RO_T001 WITH KEY BUKRS = I_BUKRS.
  IF SY-SUBRC <> 0.
    SELECT SINGLE * FROM T001 INTO S_T001 WHERE BUKRS = I_BUKRS.
    INSERT S_T001 INTO GT_T001 REFERENCE INTO RO_T001.
  ENDIF.
ENDMETHOD.
{{< /highlight >}}

First, we try to get the record from the cache. If it’s still not there we select it into structure S_T001 which we then add to the cache. Since the INSERT command allows you to immediately get a reference to the data, it seems logical that we should use that feature to get a reference to the data we just inserted.

But it doesn’t work as expected.

Why? Because instead of returning a reference to the inserted line, ABAP returns a reference to the local structure S_T001 which, as we have already seen will be freed as soon as we exit the method.

We are thus forced to perform an extra READ TABLE in order to get the reference to the data we have just inserted in the table.

It just doesn’t seem logical to me. What’s the use of having the INSERT command return a reference to the structure? I don’t know. Until someone gives me a good reason for this I’ll keep calling it a bug.

I hope the explanation of my complaint was useful to help you understand how you can use REF TO for other stuff besides classes.

Greetings from Abapinho.
