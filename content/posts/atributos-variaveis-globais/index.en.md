---
slug: atributos-variaveis-globais
title: Attributes that are global variables in disguise
description: Most class attributes are just global variables disguised
date: 2025-02-02T20:22:25Z
tags: []
categories: []
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
There’s nothing worse than seeing code that abuses variables. They’re so delicate, and yet they’re treated so badly—poor things. Well, here’s a way to show them some love. And to those who have to read them. The worst way to treat a variable is to make it global. It’s hard to believe, but in 2025 this crime continues to plague our systems.

<!--more-->

Of course, nowadays, as almost everyone uses classes, these global variables are disguised as class attributes. But the harsh reality is that almost all the class attributes found in SAP systems around the world today are, in fact, global variables.

Why? Because they are auxiliary variables and not really attributes that define the object the class represents, nor components that complement it.

If you have a class called, say, `cl_customer`, it makes sense for it to have a `customer_number` attribute of type `KUNNR`. OK, that is genuinely part of the `customer`’s identity, so it makes perfect sense for it to be there.

The problem arises when people start adding attributes that are actually auxiliary variables. And how do you spot this straight away? When these start being used in various methods without being passed as parameters. Global variables are basically a lazy way of communicating between different methods without having to pass them as parameters. Example:

```abap
METHOD load_data.
  SELECT SINGLE name1 FROM kna1
    WHERE kunnr = @me->customer_number
    INTO @customer_name.
ENDMETHOD.

METHOD write_name.
  WRITE customer_name.
ENDMETHOD.
```

See what I mean? This is playing with fire because if someone unfamiliar with the code happens to call the `write_name` method first without calling `load_data`, you’re in a right mess.

The correct way is always:


```abap
METHOD write_name.
  FINAL(customer_name) = get_name( ).
  WRITE customer_name.
ENDMETHOD.
```


Of course, you’re probably already jumping up and shouting: ‘Ah, but what about performance? Now every time you call `write_name`, it’ll perform a `SELECT`. That’s true. But if that worries you, you can implement a cache. And in that case, it does make sense to use a private class attribute, provided you give it a name that makes it clear it’s a cache:


```abap
PRIVATE SECTION.
  DATA cached_customer_name TYPE name1.

METHOD get_name.
  IF cached_customer_name IS INITIAL.
    SELECT SINGLE name1 FROM kna1
      WHERE kunnr = @me->customer_number
      INTO @cached_customer_name.
  ENDIF.
  RETURN cached_customer_name.
ENDMETHOD.
```

This way, you only perform the `SELECT` on the first call and you don’t run the risk of making a mistake because `write_name` doesn’t depend on other methods.

Therefore: always try to keep your variables local and think very carefully before deciding to declare an attribute in a class: is it part of the class’s identity? Is it a component of its composition? Is it a cache? If so, fine, declare it and use it accordingly.

Greetings from Abapinho
