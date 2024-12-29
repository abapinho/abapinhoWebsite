---
slug: linhas-em-branco
title: How do you like your blank lines?
description: How do you like your blank lines?
date: 2024-12-30T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: [linhas em branco]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Everyone uses blank lines to better organize their code. But where to use them and how many? Let's talk about that.

<!--more-->

Clean ABAP talks about it. It says to [never use more than one empty line in a row][1] which is great advice. And it also says [don't be obsessive][2] about spreading blank lines. For example, they say this is a bad idea:

```abap
“ anti-pattern
METHOD do_something.

  do_this( ).

  then_that( ).

ENDMETHOD.
```

Why overdo it with blank lines? Relax. Look how much easier it is to read:

```abap
METHOD do_something.
  do_this( ).
  then_that( ).
ENDMETHOD.
```

When I used to make longer methods, blank lines were essential to create a visual separation between different parts of the algorithm, and sometimes it even made sense to use more than one line to distinguish different areas. Of course I still use them. But now that we know that methods should be as small as possible, I use them much less than I used to.

For example, many people like to put a blank line below `METHOD` and leave another blank line above `ENDMETHOD`. For those who use Eclipse ADT like me, this ends up being confusing because, as the methods appear one after the other, when they are more compact (like the example above) they are more visually separated from each other.

Clean ABAP also says something very sensible: the need to use blank lines can be a symptom that your method is doing too many things, when it should be doing [just one][3].

For example, in a method with two multi-line operations, it is sometimes easier to tell them apart with a blank line in between:

```abap
METHOD process_customers_and_suppliers.
  SELECT kunnr, name1
    FROM kna1
    INTO TABLE @DATA(customers).

  SELECT lifnr, name1
    FROM lfa1
    INTO TABLE @DATA(suppliers).

  “ Etc
ENDMETHOD.
```

But this method is not healthy because it is doing two independent things and should be separated into two:

```abap
METHOD get_customers_and_suppliers.
  DATA(customers) = get_customers( ).
  DATA(suppliers) = get_suppliers( ).
  “ Etc

METHOD get_customers.
  SELECT kunnr, name1
    FROM kna1
    INTO TABLE @result.
ENDMETHOD.

METHOD get_suppliers.
  SELECT lifnr, name1
    FROM lfa1
    INTO TABLE @result.
ENDMETHOD.
```

And once that's done, the blank lines are no longer necessary, right?

Greetings from Abapinho.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#add-a-single-blank-line-to-separate-things-but-not-more>
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#dont-obsess-with-separating-blank-lines>
[3]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#do-one-thing-do-it-well-do-it-only>
