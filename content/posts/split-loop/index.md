---
slug: split-loop
title: Faz apenas uma coisa por LOOP
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
Os programadores ABAP são muito poupadinhos. Quando lhes aparece um LOOP à frente gostam de o aproveitar para fazer tudo e mais alguma coisa. Mesmo que esse LOOP fique com centenas ou milhares de linhas.
<!--more-->

Isto acontece porque existe o preconceito de que vários _loops_ demoram mais tempo. Mas a verdade é que em 99.9% dos casos a diferença ou não existe ou é totalmente irrelevante.

Isto vai contra uma das boas prácticas mais importantes da programação: não faças várias coisas ao mesmo tempo. Ou, dito ao contrário: faz uma coisa de cada vez.

Porque o código fica mais fácil de entender, de reorganizar e de manter.

É por isso que uma das técnicas de _refactoring_ que o grande Martin Fowler nos ensina é o [split loop][1], que consiste em transformar um _loop_ que faz várias coisas em vários _loops_, cada um fazendo apenas uma coisa.

Por exemplo, reparem nesta confusão (tão _very typical_ dos programas ABAP):

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

Este `LOOP` faz 4 coisas ao mesmo tempo:

- Filtra os clientes, ignorando os que não são parte da EU;
- Soma as vendas anuais dos clientes da EU;
- Soma as vendas anuais dos clientes da EU cujo nome começa por vogal;
- Obtém o número de clientes da EU.

Vamos lá tentar dividir para conquistar:

```ABAP
METHOD main.
  " 1. Antes de mais obtemos uma nova lista com apenas
  " os clientes relevantes e a seguir passamos a usar
  " esta nova lista em vez da inicial.
  DATA(eu_customers) = VALUE #(
    FOR customer IN customers
    WHERE ( customer-land1 IN countries_of_eu )).

  " 2. Vendas anuais dos clientes válidos
  DATA(total_sales) = REDUCE wrbtr(
    INIT total = 0
    FOR customer1 IN eu_customers
    NEXT total = total + customer1-annual_sales ).

  " 3. Vendas anuais dos clientes válidos cujo nome começar por vogal
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

No código acima as 4 coisas estão agora separadas (viste que a contagem dos clientes até ficou mais simples?). O código fica muito mais claro e além disso, como agora as coisas estão independentes, passou a ser possível re-estruturá-lo, encapsulando cada coisa no seu método:

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

Temos agora um método `main()` de alto nível onde é muito fácil entender o que está a acontecer e depois a lógica de negócio de mais baixo nível está devidamente individualizada e encapsulada em 3 métodos auxiliares. Já nem precisa de comentários.

Torna a olhar para o primeiro `LOOP`. Qual das versões preferes? Bem me parecia.

O Abapinho saúda-vos.

[1]: https://refactoring.com/catalog/splitLoop.html
