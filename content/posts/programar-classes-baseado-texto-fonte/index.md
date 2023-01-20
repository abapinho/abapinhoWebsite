---
title: 'Programar classes baseado em texto fonte'
slug: programar-classes-baseado-texto-fonte
date: 2016-05-23 11:08:44
tags: [sapgui]
categories: [dicas]
wordpressId: 3550
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Estando habituado a programar em Java e C++, a forma como a SE24 obriga a navegar entre as várias partes de uma classe e o facto de cada método estar isolado no seu próprio include ao início fez-me muita confusão. Mas porque é que a SAP complica sempre tudo? Acabei por habituar-me.

A dado momento a SE24 passou a permitir a opção _Basedo em texto fonte_ que mostra a classe e os métodos todos ligados em texto corrido. Mas por alguma razão que nunca atinei com aquilo.

<!--more-->

[![baseado_em_texto_fonte][1]][1]

E hoje penso ter entendido porquê. Porque não conhecia nenhuma forma de navegação que me permitisse saltar directamente para a implementação ou definição de um determinado método, algo que sempre existiu nos IDEs de Java, C++ e etc.

Mas afinal na SE24 também existe. Carregas em CTRL-F5 (ou num botãozinho na barra de ferramentas) e salta esta janela:

[![navegador_de_classe][2]][2]

Agora sim, posso finalmente começar a programar em ABAP "baseado em texto fonte".

E para que se torne um hábito podes alterar as configurações para que este passe a ser o modo pré-definido.

O Abapinho saúda-vos.

   [1]: images/baseado_em_texto_fonte.jpg
   [2]: images/navegador_de_classe.jpg
