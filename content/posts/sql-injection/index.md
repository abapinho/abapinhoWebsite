---
slug: sql-injection
title: Os teus utilizadores conseguem hackar o teu SQL?
description: sql-injection
date: 2022-03-21T09:00:00Z
tags: [segurança]
categories: [artigos]
keywords: [sql injection]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Tens a certeza de que o teu SQL é à prova de bala?

<!--more-->
A injecção de SQL é uma forma de ataque em que o atacante consegue adulterar um comando SQL por forma a alterá-lo ou mesmo, nos piores casos, acrescentar novos comandos.

Tens a certeza de que todo o SQL de todos os teus programas está protegido contra este ataque?

Fica já a saber que se não usares SQL dinâmico não tens de te preocupar.

Mas, se usares SQL dinâmico, depende de onde estás a obter a parte dinâmica. Se for fornecida pelo utilizador é bem possível que ele possa fazer estragos.

## Um programa vulnerável

Vejamos. Este programa faz um UPDATE e constrói a expressão SET com base no nome e valor dados pelo utilizador:

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

Parece inóculo, certo? Partimos do princípio de que o utilizador vai introduzir algo deste tipo:

- `P_KUNNR` = `12345`
- `P_NAME` = `NASA`

E o SQL gerado será:

```sql
UPDATE zkna1 SET name1 = 'NASA' WHERE kunnr = '12345'
```

Tudo ok.

Mas imagina que o utilizador é um artista e resolve introduzir isto:

- `P_KUNNR` = `12345`
- `P_NAME` = `NASA' ORT01 = 'HACKED!`

Neste momento se calhar o melhor é fazeres as malas, arranjares uma nova identidade e começares uma vida nova nas ilhas Andaman porque o SQL gerado agora será:

```sql
UPDATE zkna1 SET name1 = 'NASA' ORT01 = 'HACKED!' WHERE kunnr = '12345'
```

Pois é. Já foste. O utilizador conseguiu aproveitar-se do teu descuido para alterar indevidamente outros campos da tabela.

Como é que podes evitar este desastre?

## Um programa à provade injecção de SQL

A solução é simples: fazer sempre _escape_ ao conteúdo fornecido pelo utilizador:

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

Agora o `P_NAME` está vacinado porque o método `CL_ABAP_DYN_PRG=>QUOTE()` além de meter o conteúdo entre plicas, duplica qualquer plica que encontre. Portanto o resultado da tentativa de injecção agora ficaria assim:

```sql
UPDATE zkna1 SET name1 = 'NASA'' ORT01 = ''HACKED!' WHERE kunnr = '12345'
```

Pronto, o código está protegido contra injecções de SQL: agora só o campo `NAME1` poderá ser alterado. Neste caso seria alterado para `NASA' ORT01 = 'HACKED!`.

O Abapinho saúda-vos.
