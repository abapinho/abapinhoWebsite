---
slug: split-loop
title: Do just one task per LOOP
description: split-loop
date: 2022-03-14T09:00:00Z
tags: [estilo]
categories: [artigo]
keywords: [split loop]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
draft: true
---
When ABAP programmers run into a LOOP they like to use it to get as many things done as possible. Even if that LOOP ends up having hundreds or thousands of lines.
<!--more-->

This happens because there is this idea that multiple _loops_ will take longer to run. But the truth is that, in 99.9% of the times, it doesn't really many a difference.

This goes against a very important programming best practice: do one thing at a time.

Because the resulting code will be easier to undertand, easier to refactor and easier to maintain.

And that is why, in his great book "Refactoring", Martin Fowler teaches us the [split loop][1] refactoring technique, which consists in converting a _loop_ that does multiple things into multiple _loops_ that do one thing each.

Take this messy loop (very typical in so many SAP systems):

```ABAP
METHOD main.
  DATA total_aeiou_sales TYPE wrbtr.
  DATA total_sales TYPE wrbtr.
  DATA customer_count TYPE i.

  LOOP AT customers REFERENCE INTO DATA(customer).
    IF customer->land1 NOT IN countries_of_eu.
      CONTINUE.
    ENDIF.

    total_sales = total_sales + customer->annual_sales.

    IF customer->name1(1) CO 'AEIOU'.
      total_aeiou_sales = total_aeiou_sales + customer->annual_sales.
    ENDIF.

    customer_count = eu_customer_count + 1.
  ENDLOOP.

  WRITE: \ |Total sales: { total_sales }|.
  WRITE: \ |Total AEIOU sales: { total_aeiou_sales }|.
  WRITE: \ |Number of customers: { customer_count }|.
ENDMETHOD.
```

This `LOOP` does 4 things at the same time:

- Skips customers which are not part of the EU;
- Calculates the total annual sales for EU customers;
- Calculates the total amount sales for EU customers with names starting with a vowel;
- Counts the number of EU customers.

Let's go ahead and split this loop:

```ABAP
METHOD main.
  " 1. First we get a new list with only the relevant customers
  " which we will then use in the next steps.
  DATA(eu_customers) = VALUE #(
    FOR customer IN customers
    WHERE ( customer-land1 IN countries_of_eu )).

  " 2. Total annual sales for EU customers
  DATA(total_sales) = REDUCE wrbtr(
    INIT total = 0
    FOR customer1 IN eu_customers
    NEXT total = total + customer1-annual_sales ).

  " 3. Total annual sales for EU customers with names starting with a vowel
  DATA(total_aeiou_sales) = REDUCE wrbtr(
    INIT total1 = 0
    FOR customer2 IN eu_customers
    WHERE ( customer2-name1 co 'AEIOU' )
    NEXT total = total + customer2-annual_sales ).

  WRITE: \ |Total sales: { total_sales }|.
  WRITE: \ |Total AEIOU sales: { total_aeiou_sales }|.
  WRITE: \ |Number of customers: { LINES( eu_customer ) }|.
ENDMETHOD.
```

The 4 things are now clearly separated (and did you see how the customer count became immediately simpler?). The code is clearer and besides, since the tasks are now independent, it is now easy to refactor it, encapsulating each task in its own method:

```ABAP
METHOD main.
  DATA(eu_customers) = get_eu_customers( customers ).
  WRITE: \ |Total sales: { get_total_sales( eu_customers ) }|.
  WRITE: \ |Total AEIOU sales: { get_total_aeiou_sales( eu_customers ) }|.
  WRITE: \ |Number of customers: { LINES( eu_customer ) }|.
ENDMETHOD.

METHOD get_eu_customers.
  result = VALUE #(
    FOR customer IN customers
    WHERE ( customer-land1 IN countries_of_eu )).
ENDMETHOD.

METHOD get_total_sales.
  result = REDUCE wrbtr(
    INIT total = 0
    FOR customer1 IN eu_customers
    NEXT total = total + customer1-annual_sales ).
ENDMETHOD.

METHOD get_total_aeiou_sales.
  result = REDUCE wrbtr(
    INIT total = 0
    FOR customer IN eu_customers
    WHERE ( customer-name1 co 'AEIOU' )
    NEXT total = total + customer-annual_sales ).
ENDMETHOD.
```

We now have a `main()` method with high level code, making it very easy to understand what is happending there. And then the lower level business logic is encapsulated in 3 auxiliary methods. We don't even need comments anymore.

Look again at the first `LOOP`. Which of the versions do you prefer? I though so.

Greetings from Abapinho.

[1]: https://refactoring.com/catalog/splitLoop.html
