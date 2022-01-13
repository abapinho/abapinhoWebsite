---
title: 'Desfazer implementação de nota SAP'
slug: desfazer-implementacao-de-nota-sap
date: 2020-08-13 09:00:32
tags: []
categories: [dicas]
wordpressId: 4554
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Sou do tempo em que as notas da SAP se introduziam à mão. Copy paste e rezar para não errar. Granda maluquice.

Lembro-me de um projecto que, por alguma razão que nunca ficou clara, em vez de se fazer upgrade, decidiu-se implementar várias centenas de notas à mão. Imprimiram as notas todas, fizeram num monte gigante com elas e uns 10 consultores passaram um fim-de-semana inteiro a tentar acabar com o monte. Conseguímos. Não faço ideia do que aconteceu a seguir mas de certeza que criámos montes de bugs.

<!--more-->

Felizmente entretanto apareceu a transacção SNOTE que tornou o processo automático.

Mas... e se tiveres usado o SNOTE para implementar uma nota e depois te arrependeres?

Embora nem toda a gente o saiba, felizmente o SNOTE também ajuda nisso:

Menu **SAP Note > Reset SAP Note Implementation**.

[![][1]][1]

Obrigado Sérgio Fraga pela dica.

Obrigado [dps][2] pela foto.

O Abapinho saúda-vos.

   [1]: images/undo_sap_note.png
   [2]: https://visualhunt.co/a5/a0b96f2b
