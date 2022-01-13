---
title: 'Ignorar excepções de um módulo de função'
slug: ignorar-excepcoes-de-um-modulo-de-funcao
date: 2015-01-26 09:00:25
tags: [estilo]
categories: [dicas]
wordpressId: 2985
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando chamas um módulo de função que devolve excepções normalmente dás-lhes números sequenciais tipo isto:


{{< highlight ABAP >}}
CALL FUNCTION 'VAI_ALI_MAS_VOLTA'
  EXPORTING
    ali = 'Barreiro'
  EXCEPTIONS
    NOT_FOUND = 1
    GOT_LOST  = 2
    OTHERS    = 3.
{{< /highlight >}}

Mas se a seguir não tiveres o cuidado de ter um IF ou um CASE a olharem para o SY-SUBRC o Code Inspector pode devolve-te um erro caso esteja configurado para tal.

<!--more-->

No entanto há situações em que tens a certeza absoluta de que a função não vai dar erro e podes por isso evitar testar o SY-SUBRC. Para evitar os avisos do Code Inspector podes fazer duas coisas:

1\. Utilizar o pseudo-comentário "#EC CI_SUBRC
2\. Metes todos os valores da excepção = 0. Assim:


{{< highlight ABAP >}}
CALL FUNCTION 'VAI_ALI_MAS_VOLTA'
  EXPORTING
    ali = 'Barreiro'
  EXCEPTIONS
    NOT_FOUND = 0
    GOT_LOST  = 0
    OTHERS    = 0.
{{< /highlight >}}

Achei esta segunda muito engraçada.

Obrigado Leo Reynolds pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/lwr/1162472323
