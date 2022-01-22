---
title: 'Quando a tabela interna não é estruturada'
slug: tabela-interna-nao-estruturada
date: 2012-02-27 10:00:06
tags: [segredo]
categories: [dicas]
wordpressId: 1477
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando queres seleccionar linhas numa tabela interna normalmente fazes algo assim:


{{< highlight ABAP >}}
DATA: BEGIN OF itbl,
            campo1 TYPE c,
            campo2 TYPE c,
          END OF itbl.

READ TABLE itbl WITH KEY campo1 = 'X' campo2 = 'Y'.

LOOP AT itbl WHERE campo1 = 'X' and campo2 = 'Y'.
  COISO.
ENDLOOP.
{{< /highlight >}}

Mas, e se a tabela não for estruturada e quiseres pesquisar na linha como um todo? Bem, nesse caso, fica aqui a dica: usas a palavra especial _TABLE_LINE_ :


{{< highlight ABAP >}}
DATA: itbl TYPE STANDARD TABLE OF string,
            wa LIKE LINE OF itbl.

READ TABLE itbl WITH KEY table_line = 'X'.

LOOP AT itbl INTO wa WHERE table_line = 'X'.
  COISO.
ENDLOOP.
{{< /highlight >}}

(Obrigado a [Aaron Escobar][1] pela foto.)

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/aaronescobar/2179228774/
