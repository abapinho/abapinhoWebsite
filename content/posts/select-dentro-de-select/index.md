---
title: 'SELECT dentro de SELECT'
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
Provavelmente por razões históricas, os programadores ABAP não exploram as possibilidades do SQL. Muitos há que em vez de usarem INNER JOINs, ainda julgam que é mais rápido fazer vários SELECTs para tabelas internas e depois trabalhar os dados em ABAP. Mas a verdade é que, mesmo que se haja excepções, a regra é: quanto menos acessos à base de dados, melhor a performance. E faz sentido porque, afinal, porque foram escritas explicitamente para isso, as bases de dados relacionais são muito mais peritas em processar dados relacionais do que um programa ABAP.

Mas claro que há coisas que, pela sua complexidade, não podem ser feitas com um simples INNER JOIN. Ainda assim, algumas dessas coisas podem ser feitas num único SELECT.

<!--more-->

Vê na SE38 o exemplo standard DEMO_SELECT_SUBQUERY. Experimenta corrê-lo. Gostaste? Imagino que só pelo resultado não entendas grande coisa. Mas vai ao código. É pequenino. Lá encontras o seguinte comando SQL:


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

Aqui é feito um SELECT dentro de um SELECT. O SELECT de dentro descobre os voos de uma determinada companhia. O SELECT de fora descobre quais os aviões com capacidade para fazer o voo, com base na ocupação desses voos. O ALL() é apenas uma de muitas funções SQL que podem ser usadas neste tipo de SELECTs encadeados.

Se leste esta dica até aqui fica sabendo que na minha opinião ela só te será útil se:

  * entendeste porque é que não se conseguia fazer isto com um INNER JOIN

  * percebeste como é que este SELECT encadeado funciona

  * ficaste a saber em que circunstâncias e como vais poder utilizar SELECTs encadeados nos teus programas

Nota: este exemplo encontra-se no pacote SABAPDEMOS que tem centenas de exemplos interessantes sobre os mais variados temas e que vale a pena ser explorado.

Obrigado Todd Anderson pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/toddography/2039964038/
