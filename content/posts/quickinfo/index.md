---
title: 'QUICKINFO: dica sobre como dar dicas'
slug: quickinfo
date: 2013-06-03 09:00:46
tags: [ui]
categories: [dicas]
wordpressId: 2298
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Esta dica vem, no meu entender, uns anos tarde demais, visto ser já raro usar o comando WRITE para escrever directamente coisas para o ecrã. É, portanto, digamos assim, uma dica retro. Uma dica _vintage_. Mas vamos supor que estamos ainda no século XX a debater-nos com o comando mais barroco do ABAP, o WRITE.

Imagina-te então, sentado à frente do SAP, a ouvir Pearl Jam, com uns auscultadores de cor preta, e a escrever WRITEs de uma série de valores no ecrã sobre os quais gostavas que o utilizador pudesse ter mais informação. Mas não tens espaço no ecrã para lhe dar essa informação. A SAP pensou nisso:


{{< highlight ABAP >}}
WRITE: sy-datum QUICKINFO 'Data de hoje' .
{{< /highlight >}}

Quando corres o programa parece que não faz diferença nenhuma, mas quando paras o rato em cima do valor, aparece um quadradinho com o texto auxiliar. Muito à semelhança das _tooltips_ em HTML:

![quickinfo][1]

Também podes usar isto para deixar mensagens secretas aos utilizadores. Ou para fazer caças ao tesouro.

Era bom ter sabido disto nos tempos em que dava jeito.

Obrigado See-ming Lee pela [foto][2].

O Abapinho saúda-vos.

   [1]: images/quickinfo.jpg
   [2]: https://www.flickr.com/photos/seeminglee/3929959851/
