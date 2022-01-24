---
title: '<!--:pt-->Onde é que eu vi aquilo?<!--:-->'
slug: busca-abap
date: 2009-11-04 04:09:36
tags: []
categories: [dicas]
wordpressId: 206
draft: false
---
A pesquisa de objectos em ABAP e por todo o SAP é normalmente feita de duas formas: listando objectos de um tipo através de _search helps_ ou procurando objectos em que um determinado objecto é usado, através da opção _where used_.

Só que às vezes o que buscamos não se trata de um objecto mas sim de uma frase qualquer ou mesmo um comentário que sabemos existir no código mas não fazemos ideia de onde.

Quando é assim pode usar-se o programa RPR_ABAP_SOURCE_SCAN ou, se este não existir, o programa RSRSCAN1. Ambos permitem procurar cadeias de caracteres em todo o código fonte ABAP.

Obrigado a [Pedro Lima][1] pela dica.

Actualização: O Gustavo Pessoa acrescenta que a transacção EWK1 permite também pesquisar texto em programas.

O Abapinho saúda-vos.

   [1]: https://apolemia.blogspot.com/
