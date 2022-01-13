---
title: 'SELECT WHERE field IN (*, x)'
slug: select-where-field-in-a-b
date: 2021-07-19 09:00:53
tags: [estilo]
categories: [artigos]
wordpressId: 4701
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Ok let's go slowly on this one.

Picture a scenario in which you have a customizing table with several levels of detail which may or may not be defined:

  1. BUKRS (empresa)

  2. WERKS (plant)

  3. LGORT (depósito)

When one of the fields is empty, we treat it as a wildcard, meaning all values are valid.

<!--more-->

Here's the current configuration of the table:

BUKRS
| WERKS
| LGORT
| VALUE

---|---|---|---

|
|
| Z1

E1
| W1
|
| Z2

E1
| W1
| L1
| Z4

E1
| W2
|
| Z3

So the first line defines the default value and the remaining ones define more specific scenarios.

I already saw code which takes into consideration all possible combinations, which is the dumbest thing ever. In this case you already need 8 SELECTs to cover all combinations. If at some point someone decides to add a forth key field, that someone will have to add 8 more SELECTs to the code. That's 16 SELECTs! What a mess.

The most common way to do it - which in also kinda shitty - is to assume that the key fields are always defined from left to right (from more generic to more specific). This reduces the needed logic to one SELECT per key field. Something along these lines:


{{< highlight ABAP >}}
SELECT value INTO result
FROM zparams
WHERE BUKRS = i_bukrs
  AND WERKS = i_werks
  AND LGORT = i_lgort.

IF sy-subrc <> 0.
  SELECT value INTO result
  FROM zparams
  WHERE BUKRS = i_bukrs
    AND WERKS = i_werks.

  IF sy-subrc <> 0.
    SELECT value INTO result
    FROM zparams
    WHERE BUKRS = i_bukrs.
  ENDIF.

ENDIF.
{{< /highlight >}}

3 SELECTs and 2 IFs. It's a lot.

I really believe we should only use one SELECT here. In order to accomplish this, I usually define one RANGE per key field, use then in a SELECT sorted in a way that the more specific lines comes first and then just pick the first line:


{{< highlight ABAP >}}
DATA r_bukrs TYPE RANGE OF bukrs.
DATA r_werks TYPE RANGE OF werks_d.
DATA r_lgort TYPE RANGE OF lgort_d.

IF i_bukrs IS NOT INITIAL.
  r_burks = VALUE #( option = 'EQ' sign = 'I' ( low = i_bukrs ) ).
ENDIF.
IF i_werks IS NOT INITIAL.
  r_werks = VALUE #( option = 'EQ' sign = 'I' ( low = i_werks ) ).
ENDIF.
IF i_lgort IS NOT INITIAL.
  r_lgort = VALUE #( option = 'EQ' sign = 'I' ( low = i_lgort ) ).
ENDIF.

SELECT value INTO result
UP TO 1 ROWS
FROM zparams
WHERE BUKRS IN r_bukrs
  AND WERKS IN r_werks
  AND LGORT IN r_lgort
ORDER BY bukrs DESCENDING werks DESCENDING lgort DESCENDING.
ENDSELECT.
{{< /highlight >}}

It's a lot of code and it uses 3 auxiliary variables but at least the logic is straightforward and so very easy to maintain: one SELECT and no IFs.

But I recently realised that this could be greatly simplified:


{{< highlight ABAP >}}
SELECT value INTO result
UP TO 1 ROWS
FROM zparams
WHERE BUKRS IN (space, i_bukrs) 
  AND WERKS IN (space, i_werks)
  AND LGORT IN (space, i_lgort)
ORDER BY bukrs DESCENDING werks DESCENDING lgort DESCENDING.
ENDSELECT.
{{< /highlight >}}

Ole!! One SELECT, zero IFs, zero auxiliary variables.

Thank you [hello-julie][1] for the photo.

Greetings from Abapinho.

   [1]: https://visualhunt.co/a6/9d50a0f7
