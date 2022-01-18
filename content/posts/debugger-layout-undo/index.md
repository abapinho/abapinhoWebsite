---
title: 'Desfazer alterações no ecrã do depurador'
slug: debugger-layout-undo
date: 2016-05-02 09:00:56
tags: [debug]
categories: [dicas]
wordpressId: 3525
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Embora uma parte substancial do trabalho de um ABAPador seja depurar código, a maior parte dos ABAPadores que eu conheço investem muito pouco em explorar a ferramenta que o permite, o depurador. Talvez por terem passado anos a aturar um depurador arcaico e limitado. Mas o novo pode fazer muito mais do que lhe costuma ser pedido. E o Abapinho vai tentar ensinar como.

Hoje ensina-te apenas uma pequena tecla.

<!--more-->

Quando alteras a configuração das janelas do depurador, acrescentando uma vista, trocando outra, etc., podes desfazer essa alteração carregando em F3. O F3 no depurador volta para trás mas não sai da ferramenta, limita-se a desfazer as alterações de configuração do ecrã que entretanto tiveres feito.

Por exemplo, tens duas janelas configuradas:
[![debug1][1]][1]

Decides fechar a janela direita com a Pilha ABAP para veres melhor o código:
[![debug2][2]][2]

Mas depois tornas a precisar de ver a Pilha ABAP que tinhas fechado. Basta carregares em F3 para ela tornar a aparecer (não vou mostrar a imagem porque é igual à primeira, vais ter de confiar em mim).

Obrigado Sérgio Fraga pela dica.

O Abapinho saúda-vos.

   [1]: images/debug1.png
   [2]: images/debug2.png
