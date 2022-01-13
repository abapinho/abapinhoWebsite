---
title: 'Finalmente o ABAP sabe Excel'
slug: abap2xlsx
date: 2012-07-02 09:00:22
tags: []
categories: [artigos]
wordpressId: 1803
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Há várias formas de criar um Excel em ABAP. Umas mais masoquistas, outras menos masoquistas; umas mais foleiras, outras menos foleiras.

<!--more-->

A mais comum utiliza OLE2. Pode ver-se um exemplo [aqui][1]. É comum porque até há pouco tempo era a menos má de todas as alternativas. Mas mesmo assim é foleira porque, o OLE2 é feito do lado do SAPGui por isso não só é lento como não funciona em background.

Também há umas funções antigas como a MS_EXCEL_OLE_STANDARD_DAT que na prática também usa OLE e vai dar ao mesmo mas com menos flexibilidade.

Depois há abordagens malucas tipo [esta][2] que gera o XML do Excel explicitamente.

E deve haver mais.

Mas já nada disso interessa porque agora existe o [ABAP2XLSX][3]. O ABAP2XLSX é um projecto da SCN (SAP Community Network) desenvolvido por um rapaz jeitoso chamado [Ivan Femia][4]. O ABAP2XLSX é constituido por um conjunto de classes que permitem gerar em ABAP ficheiros Excel em formato XLSX de forma nativa, ou seja, sem recorrer a componentes externos. É simples de desenvolver, rápido a executar e pode ser feito em background. Além disso está bem documentado, tem dezenas de exemplos disponíveis e é apoiado por uma comunidade activa.

Permite gerar folhas de cálculo às cores e às bolinhas e com fórmulas e tudo e tudo e tudo. Deixo aqui apenas um dos exemplo (ZDEMO_EXCEL1):

<https://github.com/abapinho/codesnippets/blob/master/zdemo_excel1.abap>

Para o começares a usar basta instalares o nugget através do [SAPlink][5] que está disponível na [página do projecto][3]. O manual de instruções está [aqui][6].

Obrigado a [Filip Dujardin][7] pela foto.

O Abapinho saúda-vos.

   [1]: http://scn.sap.com/docs/DOC-26034
   [2]: http://wiki.sdn.sap.com/wiki/display/ABAP/Exporting+data+to+Excel+-+XML+to+the+rescue
   [3]: https://cw.sdn.sap.com/cw/groups/abap2xlsx
   [4]: http://www.plinky.it
   [5]: http://code.google.com/p/saplink/
   [6]: https://cw.sdn.sap.com/cw/docs/DOC-137513
   [7]: http://www.filipdujardin.be/
