---
title: 'SE16H - Agrega dados sem precisares do Excel'
slug: se16h-agrega-dados-sem-precisares-do-excel
date: 2015-10-12 09:00:57
tags: [database, segredo]
categories: [dicas]
wordpressId: 3258
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
No início dos tempos usava-se a transacção SE17 para ver o conteúdo de tabelas.
Rapidamente sentiram vergonha e decidiram fazer uma coisa melhorzinha a que chamaram SE16.
Depois inventaram a ALV e surgiu a SE16N (e muita gente continuou até hoje a usar a SE16, algo que me ultrapassa).

Hoje apresento-vos a SE16H.

<!--more-->

A SE16H não verm substituir a SE16N mas consegue fazer coisas que a SE16N não consegue. Uma delas é agregar dados. Lembras-te das vezes que tiveste de exportar os dados da SE16N para Excel para os poderes agregar numa pivot? Então aprende isto:

Corre a SE16H, escolhe a tabela BKPF e depois, na linha do campo GJAHR mete um pisco na coluna "Agrupar":

[![SE16H-1][1]][1]

Depois executa com F8 e vais obter algo assim:

[![SE16H-2][2]][2]

Em breve tentarei publicarei um artigo que mostra como usar a SE16H para fazer um _inner join_ como pediu o Fabio Pagoti.

Obrigado Sérgio Fraga pela dica.

Obrigado Michael Kötter pela [foto][3]

O Abapinho saúda-vos.

   [1]: images/SE16H-1.png
   [2]: images/SE16H-2.png
   [3]: https://www.flickr.com/photos/cmdrcord/6973087271
