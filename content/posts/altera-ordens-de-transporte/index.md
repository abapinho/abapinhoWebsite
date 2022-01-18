---
title: 'Altera ordens de transporte mesmo que não te deixem'
slug: altera-ordens-de-transporte
date: 2018-01-22 09:00:15
tags: [segredo, seguranca]
categories: [dicas]
wordpressId: 3923
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'liberar ordens sem autorização'
description: 'Aprende como alterar e liberar ordens de transporte num sistema de desenvolvimento mesmo que não tenhas permissõse para o fazer.'
---
Como todos nós sabemos os administradores de sistemas são pessoas más, insensíveis e crueis. A prová-lo está o incontornável [BOFH][1].

Nós, programadores ABAP, somos vítimas indefesas nas mãos destas criaturas maléficas.

Mas nem sempre somos obrigados a deixar-nos esmagar pelos dedos peludos dos seus caprichos.

<!--more-->

Um exemplo é a gestão de transportes. Por vezes, os malvados administradores de sistemas decidem que nós, programadores coitadinhos, não podemos ter acesso a liberar ou alterar ordens de transporte.

Eis o que devemos fazer para nos desviarmos dessa injusta proibição.

Para fazer tudo em TRs menos liberar a ordem principal:

  1. Mete um break-point na primeira linha da FM TR_AUTHORITY_CHECK_TRFUNCTION

  2. Faz o que queres fazer

  3. (o debug pára no break-point da função)

  4. Faz F7 para sair, altera o SY-SUBRC para 0 e faz F8 para continuar

  5. repete o ponto anterior as vezes que forem necessárias

Para liberar a ordem de transporte:

  1. Mete um break-point na linha 47 da FM TR_READ_PROJECT_SWITCH

  2. Libera a ordem de transporte

  3. A primeira vez que parar na linha 47 limpa a variável EV_PRJ_STATE

  4. Ri para dentro!

Obrigado Gianni pela dica.

O Abapinho saúda-vos.

   [1]: http://users.bestweb.net/~bofh/
