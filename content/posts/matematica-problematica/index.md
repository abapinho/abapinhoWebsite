---
title: 'Matemática problemática'
slug: matematica-problematica
date: 2013-12-09 09:00:23
tags: [segredo]
categories: [artigos]
wordpressId: 2501
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Sabes a diferença entre um mistério e um enigma? Num enigma sabe-se que há uma solução mas esta não é conhecida; já num mistério, não se sabe se haverá solução.

Concordas com isto?
5 * 3 / 10 = ( 5 * 3 ) / 10 = 5 * ( 3 / 10 ) = 1.5

Se não concordas, devias concordar porque é um facto matemático.

Mas vamos lá fazer umas experiências.

<!--more-->

Experimenta correr o seguinte código:


{{< highlight ABAP >}}
DATA val TYPE i.
val = ( 5 * 3 ) / 10.
WRITE val.
{{< /highlight >}}

O resultado no ecrã é 1. Porquê?
Simples. Porque a variável é do tipo integer e por isso só guarda a parte inteira. Se mudares o tipo da variável de _integer_ para _float_ , alívio, o ecrã já mostra 1.5.

Experimenta agora correr o seguinte código:


{{< highlight ABAP >}}
DATA val TYPE i.
val = 5 * ( 3 / 10 ).
WRITE val.
{{< /highlight >}}

O resultado no ecrã é 0.
Estaremos nós perante um mistério? Ou apenas um enigma?

Sei de pessoas que começaram a acreditar em Deus por menos!

Mas o que se passa aqui é simples. É que em ABAP os resultados dos cálculos intermédios, neste caso a divisão 3/10, são igualmente guardados numa variável inteira. Ou seja: 3/10=0.333 convertido para inteiro fica 0. Depois 5*0=0. Mais uma vez, se a variável fosse do tipo _float_ o resultado seria 1.5.

Pronto. Está o enigma resolvido.
Ufa! Não era nenhum mistério afinal.

Obrigado Miguel Jorge.

O Abapinho saúda-vos.
