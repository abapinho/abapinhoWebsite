---
title: 'Mais RANGEs, menos SELECTs'
slug: mais-ranges-menos-selects
date: 2012-06-04 09:00:33
tags: [estilo, sql]
categories: [dicas]
wordpressId: 1721
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O dicionário diz o seguinte do verbete "estilo": "conjunto de aspectos formais e recursos expressivos que caracterizam um texto".

Dá mais gosto ler textos com estilo do que textos sem estilo. Se o ABAP é uma linguagem, um programa em ABAP é um texto. Há programas que, no que toca ao estilo, parecem escritos com os pés; enquanto há outros que se poderia jurar que a pena que os escreveu deixou-se guiar pelas alvas mãos de uma qualquer donzela do século XVIII afligida por males de amor. Felizmente penso que não é possível escrever programas em ABAP tão pirosos quanto esta última frase.

Aqui no Abapinho usa-se a etiqueta "estilo" para identificar artigos que falam sobre isso mesmo: estilo. Estes artigos tentam encontrar formas de melhorar o estilo dos programas ABAP. Esta é uma das etiquetas favoritas do Abapinho como podes ver [aqui][1]. E isto que estás a ler é mais um desses artigos.

Adiante.

<!--more-->

É muito comum ver código coisas como isto:


{{< highlight ABAP >}}
IF i_kunnr IS INITIAL.
  IF i_name1 IS INITIAL.
    SELECT SINGLE * INTO w_kna1 FROM kna1.
  ELSE.
    SELECT SINGLE * INTO w_kna1 FROM kna1
      WHERE name1 = i_name1.
  ENDIF.
ELSE.
  IF i_name1 IS INITIAL.
    SELECT SINGLE * INTO w_kna1 FROM kna1
      WHERE kunnr = i_kunnr.
  ELSE.
    SELECT SINGLE * INTO w_kna1 FROM kna1
      WHERE kunnr = i_kunnr AND name1 = i_name1.
  ENDIF.
ENDIF.
{{< /highlight >}}

Ou seja, temos dois parâmetros opcionais que podemos usar para seleccionar um registo da KNA1 e conforme estes venham preenchidos fazemos o SELECT adequado. Tem estilo? Não. Vou mostrar-te outra forma de fazer o mesmo:


{{< highlight ABAP >}}
DATA: r_kunnr TYPE RANGE OF kunnr,
          s_kunnr LIKE LINE OF r_kunnr,
          r_name1 TYPE RANGE OF name1,
          s_name1 LIKE LINE OF r_name1.

IF i_kunnr IS NOT INITIAL.
  s_kunnr-option = 'EQ'.
  s_kunnr-sign = 'I'.
  s_kunnr-low = i_kunnr.
  APPEND s_kunnr TO r_kunnr.
ENDIF.

IF i_name1 IS NOT INITIAL.
  s_name1-option = 'EQ'.
  s_name1-sign = 'I'.
  s_name1-low = i_name1.
  APPEND s_name1 TO r_name1.
ENDIF.

SELECT SINGLE * INTO w_kna1 FROM kna1
  WHERE kunnr IN r_kunnr AND name1 IN r_name1.
{{< /highlight >}}

Que tal assim? Faz a mesma coisa, mas tem muito mais estilo.

Outra forma seria usar um SELECT dinâmico, mas neste caso seria desnecessariamente complicado.

O Abapinho saúda-vos.

   [1]: https://abapinho.com/tag/estilo/
