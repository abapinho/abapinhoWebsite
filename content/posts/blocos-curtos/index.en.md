---
slug: blocos-curtos
title: Keep code blocks short
description: All ABAP code blocks should be short. Very very short.
date: 2022-02-07T09:00:00Z
tags: [estilo]
categories: [artigo]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Unfortunately that is not what happens in most of the Z code I have seen in my life as an ABAP programmer. Both IFs and LOOPs tend to grow bigger than anyone can deal with. I recently ran into a LOOP with over 1500 lines.

<!--more-->

The only advantage of having gigantic code blocks is to hear other people. But that is only an advantage when people deserve to be hurt.

Why is it that so many ABAP programmers are trying to hurt other people?

## Fail fast

Very often, the simplest way to avoid big blocks is to [fail fast][1].

Instead of doing this:

```ABAP
IF c1.
  " 5000
  " lines
  " of
  " code
ENDIF.
```

it's much better to do this:

```ABAP
IF NOT c1.
  RETURN.
ENDIF.

" 5000
" lines
" of
" code
```

It hurts others less.

## Keep your code shallow

Another great advantagem o failing fast is to [keep your code shallow][2] like Clean ABAP advises.

Instead of doing this:

```ABAP
IF c1.
  IF c2.
    IF c3.
      " A
      " big
      " lot
      " of
      " lines
      " of
      " code
    ENDIF.
  ENDIF.
ENDIF.
```

it's much better to do this:

```ABAP
IF NOT c1.
  RETURN.
ENDIF.

IF NOT c2.
   RETURN.
ENDIF.

IF NOT c3.
    RETURN.
ENDIF.

" A
" big
" lot
" of
" lines
" of
" code
```

So much easier to understand, right?

And yet I sometimes see code with more than 10 levels of depth! Why hurt others?

## Modularize

But the best strategy to keep block codes short is modularization.

Instead of doing this:

```ABAP
IF c1.
  " 5000
  " lines
  " of
  " code
ELSE.
  " 5000
  " more
  " lines
  " of
  " code
  " sometimes
  " so
  " very
  " similar
  " to
  " the
  " other
  " 5000
ENDIF.
```

it's much better to do this:

```ABAP
IF c1.
  do_this( ).
ELSE.
  do_that( ).
ENDIF.
```

Or, if the methods are functions returning a value:

```ABAP
DATA(result) = COND #( WHEN c1 THEN get_this( ) ELSE get_that( ) ).
```

And then you send those thousands of lines into those routines. And if you do the same to those routines you'll end up with many small routines instead of a few big ones.

Let's stop hurting each other.

Greetings from Abapinho

[1]: https://en.wikipedia.org/wiki/Fail-fast
[2]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#keep-the-nesting-depth-low
