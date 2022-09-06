---
slug: prefixes
title: I finally got rid of prefixes
description: prefixes
date: 2022-09-12T09:09:00+01:00
tags: [style]
categories: [articles]
keywords: [prefixes]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
It took me a long time but I finally got rid of the damn prefixes.

<!--more-->

For 20 years I wrote variables like this:

```text
GT_T001 = global internal table of T001
LS_T001 = local structure of T001
IV_BUKRS = input parameter with company
RV_MATNR = return parameter with material code
GO_CONSTS = reference to object instance of constants class
```

Then I stopped using `L` for _local_ and `V` for _value_. Variables without `L` are implicitly _local_ and variables without `V` are implicitly _value_:

```text
GT_T001
S_T001
I_BUKRS
R_MATNR
GO_CONSTS
```

A few years ago I took a step forward, decided to follow [Clean ABAP's advice][1] and ditched all the prefixes. This was only possible because my classes and methods are now so small and most variables have such intuitive names that I don't need the prefixes to understand what they do:

```text
T001_LIST
T001
COMPANY
R_MATERIAL
CONSTANTS
```

Finally about a year ago I decided to follow [Clean ABAP's advice][2] to name all return parameters as `RESULT`. It's now much clearer which variable needs to be filled with the result. And, as the name of the method describes its purpose, it's always clear what each `RESULT` represents:

```text
T001_LIST
T001
COMPANY
RESULT
CONSTANTS
```

So, like those ads for weight loss products, here's the before and after:

```text
GT_T001 => T001_LIST
LS_T001 => T001
IV_BUKRS => COMPANY
RV_MATNR => RESULT
GO_CONSTS => CONSTANTS
```

What about you? Do you still use prefixes? If you do, think about this for a moment: when you code in Python or C++ you don't use any prefixes. Why? Because ABAP is probably the only programming language in which so many prefixes are used as a norm. But [it doesn't have to be this way][3].

Thank you Frank Kehren for the [photo][4].

Greetings from Abapinho.

  [1]: <https://github.com/SAP/styleguides/blob/master/clean-abap/CleanABAP.md#avoid-encodings-esp-hungarian-notation-and-prefixes>
  [2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#consider-calling-the-returning-parameter-result>
  [3]: <https://www.youtube.com/watch?v=y_ra8X_8waA>
  [4]: <https://visualhunt.com/re10/230d9bf8>
