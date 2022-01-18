---
title: 'Como sabotar textos standard'
slug: como-sabotar-textos-standard
date: 2015-11-23 09:00:43
tags: [segredo]
categories: [artigos]
wordpressId: 3281
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Às vezes não gosto dos nomes que a SAP deu às coisas. E então mudo-os.

Por exemplo, um dia estava muito zangado e achava que os clientes eram todos uns parasitas.

Então fiz o seguinte:

<!--more-->

  1. Fui à transacção SE63;

  2. Ao menu Tradução > ABAP Objects > Textos breves;

  3. Abri a pasta "A5 Textos de interface";

  4. Fiz duplo clique na linha "DTEL Elementos de dados";

  5. Apareceu um ecrã de selecção. No campo "Nome do objecto" escrevi KUNNR;

  6. No campo "Idioma de destino escrevi "ptPT", que é o código do português de Portugal;

  7. Carreguei no botão "Processar";

  8. Apareceu um ecrã de tradução. E lá, em todo o sítio onde dizia "Cliente" substituí por "Parasita";

  9. Carreguei nos ícones amarelos que passaram a verde e gravei.

Eis o ecrã de tradução:

[![se63_clientes_parasitas][1]][1]

Quando fui ver a tabela KNA1 na transacção SE16N apareceu isto:

[![se16n_clientes_parasitas][2]][2]

Repara bem na descrição que apareceu no código de cliente. A minha alma sentiu-se novamente em paz: estava vingado!

Obrigado Carla Luz pela dica.

Obrigado Franck Berthelet pela [foto][3].

O Abapinho saúda-vos.

   [1]: images/se63_clientes_parasitas.png
   [2]: images/se16n_clientes_parasitas.png
   [3]: https://www.flickr.com/photos/bigot44/16005934118
