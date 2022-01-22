---
title: 'Salta a parede'
slug: salta-a-parede
date: 2012-08-06 09:00:31
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1877
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Baixa a música.
Fecha a porta.
Olha à volta.
Está alguém a olhar para ti?
Não estás a ser observado?
Nem câmaras de vigilância?
Então, podemos continuar.

<!--more-->

Concentra-te.

E faz o seguinte:

  1. Na SE38 abre o programa LSKEYF00, procura o FORM JUMP_THE_WALL e coloca um _breakpoint_ na linha que diz CHECK SY-SUBRC NE 0;

  2. Ainda na SE38 abre qualquer programa _standard_ que queiras alterar e carrega em "modificar". Aparecer-te-á o depurador (custa-me muito chamar depurador ao _debugger_ );

  3. Altera o valor da variável SY-SUBRC para 0 (zero) e depois prossegue com F8. Repete este passo tantas vezes quantas forem necessárias;

  4. Faz as alterações todas que queres fazer ao programa _standard_ ;

  5. Carrega no botão de activação. O sistema tornará a parar no _breakpoint_ e por isso terás de proceder novamente como no passo 3.

Já está. Alteraste um programa _standard_ de forma manhosa e ilegal e provavelmente agora terás de fugir porque o teu nome de utilizador ficou lá registado como a última pessoa que o alterou e mais cedo ou mais tarde vão descobrir o que fizeste.

Mete uns auscultadores com [esta música][1] e apanha um avião para [aqui][2].

Obrigado a José Faria por arriscar a sua vida partilhando esta dica.

E obrigado a [K. D.][3] pela foto.

O Abapinho saúda-vos.

   [1]: https://www.youtube.com/watch?v=U0gjwpMb-k8
   [2]: https://pt.wikipedia.org/wiki/Istambul
   [3]: https://www.flickr.com/photos/kaidolata/5139787330/
