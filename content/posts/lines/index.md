---
title: 'Adeus DESCRIBE TABLE. Já vais tarde.'
slug: lines
date: 2011-11-07 10:20:18
tags: [estilo]
categories: [dicas]
wordpressId: 1122
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Durante doze anos
Quando quis contar
As linhas de uma itab
Fazia o que todos fazem:
`DESCRIBE TABLE itab LINES linhas.`

Até que outro dia
Vi uma coisa que,
Parece mentira,
Nunca antes vira:
`LINES( itab ).`

Dá no mesmo
E sem ter de declarar
O raio da variável.

Assim, em vez de:


{{< highlight ABAP >}}
DATA: linhas TYPE i.
DESCRIBE TABLE itabl LINES linhas.
IF linhas = 42.
  WRITE 'A tua tabela é a verdade'.
ENDIF.
{{< /highlight >}}

Basta fazer:


{{< highlight ABAP >}}
IF LINES( itbl ) = 42.
  WRITE 'A tua tabela é a verdade'.
ENDIF.
{{< /highlight >}}

É a prova de que
Se a SAP quisesse
Fazia um esforço
E o ABAP seria
Uma coisa fixe.

Mas parece que não quer
E o ABAP que se lixe.

Merda de poema. Foi o que se arranjou.

O Abapinho saúda-vos.
