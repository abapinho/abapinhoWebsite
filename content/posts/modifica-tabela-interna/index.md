---
slug: modifica-tabela-interna
title: Modifica facilmente uma tabela interna
description: A forma mais práctica de alterar dados numa tabela interna.
date: 2022-05-09T09:00:00+01:00
tags: [7.4, itbl]
categories: [dicas]
keywords: [modifica tabela interna]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A nova forma de ler de tabelas internas é também a nova forma de escrever em tabelas internas.

<!--more-->

Dantes, para modificar um registo de uma tabela interna, ou fazias um `LOOP` para uma estrutura que alteravas e usavas o `MODIFY`, ou então fazias `READ TABLE` para um `FIELD-SYMBOL` que depois podias alterar. Obtuso.

Graças ao 7.4, passaste a poder tirar dados de uma tabela interna de forma muito mais simples, que imagino que já estejas a usar:

```abap
DATA(text) = itbl[ kunnr = customer ]-text.
```

Mas a grande cena é que isto também funciona para pôr dados numa tabela interna:

```abap
itbl[ kunnr = customer ]-text = text.
```

Se calhar isto já era óbvio para toda a gente menos para mim porque acho que só o realizei há pouco tempo. Se já sabias... olha... desculpa lá.

Obrigado pela foto, [mvongrue][1].

O Abapinho saúda-vos.

  [1]: <https://visualhunt.com/f7/photo/3222974360/3b9a746a54/>
