---
title: 'Manter grupos de autorização de manutenção de tabelas'
slug: se54
date: 2012-11-19 09:00:24
tags: [ddic, sysadmin]
categories: [dicas]
wordpressId: 2071
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Há alguns projectos em que o grupo de autorizações associados à manutenção de tabelas é sempre &NC;&, ou seja, &N;ão cuidado&. É sinal de que lá é tudo amigo e ninguém faz mal a ninguém. Mas há outros projectos em que os grupos de autorização são levados a sério. O que não é sinónimo de dizer que estão organizados. A sério ou não, o normal é acabar tudo uma grande salgalhada onde ninguém sabe quem é que está autorizado a fazer o quê.

Esta dica talvez ajude.

<!--more-->

Quando crias ecrãs de manutenção de uma tabela Z, tens de lhe atribuir um grupo de autorizações. Isto é normalmente feito no ecrã de geração de diálogos de actualização (transacção SE55, normalmente acedida a partir da SE11).

![image][1]

Ficas agora a saber que há uma transacção onde podes ver todos os grupos de autorização associados a tabelas: SE54. Assim é muito fácil, por exemplo, fazer uma manutenção conjunta de todos os grupos de autorização associados às nossas tabelas.

![image][2]

Na SE54 escolhes a opção "Atrib.grp.autorizações" e vais parar a esta útil lista de tabelas:

![image][3]

Os ecrãs mostrados só têm uma tabela, mas se na selecção escolheres de Z a ZZZZZZZ, aparecerão todas as tabelas Z.

Isto é, penso eu, o sonho de qualquer administrador de sistema.

Obrigado a Sérgio Fraga pela dica.

E obrigado a [Beijing Patrol][4] pela foto.

O Abapinho saúda-vos.

   [1]: images/se54-1.png (se54-1)
   [2]: images/se54-2.png (se54-2)
   [3]: images/se54-3.png (se54-3)
   [4]: http://www.flickr.com/photos/securityguard/3575140798/
