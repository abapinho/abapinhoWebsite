---
title: 'Debug em janelas de diálogo modais'
slug: debug-em-popups
date: 2012-01-09 10:00:29
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1307
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Há determinados momentos em que não é possível fazer /H para iniciar o _debugger_. O caso mais comum é durante uma janela de diálogo modal (aquilo que os estrangeiros chamam de _popup_ ). Mas há uma forma simples, ainda que rocambolesca, para o conseguires:

<!--more-->

1\. Cria um ficheiro de texto com o seguinte conteúdo:
[FUNCTION]
Command=/H
Title=Debugger
Type=SystemCommand

2\. Grava o ficheiro numa pasta ou no ambiente de trabalho;

3\. Arrasta (aquilo que os estrangeiros chamam de _drag and drop_ ) o ficheiro de onde o gravaste para cima da janela de diálogo ao mesmo tempo que gritas ABRACADABRA.

E assim, desta forma estrambólica, como que por magia, se tiveres gritado, o modo de _debug_ será activado para teu regozijo.

É verdade que provavelmente já toda a gente conhece esta dica, mas é tão fundamental que me pareceu ser obrigação do Abapinho ensiná-la.

(Obrigado a [alandberning][1] pela foto)

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/14617207@N00/4609793276/
