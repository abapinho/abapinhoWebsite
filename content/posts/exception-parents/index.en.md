---
slug: exception-parents
title: The 3 exception parents
description: There are 3 possible parents for exceptions
date: 2023-02-20T09:00:00Z
tags: []
categories: [artigos]
keywords: [cx_static_check]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
OO exceptions always need a parent. They always have to inherit from somebody. And ABAP gives them 3 alternatives.

<!--more-->

At the top of the tops lays `CX_ROOT`. You're not supposed to inherit directly from it. Inherit instead from one of her 3 daughters:

- `CX_STATIC_CHECK`.
- `CX_NO_CHECK`
- `CX_DYNAMIC_CHECK`

![3 parents UML Class diagram][1]

## CX_STATIC_CHECK

Use it on all exceptions that are reasonable to happen and can be handled by the receiver. It has to be either caught by the method or declared in its interface. When in doubt, inherit from this one.

```abap
CLASS zcx_dev1_file_not_found DEFINITION INHERITING FROM cx_static_check.

METHODS read_file
  IMPORTING
    file_name_entered_by_user TYPE string
  RAISING
    zcx_dev1_file_not_found.
```

## CX_NO_CHECK

This is only used in unforeseen and unrecoverable cases. These cannot be declared in method interfaces. It is thrown by some standard classes and by ABAP itself but I never found a scenario that needed it a Z program.

```abap
CLASS cx_out_of_memory DEFINITION INHERITING FROM cx_no_check.

METHODS create_guid
  RETURNING
    VALUE(result) TYPE /bobf/conf_key.
```

## CX_DYNAMIC_CHECK

Can propagate to the caller without being declared in the method interface. It is interesting for scenarios in which the method caller is fully aware of the possibility of it happening and has the power to prevent it. This kind of exception is very common in Java frameworks. But I've never found scenarios that benefited from using it instead of `CX_STATIC_CHECK`. Regardless it's a good thing it exists so that you don't have to declare all the exceptions thrown by the standard. The classic example is division by zero:

```abap
" Notice how the exception is not declared in the interface
METHODS divide
  IMPORTING
    a TYPE f
    b TYPE f.

METHOD divide.
  result = a / b.
ENDMETHOD.

METHOD client.
  TRY.
      divide(
        EXPORTING
          a = a
          b = b ).
    CATCH cx_sy_zerodivide.
      WRITE / 'Infinity unlocked!'.
  ENDTRY.
ENDMETHOD.
```

## Conclusion

It's important to know and understand the 3 of them. But in practice, unless you have a good reason not to, always use `CX_STATIC_CHECK`, which is what `SE24` proposes by default.

Photo credit: [ilhu industries][2].

Greetings from Abapinho.

[1]: images/uml-3-parents.png
[2]: <https://visualhunt.co/a7/1e878ec4>
