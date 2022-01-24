---
title: 'APPEND LINES OF classe->metodo() TO itbl'
slug: append-lines-of-classe-metodo-to-itbl
date: 2014-01-27 22:33:25
tags: [estilo]
categories: [dicas]
wordpressId: 2559
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O ABAP anda cada vez mais esperto. Ainda sou do tempo em que não se fazia nada dele. E agora, lentamente, com mais de um quinto de século de atraso, lá vai tentado imitar o C e o Java e ficando mais flexível.

Eu ia fazer algo deste tipo:

<!--more-->


{{< highlight ABAP >}}
DATA: t_t001 TYPE STANDARD TABLE OF t001,
            t_t001_aux LIKE t_t001.

t_t001_aux = zcl_t001=>get_lines( 'A' ).
APPEND LINES OF t_t001_aux TO t_t001.

REFRESH t_t001_aux[].

t_t001_aux = zcl_t001=>get_lines( 'B' ).
APPEND LINES OF t_t001_aux TO t_t001.
{{< /highlight >}}

Mas depois pensei que... às tantas... talvez isto desse:


{{< highlight ABAP >}}
DATA: t_t001 TYPE STANDARD TABLE OF t001.

APPEND LINES OF zcl_t001=>get_lines( 'A' ) TO t_t001.
APPEND LINES OF zcl_t001=>get_lines( 'B' ) TO t_t001.
{{< /highlight >}}

E deu!

Percebeste? O método GET_LINES devolve uma tabela interna tipo T001. Em vez de guardar o resultado numa tabela interna auxiliar e em seguida adicionar as linhas da tabela à tabela final, assim adiciona-se directamente o resultado do método à tabela final. Fica mais simples, mais elegante, e poupa-se uma tabela interna auxiliar. Obrigado a pollovf pela [foto][1]. O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/30356381@N02/2847638199/
