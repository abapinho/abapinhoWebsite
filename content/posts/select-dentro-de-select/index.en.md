---
title: 'SELECT within SELECT'
slug: select-dentro-de-select
date: 2014-05-26 09:00:03
tags: [estilo, performance, sql]
categories: [dicas]
wordpressId: 2677
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
ABAP programmers don't explore the possibilities of SQL, probably for historical reasons. There are many who instead of using INNER JOINs still think it's faster to do several SELECTs for internal tables and then process the data in ABAP. But the truth is that even if there are exceptions, the rule is: the lower the number of accesses to the database, the better the performance. And it makes sense because, after all, they were written explicitly for this; relational databases are much more adept at processing relational data than an ABAP program.

There are of course things that, due to their complexity, cannot be done with a simple INNER JOIN. Nevertheless, some of these things can be done in a single SELECT.

<!--more-->

Check out the standard example in SE38, at _DEMO_SELECT_SUBQUERY_. Try running it. Did you like it? I bet that you don't understand much from just the result. So go to the code. It's really short. There you'll find the following SQL command:


{{< highlight ABAP >}}
  SELECT  planetype seatsmax
    INTO  (plane, seats)
    FROM  saplane AS plane
    WHERE seatsmax < wa-seatsmax AND
          seatsmax >= ALL ( select  seatsocc
                              FROM  sflight
                              WHERE carrid = wa-carrid AND
                                    connid = wa-connid     )
    ORDER BY seatsmax.

    WRITE: / plane, seats.

  ENDSELECT.
{{< /highlight >}}

Here a SELECT is made within a SELECT. The inside SELECT finds the flights of a specific airline. The outside SELECT finds the planes with capacity to do the flight based on the seats booked on those flights. ALL() is just one of the many SQL functions that can be used in this type of linked SELECTs.

If you have read this tip up to here then you should know that I think it will only be useful to you if:

  * you have understood why you could not do this with an INNER JOIN

  * you have understood how this linked SELECT works

  * you have found out under what circumstances and how you can use linked SELECTs in your programs

Note: this example is found in the SABAPDEMOS package that has hundreds of interesting examples on a very wide range of topics. It is well worth exploring this package.

Thanks to Todd Anderson for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/toddography/2039964038/
