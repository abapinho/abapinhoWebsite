---
title: '$PACOTES locais'
slug: pacotes-locais
date: 2016-11-07 09:00:37
tags: [estilo, segredo]
categories: [artigos]
wordpressId: 3595
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['pacotes locais']
description: 'Afinal há mais para além do $TMP. Aprende aqui como criar pacotes locais para os objectos que não pretendes que sejam transportados.'
---
Todos os objectos criados em SAP têm de estar associados a um pacote.

Até recentemente, quando eu queria fazer um teste rápido criava o objecto no pacote $TMP. Tinha assim a garantia de este nunca viria a ser transportado.

Mas por vezes há necessidade de criar coisas no sistema de desenvolvimento que não pretendemos nunca vir a transportar mas que queremos que lá existam eternamente. Como o ZSAPLINK e o abapGit, por exemplo. Mas se as associarmos todas as pacote $TMP fica uma valente confusão.

<!--more-->

A solução que tinha encontrado para isto passava por criar um pacote para cada uma destas ferramentas, limpando o campo “transport layer” do pacote. Assim tinha a garantia de que nada neste pacote será transportado.

Mas mesmo assim pede uma ordem de transporte, ainda que esta nunca venha a servir para nada. Como agora no meu cliente deixei de ter permissões para criar/apagar ordens de transporte (porque tudo é gerido pelo Solution Manager) a coisa complicou.

Como é que eu agora vou fazer a gestão dos objectos locais?

Dizem que a necessidade é a mãe da invenção. Mas neste caso a necessidade foi a mãe da descoberta.

Descobri que afinal o pacote $TMP não é o único pacote local. Todos os pacotes começados por $ our por T são, por definição, pacotes locais e não estão sequer associados a uma ordem de transporte. Ou seja, sem os espartilhos do Solution Manager.

Maravilha.

Assim é simples: criei um pacote $DEVTOOLS e sempre que necessário crio outro $PACOTE por baixo deste.

O Abapinho saúda-vos.

_Actulizado em 2016-11-09 para acrescentar que os pacotes locais também podem começar por T. Obrigado Custódio de Oliveira!_
