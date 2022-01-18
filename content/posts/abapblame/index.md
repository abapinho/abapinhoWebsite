---
title: 'abapBlame - O meu novo projecto open source'
slug: abapblame
date: 2019-12-16 10:53:08
tags: [abapblame, abapgit, blame, git, opensource, tool]
categories: [noticias]
wordpressId: 4337
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['abap blame']
description: 'abapBlame é um projecto open source que tenta replicar em ABAP algum da funcionalidade da ferramenta git-blame: saber quem fez o quê e quando.'
---
O gestor de versões do ABAP é muito mau. Para além de todos os seus defeitos, ele não permite de forma fácil saber quem fez o quê e quando. O [git][1], que é um gestor de versões a sério, permite obter essa informação facilmente através da sua ferramenta [git-blame][2].

Devido a isto, muitos ABAPers habituaram-se a acrescentar o seu nome e data a todas as linhas de código que acrescentam, que apagam e que alteram. Assim, à medida que um programa ABAP vai sendo mais modificado, mais ilegível se vai tornando e mais difícil é navegar entre versões para saber quem fez o quê.

<!--more-->

Na esperança de contribuir para colmatar esta falta, criei um programa que tenta replicar alguma da funcionalidade do git-blame. Está em alfa (faltam funcionalidades), quase em beta. Mas já funciona. E é muito fácil de usar. Experimentem por favor. Espero que gostem. Todas as sugestões e correcções são bem-vindas.

Está aqui: <https://github.com/abapinho/abapBlame>

Se gostas do projecto e queres ajudar-me a dar-lhe mais visibilidade, por favor clica na estrela, na página github do projecto. Obrigado!

O Abapinho saúda-vos.

Obrigado pela foto, [chucknado][3].

   [1]: https://git-scm.com/
   [2]: https://www.git-scm.com/docs/git-blame
   [3]: https://visualhunt.co/a4/637c1e
