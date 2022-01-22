---
title: 'Mergulhando no Caos com as classes CL_ABAP_RANDOM*'
slug: numeros-aleatorios
date: 2012-07-23 09:00:07
tags: []
categories: [dicas]
wordpressId: 1848
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Os programas ABAP são todos demasiado bem comportados; demasiado previsíveis.

Enquanto demiúrgos, temos a obrigação moral de lhes dar um pouco de livre arbítrio, dar-lhes a cheirar o caos, mostrar-lhes as árvores da vida e do conhecimento e, num passe de _kenosis_ , deixá-los à vontade para trincarem a maçã. Só assim nos sentiremos completos e realizados; só assim poderemos descansar ao sétimo dia.

E para isso, nada como os números aleatórios.

<!--more-->

Hoje apresento-te umas classes que servem para gerar números pseudo-aleatórios: CL_ABAP_RANDOM*

Aqui está um exemplo de como podes usá-las para gerar inteiros (quase) ao calhas:


{{< highlight ABAP >}}
DATA: r_random TYPE REF TO cl_abap_random_int,
      calhas1   TYPE i,
      calhas2   TYPE i,
      calhas3   TYPE i,
      seed      TYPE i.

seed = cl_abap_random=>seed( ).

CALL METHOD cl_abap_random_int=>create
  EXPORTING
    seed = seed
    min  = 1
    max  = 10
  RECEIVING
    prng = r_random.

calhas1 = r_random->get_next( ).
calhas2 = r_random->get_next( ).
calhas3 = r_random->get_next( ).

WRITE: seed, calhas1, calhas2, calhas3.
{{< /highlight >}}

Como podes ver, este indómito programita faz uso de duas classes: a CL_ABAP_RANDOM_INT para gerar os números e a CL_ABAP_RANDOM, usada para gerar a semente inicial.

Nota que, como as classes CL_ABAP_RANDOM* estão todas implementadas como _singleton_ , não lhes podes fazer CREATE OBJECT assim às descarada. Em vez disso tens de usar o método estático CREATE para criar instâncias delas.

Nota também que se não definires a SEED vais ter sempre a mesma sequência de números porque, por omissão, a seed inicial será sempre a mesma. Felizmente a classe CL_ABAP_RANDOM tem um método SEED() que permite obter sementes bastante aleatórias que deverá ser suficiente para gerares o caos que precisas de gerar no SAP.

Obrigado a [Y.........No logro comprender.......][1] pela foto.

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/pasteldechoclo/2109468529/
