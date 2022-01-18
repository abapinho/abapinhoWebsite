---
title: 'Dar passos de bebé no debug'
slug: debugging-with-baby-steps
date: 2016-04-25 09:00:50
tags: [debug]
categories: [dicas]
wordpressId: 3511
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando fazes _debug_ usas a tecla F5 para avançar para a próxima instrução (ou entrar para dentro de uma sub-rotina). Mas imagina um IF com várias condições:


{{< highlight ABAP >}}
IF A = 1 AND B = 2 AND C = 3.
  WRITE 'Gosto da palavra glauco'.
ENDIF.
{{< /highlight >}}

Ao fazeres _debug_ àquele IF com F5 e alguma das expressões for falsa saltas logo para fora do IF e ficas sem saber qual delas falhou.

Mas o novo _debugger_ tem uma nova funcionalidade muito catita que te pode ajudar a entender melhor o que aconteceu ali.

<!--more-->

Chama-se "Incremento" e permite mudar para um modo em que o debug avança horizontalmente de expressão em expressão, permitindo-te descobrir facilmente qual delas falhou.

![stepsize][1]

Obrigado Sérgio Fraga pela dica.
Foto: [Denise P.S.][2] via [VisualHunt][3] / [CC BY-ND][4]

O Abapinho saúda-vos.

   [1]: images/stepsize.png
   [2]: https://www.flickr.com/photos/runnever/5542838628/
   [3]: https://visualhunt.com
   [4]: http://creativecommons.org/licenses/by-nd/2.0/
