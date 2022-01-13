---
title: 'if you love your neighbour, avoid CLEAR'
slug: evita-o-clear
date: 2021-12-13 09:00:59
tags: [estilo]
categories: [artigos]
wordpressId: 4771
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Please stop. Too many regressions happen because someone forgets to CLEAR or to not CLEAR a variable.

<!--more-->

I've seen the CLEAR statement being used in the following scenarios:

  1. Before assigning a value to a variable;

  2. Before, during or after a LOOP, DO and other looping statements, to reset any auxiliary variable;

  3. At the beginning of a routine to initialise its parameters;

  4. When a big internal table is no longer needed, to free up memory;

  5. Because we WANT to CLEAR a variable.

Let's look at each of the scenarios:

1\. Before assigning a value to a variable

Believe it or not, I've seen this being done:

{{< highlight ABAP >}}
DATA sum TYPE i.
CLEAR sum.
sum = a + b.
{{< /highlight >}}

It's redundant. It's useless. It's silly.

Or this:

{{< highlight ABAP >}}
LOOP AT itbl INTO wa.
  calc = wa-a + wa-b.
  (...)
  CLEAR calc.
ENDLOOP.
{{< /highlight >}}

Which may not seem as silly as the first exame... but it really is.

Conclusion: it's always useless. Stop doing this.

2\. Before, during or after a LOOP

This is useless, of course:

{{< highlight ABAP >}}
LOOP AT itbl INTO wa.
  (...)
  CLEAR wa.
ENDLOOP.
{{< /highlight >}}

Just get rid of that CLEAR.

This is not useless:

{{< highlight ABAP >}}
METHOD report_itbl_a.
  DATA sum TYPE i.
  LOOP AT itbl_a INTO wa.
    CLEAR sum.
    LOOP AT itbl_b INTO wb WHERE a = wa-a.
      sum = sum + wb-value.
    ENDLOOP.
    WRITE: / wa-a, sum.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

And yet, it can be avoided by using the [function extraction][1] refactoring technique to encapsulate part of the outer loop content:

{{< highlight ABAP >}}
METHOD report_itbl_a.
  LOOP AT itbl_a INTO wa.
    sum = sum_itbl_b( wa-a ).
    WRITE: / wa-a, sum.
  ENDLOOP:
ENDMETHOD.

METHOD sum_itbl_b.
  LOOP AT itbl_b INTO wb WHERE a = a.
    result = result + wb-value.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

The CLEAR is no longer needed because the auxiliary variable SUM is now local to the SUM_ITBL_B method. Its scope was reduced.

And this can be made more modern by using the REDUCE comprehension:

{{< highlight ABAP >}}
METHOD report_itbl_a.
  LOOP AT itbl_a INTO wa.
    sum = sum_itbl_b( wa-a ).
    WRITE: / wa-a, sum.
   ENDLOOP:
ENDMETHOD.

METHOD sum_itbl_b.
  result = REDUCE #(
    INIT sum = 0
    FOR wa in itbl_b WHERE ( a = a )
    NEXT sum = sum + wa-value ).
ENDMETHOD.
{{< /highlight >}}

Most CLEAR statements can be avoided if the scope of the auxiliary variables is kept as small as possible.

3\. To initialise routine parameters

Let's get it out of the way:

  * IMPORTING: You cannot and should not clear these;

  * CHANGING: If the business logic requires it, you may need to CLEAR them;

  * RETURNING: This is always passed by value so it will always be initial;

  * EXPORTING: Since these are usually passed by reference, it is a good practice to CLEAR the exporting parameters right at the start of the routine. But Clean ABAP suggests a better approach: [pass them by value][2].

Conclusion: The only scenario in which CLEAR may be needed is if one needs to initialise a CHANGING parameter.

4\. When a big internal table is no longer needed

If memory is an issue, it is definitely a good idea to free up memory as soon as possible. But in this case CLEAR is not the best option because it will not release the memory immediately. You should be using the FREE statement instead.

5\. Because we WANT to CLEAR a variable

Ok. This is the only scenario in which using CLEAR makes total sense.

The conclusion is: avoid using CLEAR as much as possible. They are one of the biggest reasons regressions happen. Especially in code where routines have thousands of lines and dozens of global variables. Interestingly, I had to use a CLEAR statement just a few days after having written this article. I noticed it because I use it so sparingly. I used to CLEAR all EXPORTING parameters but not anymore, since now I know that I can pass them by value.

Greetings from Abapinho.

   [1]: https://refactoring.com/catalog/extractFunction.html
   [2]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#dont-clear-value-parameters
