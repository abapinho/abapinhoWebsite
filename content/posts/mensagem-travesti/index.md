---
title: 'A mensagem travesti'
slug: mensagem-travesti
date: 2011-10-31 10:00:55
tags: [estilo]
categories: [dicas]
wordpressId: 1091
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Nos módulos AT SELECTION-SCREEN de um REPORT é-te possível lançar mensagens de erro e voltar ao ecrã de selecção. Mas uma vez que passes do START-OF-SELECTION, se lançares uma mensagem de erro, o programa termina. A solução para dar um erro e, ainda assim, regressar ao ecrã de selecção, é travestir a mensagem:


{{< highlight ABAP >}} 
START-OF-SELECTION.
  IF condicao_desejada. 
    MESSAGE S208(00) with 'Erro!' DISPLAY LIKE 'E'. 
    EXIT. 
  ENDIF. 
  WRITE 'Olá, eu sou o resto do programa'. 
{{< /highlight >}}

A mensagem do tipo S mascarou-se de E. Parece que É, mas não É.

Se experimentares vais ver que o sistema dá erro mas não sai completamente do programa; Volta ao ecrã de selecção e não corre o resto do programa (por causa do EXIT).

Obrigado Sérgio Lopes pela dica.

(E obrigado [Tiago Celestino][1] pela foto)

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/tcelestino/2858606793/in/photostream/
