---
title: 'Refactoring: Extract method'
slug: refactorizacao-extrair-metodo
date: 2019-01-02 09:00:23
tags: [estilo, qc, qualidade]
categories: [artigos]
wordpressId: 4093
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
In SAP's world, ABAP code will forever stay wherever you leave it.

On one given day, Manuel did something badly because he was on a rush or didn't know any better. One year later António is asked to make a small change to it. António spots Manuel's mess but he doesn't improve it because, for some reasons, in SAP, changing something which is working, even if it's badly implemented, is a tabu. Instead, António will add his code to the existing one and forget about it.

This attitude, when adopted by everyone, contributes to an inevitable erosion of the system's code which, some years later, becomes unmanageable. And still, that's the rule.

The way I see it, this is wrong and goes against the customer's best interests. Actually, even if the customer doesn't want me to modify old code because it's working... I still do it. Who is he to tell me how to program?

<!--more-->

I'll try to make a series of posts in which I describe what I do when I run into bad code, explaining the refactoring techniques that I've been adopting to try to improve it.

All these refactoring techniques, some simpler and intuitive, others complex and far fetched, were already thoroughly identified and named by the great master Martin Fowler (y sus amigos) in his highly praised book ["Refactoring - Improving the design of existing code"][1] and are all catalogued and available online for reference [on his website][2].

Today I'll focus on the [Extract method][3] technique.

I was asked to add a new functionality to an old routine of an old class. This routine is a method with over 150 lines consisting of a serious of SELECTs and LOOP ATs and a bunch of local variables. If I just have to make a minor change I'll probably not touch anything else. But if the intervention requires adding new code or making substantial changes to existing code, I'll do my best to make sure that when I finish, the routine will be better and have less lines than when I found it.

Example (imagine this method has more than 150 lines):


{{< highlight ABAP >}}
METHOD select_data.
  DATA: t_bkpf TYPE ty_t_bkpf.
  FIELD-SYMBOLS: <s_bkpf> LIKE LINE OF t_bkpf.

  SELECT * FROM bkpf 
    INTO CORRESPONDING FIELDS OF TABLE t_bkpf 
    WHERE belnr IN me->r_belnr.

  LOOP AT t_bkpf ASSIGNING <s_bkpf>.
    SELECT SINGLE name1 
      INTO <s_bkpf>-name1
      FROM kna1
      WHERE kunnr = <s_bkpf>-kunnr. 
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

Note: I know this code is wrong and oversimplified but it's only an example, ok?

The first thing I do is try to identify parts which can be modularized and then encapsulate them. Like this:


{{< highlight ABAP >}}
METHOD select_data.
  DATA: t_bkpf TYPE ty_t_bkpf.
  t_bkpf = select_bkpf( ).
  update_bkpf_with_customer_name( CHANGING ct_bkpf = t_bkpf ).
ENDMETHOD.

METHOD select_bkpf.
  SELECT * FROM bkpf 
    INTO CORRESPONDING FIELDS OF TABLE rt_bkpf 
    WHERE belnr IN me->r_belnr.
ENDMETHOD.

METHOD update_bkpf_with_customer_name.
  DATA: t_kna1 TYPE ty_t_kna1,
        s_kna1 LIKE LINE OF t_kna1.
  FIELD-SYMBOLS: <s_bkpf> LIKE LINE OF t_bkpf.

  IF ct_bkpf[] IS INITIAL.
    RETURN.
  ENDIF.

  SELECT kunnr name1
    FROM kna1
    INTO CORRESPONDING FIELDS OF t_kna1
    FOR ALL ENTRIES IN ct_bkpf
    WHERE kunnr = ct_bkpf-kunnr.

  LOOP AT ct_bkpf ASSIGNING <s_bkpf>.
    READ TABLE t_kna1 INTO s_kna1 WHERE kunnr = <s_bkpf>-kunnr.
    IF SY-SUBRC = 0.
      <s_bkpf>-name1 = s_kna1-name1.
    ENDIF.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

Done. I used the Extract Method technique twice to encapsulate the two things this routine was doing. If before it had over 150 lines, by now it has much less. I am now ready to add my new code which will of course also be encapsulated in a method.

After the refactoring, the program total line count increased. But that is irrelevant. What matters here is that each routine is small and focused on doing one and one thing only. Something which was not true in the initial mess I found.

Another improvement was introduced. The old version was doing a SELECT SINGLE inside a LOOP, something that should always be avoided. When refactoring that part I rewrote it so that a single SELECT is done to all the records at the same time. It will surely be faster.

Even though what I did was simple, the risk of regression is there. So, tests will have to be done in order to guarantee that the code is still working correctly. But the need for tests should not be an excuse to avoid touching old code (unless that code is so obscure that extracting methods becomes too complex and risky). Besides, since a new functionality was being introduced, tests would have to be made anyway.

Finally, the routine which used to have over 150 lines is now something in these lines:

{{< highlight ABAP >}}
METHOD select_data.
  DATA: t_bkpf TYPE ty_t_bkpf.
  t_bkpf = select_bkpf( ).
  update_bkpf_with_customer_name( CHANGING ct_bkpf = t_bkpf ).
  new_functionality_with_a_proper_name( CHANGING ct_bkpf = t_bkpf ).
ENDMETHOD.
{{< /highlight >}}

Easier to read, right? From now on it will be easier to maintain and more resistant to regressions in future changes.

The next person that has to make changes to it will find it much simpler to understand. If the intervention consists in adding a new functionality, let's hope the person creates a new method to encapsulate that new functionality instead of just adding his new code there (as I've seen done too many times) increasing the code's entropy instead of helping decrease it.

Photo: [Nicholas Erwin][4].

Greetings from Abapinho.

   [1]: https://martinfowler.com/books/refactoring.html
   [2]: https://refactoring.com/catalog/
   [3]: https://refactoring.com/catalog/extractMethod.html
   [4]: https://visualhunt.com/author2/7de346
