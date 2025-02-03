---
slug: final
title: Finalmente temos FINAL
description: Finalmente temos FINAL
date: 2025-02-03T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: [final]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Não há coisa pior do que ver gente a abusar das variáveis. São tão delicadas e no entanto tão mal tratadas, coitadas. Ora aqui está uma forma de lhes mostrar algum amor.

<!--more-->

Há muitas formas de maltratar uma variável. Claro que a pior é fazer dela global. Claro que há imensas outras formas de as tratar mal. Dar-lhes nomes obscuros, por exemplo.

Mas há uma forma de mal tratar as variáveis que me incomoda e que não é muito falada: reutilizá-las.

Exemplo:

```abap
METHOD execute.
  DATA sum TYPE i.

  LOOP AT itbl1 INTO DATA(wa).
    sum += wa-amount.
  ENDLOOP.

  LOOP AT itbl2 INTO wa.
    sum += wa-amount.
  ENDLOOP.
ENDMETHOD.
```

Olha lá o `wa` a ser indevidamente reutilizado. Por muito que parece algo inócuo, cada um daqueles `LOOP` devia ser totalmente independente.

Mas agora, felizmente, desde a versão 2022 (7.57) que temos o `FINAL`.

O `FINAL` permite garantir que uma variável não é reutilizada. Simples. No fundo quando usas o `FINAL` para declarar uma variável, ela transforma-se numa constante assim que é iniciada.

A regra que hoje uso é simples: uso sempre `FINAL` em vez de `DATA`. Vais descobrir que, se programares de forma limpa, raramente vais precisar de usar `DATA`.

Vamos melhorar o exemplo um bocadinho com `FINAL`:

```abap
METHOD execute.
  DATA sum TYPE i.

  LOOP AT itbl1 INTO FINAL(wa1).
    sum += wa1-amount.
  ENDLOOP.

  LOOP AT itbl2 INTO FINAL(wa2).
    sum += wa2-amount.
  ENDLOOP.

  " etc
ENDMETHOD.
```

E tu perguntas: mas se os dois `wa` são do mesmo tipo para que é que precisas de dois? Eu percebo. É tentador. Mas não penses assim. Isso era dantes quando ainda era tudo ao molho e fé em Zeus. Os dois `LOOP`s são coisas diferentes, mantém-nas distintas. Vais ter menos bugs assim.

E até digo mais: [é suposto um método fazer apenas uma coisa][1] e este já está a fazer duas. Neste caso, e porque as duas tabelas internas são do mesmo tipo, podemos fazer isto:

```abap
METHOD calc_sum.
  RETURN REDUCE i( INIT x = 0 FOR wa IN itab NEXT x = x + wa ).
ENDMETHOD.

METHOD execute.
  FINAL(sum) = calc_sum( itbl1 ) + calc_sum( itbl2 ).
  " etc
ENDMETHOD.
```

Vês como até foi fácil livrarmo-nos do outro `DATA` que nem era o mais problemático?

Interioriza isto: quanto menos variáveis melhor e quanto menor o âmbito delas melhor.

Já agora, a forma mais simples de topar que uma variável está a ser reutilizada é quando começam a aparecer `CLEAR` pelo código. Já [escrevi sobre isso][2] no passado. Se precisas de limpar uma variável é porque ela está suja. Se ela está suja é porque tu não és um programador muito higiénico. Se tens de usar `CLEAR`, desconfia logo do que estás a fazer. Há muito provavelmente uma forma mais limpa de fazer o mesmo que não precise de `CLEAR`. Eu fico logo de pé atrás quando vejo um `CLEAR`.

A conclusão é: tenta usar sempre `FINAL` em vez de `DATA`. Se o compilador se queixar então é porque a variável está a ser reutilizada. Considera repensar o código para não precisares dela.

Obrigado Aurélien Albert pela dica.

O Abapinho saúda-vos.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#do-one-thing-do-it-well-do-it-only>
[2]: {{< ref "evita-o-clear" >}}
