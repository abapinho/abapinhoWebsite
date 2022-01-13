---
title: 'Macros - Velocidade de ponta'
slug: macros-velocidade-de-ponta
date: 2009-09-16 02:37:52
tags: [estilo, performance]
categories: [artigos]
wordpressId: 134
draft: false
---
Normalmente quando há um pedaço de código que pretendemos reutilizar várias vezes, transformamo-lo numa sub-rotina que pode depois ser invocada repetidamente. Embora a SAP não saiba estruturar o seu próprio código, ainda assim, o ABAP, coitadinho, permite-o. E até disponibiliza várias alternativas para modularizar o código. Eu conto quatro alternativas que listo aqui, da mais rígida para a mais flácida: METHOD, FUNCTION, FORM, DEFINE. Se os 3 primeiros são já familiar de todos, o último - DEFINE - quase ninguém usa. O DEFINE permite definir macros em ABAP. E o que são macros? São sub-rotinas aparentes.

Aparentes porquê?

<!--more-->

Porque enquanto nos outros três casos há de facto uma estruturação da lógica de execução do programa, no caso dos macros, esta estruturação acontece apenas a fingir, porque durante a compilação, na verdade os macros são substituídos pelo código que representam.

Então um exemplo: vou definir um macro para fazer continhas.

{{< highlight ABAP >}}
DEFINE faz_continha.
  &amp;1 = &amp;1 + &amp;2.
END-OF-DEFINITION.

DATA: var type i.
var = 0.
DO 100000 TIMES.
  faz_continha var 1.
ENDDO.
{{< /highlight >}}

Aparentemente isto é semelhante à utilização de FORMs. A diferença é que, durante a compilação, os macros são directamente substituídos pelo código que representam. Por isso mesmo nem sequer há qualquer validação de tipos de dados.

Além de ser, portanto, uma forma meio manhosa de estruturar o código, ainda sofre do problema não permitir fazer _debug_.

Então afinal qual é a vantagem? Vamos ver. A alternativa normal seria:


{{< highlight ABAP >}}
DATA: var type i.
var = 0.
DO 1000000 TIMES.
  PERFORM faz_continha USING 1 CHANGING var.
ENDDO.

FORM faz_continha USING v2 CHANGING v1.
  v1 = v1 + v2.
ENDFORM.
{{< /highlight >}}

Se usarmos a transacção SE30 para comparar o tempo que cada uma demora, temos uma surpresa:

DEFINE: 6.439ms
FORM: 773.882ms

Ou seja, a versão que usa macros é mais de 100x mais rápida do que a versão normal com sub-rotinas. Conclusão: a grande vantagem dos macros é velocidade.

O Abapinho saúda-vos.
