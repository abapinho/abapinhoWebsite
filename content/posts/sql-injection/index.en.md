---
slug: sql-injection
title: Can your users hack your SQL?
description: sql-injection
date: 2022-03-21T09:00:00Z
tags: [segurança]
categories: [artigos]
keywords: [sql injection]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Are you sure your SQL is bulletproof?

<!--more-->
SQL injection is a kind of exploit which tries to tamper with an SQL command to either change it or add new commands to it.

How much of the SQL in all your programs is protected against this?

You only have to worry if you use dynamic SQL, by the way.

But if you do, you better worry. Because, if the dynamic content is being provided by the user, beware.

## A vulnerable programme

This program executes a dynamic updated which builds its SET expressions based on a name and value provided by the user:

```ABAP
REPORT zabapsec_sql_injection.

PARAMETERS: p_kunnr TYPE kunnr OBLIGATORY.
PARAMETERS: p_name TYPE name1 OBLIGATORY.

START-OF-SELECTION.
  DATA(set_expression) = | NAME1 = '{ p_name }'|.
  UPDATE zkna1
  SET (set_expression)
  WHERE kunnr = p_kunnr.
```

It seems harmless, right? Because we assume the user is nice and friendly and is going to input something like this:

- `P_KUNNR` = `12345`
- `P_NAME` = `NASA`

Which yields this SQL command:
```sql
UPDATE zkna1 SET name1 = 'NASA' WHERE kunnr = '12345'
```

All good.

But consider that a malefic and imaginative user decides to enter this:

- `P_KUNNR` = `12345`
- `P_NAME` = `NASA' ORT01 = 'HACKED!`

Well, you probably should be packing and getting ready to start a new life with a new identity in the Andaman Islands because the resulting SQL is this:

```sql
UPDATE zkna1 SET name1 = 'NASA' ORT01 = 'HACKED!' WHERE kunnr = '12345'
```

Yes. You're a gonner. The user managed to take advantage of your carelessness and is now able to update any field in that table with whatever he wants.

How  can you avoid this disaster?

## A programme protected against SQL injection

Actually, the solution is quite simple: always escape any content provided by the user:

```ABAP
REPORT zabapsec_sql_injection_fixed.

PARAMETERS: p_kunnr TYPE kunnr OBLIGATORY.
PARAMETERS: p_name TYPE name1 OBLIGATORY.

START-OF-SELECTION.
  DATA(set_expression) = | NAME1 = { cl_abap_dyn_prg=>quote( p_name ) }|.
  UPDATE kna1
  SET (set_expression)
  WHERE kunnr = p_kunnr.
```

Now `P_NAME` is escaped by method `CL_ABAP_DYN_PRG=>QUOTE()` which, besides adding single quotes around the content, will also duplicate any single quote found. Now the resulting SQL command is safe:

```sql
UPDATE zkna1 SET name1 = 'NASA'' ORT01 = ''HACKED!' WHERE kunnr = '12345'
```

Your code is now protected against SQL injections. Only field `NAME1` can be modified. In this case it would be modified to `NASA' ORT01 = 'HACKED!`.

Greetings from Abapinho.
