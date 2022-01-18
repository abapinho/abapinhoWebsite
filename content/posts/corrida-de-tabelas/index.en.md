---
title: 'On your marks, get set, go!'
slug: corrida-de-tabelas
date: 2011-05-24 09:00:41
tags: [performance]
categories: [artigos]
wordpressId: 759
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Ladies and gentlemen, boys and girls, the race is about to begin.

**Introduction**

The four competitors are as follows. They are 4 internal tables, of different races and creeds, which will fight for the athletics title of speed LOOP. Here they are:

Competitor 1: DATA: LT_ITEM TYPE TABLE
Competitor 2: DATA: LT_ITEM_HASHED TYPE HASHED TABLE
Competitor 3: DATA: LT_ITEM_SORTED TYPE SORTED TABLE
Competitor 4: DATA: LT_ITEM TYPE TABLE + INTO INDEX

<!--more-->

The race track is an ABAP program with an initial part that is identical for all 4 competitors, as follows:


{{< highlight ABAP >}}

REPORT  YYYTEST_ABAPINHO.

TYPES:  BEGIN OF TY_BKPF,
          BUKRS   TYPE BUKRS,
          BELNR   TYPE BELNR_D,
          GJAHR   TYPE GJAHR,
        END OF TY_BKPF.

TYPES:  BEGIN OF TY_BSEG,
          BUKRS   TYPE BUKRS,
          BELNR   TYPE BELNR_D,
          GJAHR   TYPE GJAHR,
          BUZEI   TYPE BUZEI,
        END OF TY_BSEG.

  DATA: LT_HEADER TYPE TABLE OF TY_BKPF.
  DATA: LS_HEADER TYPE TY_BKPF.
  DATA: LS_ITEM TYPE TY_BSEG.
  DATA: LV_COUNTER  TYPE I.

START-OF-SELECTION.

  SELECT BUKRS BELNR GJAHR
    FROM BKPF
    INTO TABLE LT_HEADER
    UP TO 25000 ROWS.
  CHECK LT_HEADER IS NOT INITIAL.

   (after this comes the part that is specific to each competitor)
{{< /highlight >}}

As you can see, it is nothing complicated. It begins by declaring some types, some auxiliary variables, it then selects 25 000 lines of BKPF for the LT_HEADER headers table which is also shared by the four competitors.

Attention! If you want to place bets now is the time, because the race is about to begin.

On your marks...
Get set...
Go!

**Competitor number 1**

The first competitor is the common everyday internal table, used and abused, as it came from the factory in the mid-twentieth century. This table is as follows:


{{< highlight ABAP >}}

  DATA: LT_ITEM TYPE TABLE OF TY_BSEG.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
    INTO TABLE LT_ITEM
     FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.
    LOOP AT LT_ITEM INTO LS_ITEM
      WHERE BUKRS = LS_HEADER-BUKRS
      AND   BELNR = LS_HEADER-BELNR
      AND   GJAHR = LS_HEADER-GJAHR.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.
  ENDLOOP.
{{< /highlight >}}

More conventional than this is impossible. The results are not very encouraging. Let’s see if based on this our readers think twice before using it on anything that moves:

![][1]

**Competitor number 2**

Now it’s the turn of competitor number two, with metallic paint, alloy wheels and equipped with a performance HASH that gives it the roar of Ferrari. Here it is:


{{< highlight ABAP >}}

  DATA: LT_ITEM_HASHED  TYPE HASHED TABLE OF TY_BSEG
                        WITH UNIQUE KEY BUKRS BELNR GJAHR BUZEI.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
    INTO TABLE LT_ITEM_HASHED
    FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.
    LOOP AT LT_ITEM_HASHED INTO LS_ITEM
      WHERE BUKRS = LS_HEADER-BUKRS
      AND   BELNR = LS_HEADER-BELNR
      AND   GJAHR = LS_HEADER-GJAHR.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.
  ENDLOOP.
{{< /highlight >}}

This competitor has a unique key that is defined with four fields. Although the HASH TABLES are the super-speedster when called with the complete key, that is not possible in this race because it is a LOOP. Therefore, it creeps shamefully to the finish line. It is a disgrace, as the following results prove:

![][2]

**Competitor number 3**

Next is competitor number three, a beautiful table that is already ranked for greater aerodynamic efficiency. It is as quick and as quiet as needed. Here it is:


{{< highlight ABAP >}}

  DATA: LT_ITEM_SORTED  TYPE SORTED TABLE OF TY_BSEG
                        WITH UNIQUE KEY BUKRS BELNR GJAHR BUZEI.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
     INTO TABLE LT_ITEM_SORTED
    FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.
    LOOP AT LT_ITEM_SORTED INTO LS_ITEM
      WHERE BUKRS = LS_HEADER-BUKRS
      AND   BELNR = LS_HEADER-BELNR
      AND   GJAHR = LS_HEADER-GJAHR.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.
  ENDLOOP.
{{< /highlight >}}

Incredible, ladies and gentlemen! Competitor number 3 was very fast. About 2000x faster making the loops than the two previous competitors! Here is its score:

![][3]

**Competitor number 4**

Last but not least, I give you competitor number 4. The craziest and most implausible of them all. It's like a retread of an old model, just like those Renault 5 Turbo’s that were around in grandmother's time, which appear to be a pile of rubbish but are able to fly over the road:


{{< highlight ABAP >}}

  DATA: LT_ITEM TYPE TABLE OF TY_BSEG.
  DATA: LV_INDEX    TYPE SYTABIX.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
    INTO TABLE LT_ITEM
    FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.
  SORT LT_ITEM BY BUKRS BELNR GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.

    READ TABLE LT_ITEM
      TRANSPORTING NO FIELDS
      BINARY SEARCH
      WITH KEY  BUKRS = LS_HEADER-BUKRS
                BELNR = LS_HEADER-BELNR
                GJAHR = LS_HEADER-GJAHR.
    CHECK SY-SUBRC = 0.
    LV_INDEX = SY-TABIX.

    LOOP AT LT_ITEM INTO LS_ITEM FROM LV_INDEX.
      IF  LS_ITEM-BUKRS <> LS_HEADER-BUKRS OR
          LS_ITEM-BELNR <> LS_HEADER-BELNR OR
          LS_ITEM-GJAHR <> LS_HEADER-GJAHR.
        EXIT.
      ENDIF.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.

  ENDLOOP.
{{< /highlight >}}

That too is a stunning result. It is a conventional table that is able to gain enormous speed thanks to some curious manoeuvres. Basically, it pulls some tricks to pretend it's more than it actually is. It starts by doing a SORT. Then instead of doing the second LOOP immediately afterwards it first does a READ TABLE BINARY SEARCH and then makes a LOOP FROM INDEX ([a magic trick already discussed here][4]). The results could not be more impressive because, although it is a common old table, it behaves as if it had royal blood in its veins:

![][5]

**The Winner**

And the winner, ladies and gentlemen, is competitor number 3, the SORTED TABLE. Closely following on in second is competitor number 4, with its LOOP FROM INDEX. As the results show, the difference between the SORTED TABLE and second place is very small. Of course, given the choice, a SORTED TABLE will always be preferred. But if you are working on existing code that already has one of the common tables that cannot be altered, then competitor 4 is a very good compromise solution. The results of the other two competitors were so bad that it is best to leave it at that.

It is interesting to compare the graphs and see that the time spent in the database is almost identical in the four presented cases. The major differences occur in relation to ABAP processing.

And so today’s race comes to an end. Fortunately there were no crashes. I hope it was as exciting for you as it was for us. I hope we’ll see you again at the next race.

(Thank you (again) Bruno Filipa!)

Greetings from Abapinho.

   [1]: images/corrida_concorrente1_normal.png (corrida_concorrente1_normal)
   [2]: images/corrida_concorrente3_hash.png (corrida_concorrente3_hash)
   [3]: images/corrida_concorrente2_sorted.png (corrida_concorrente2_sorted)
   [4]: {{< ref "loop-from-index" >}}
   [5]: images/corrida_concorrente4_loopintoindex.png (corrida_concorrente4_loopintoindex)
