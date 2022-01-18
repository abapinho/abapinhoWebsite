---
title: 'Dantes o ABAP gostava de inverter datas'
slug: dantes-abap-gostava-inverter-datas
date: 2017-02-27 09:00:40
tags: []
categories: [artigos]
wordpressId: 3740
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Todos os dias o ABAP me revela coisas novos. Às vezes coisas que mais valia eu nem saber que existem. Como esta.

A tabela T056P tem um campo com uma data. Fazendo um SELECT a esta tabela filtrando pela data não conseguia obter nada de jeito. Mas o código parecia correcto. Na SE16N descobri que o intervalo de datas também não funcionava conforme esperado: só apresentava resultados quando a data final era colocada no LOW e a inicial no HIGH. Bizarro.

<!--more-->

Até que reparei que o elemento de dados se chamava DATAB_INV e que usa o domínio DATUM_INV. Foi ao olhar para o domínio que se fez luz. INV neste caso quer dizer INVertido.

Usei a transacção SE17 (por ser tão antiga que não usa as rotinas de conversão) para ver o conteúdo real da T056P e descobri que as datas são tipo 79949176.

Depois de investigar um bocado descobri que este formato de datas invertido é (ou foi...) standard e que até há uns comandos ABAP para o tratar:


{{< highlight ABAP >}}
CONVERT INVERTED-DATE dat1 INTO DATE dat2.
CONVERT DATE dat2 INTO INVERTED-DATE dat1.
{{< /highlight >}}

Comandos esses que são tão obsoletos que nem podem ser usados em ABAP OO.

Só que eu estou a usar ABAP OO e calhou-me na rifa ter de lidar com este tipo de datas. E agora?

E agora, como a SE16N consegue mostrar estas datas correctamente decidi copiar o código das rotinas de conversão e pronto:


{{< highlight ABAP >}}
METHOD TO_INVERTED_DATE.
  DATA: chdat(8) TYPE c,
        houtput(8) TYPE n.

  r_inverted_date = i_date.

  MOVE i_date TO chdat.
  houtput = '99999999' - chdat.  "Zwischenspeichern in houtput, damit
  r_inverted_date = houtput.

ENDMETHOD.
{{< /highlight >}}

Funcionou.

Espero nunca mais me cruzar com uma data destas.

O Abapinho saúda-vos.
