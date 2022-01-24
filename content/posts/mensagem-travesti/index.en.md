---
title: 'The drag queen message'
slug: mensagem-travesti
date: 2011-10-31 10:00:55
tags: [estilo]
categories: [dicas]
wordpressId: 1091
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
The AT SELECTION-SCREEN modules of a report can throw error messages and send you back to the selection screen. But once you get past the START-OF-SELECTION, if you get an error message, the program ends. The solution to getting an error and returning to the selection screen, is to disguise the message:


{{< highlight ABAP >}}
START-OF-SELECTION.
  IF condicao_desejada.
    MESSAGE S208(00) with 'Erro!' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.
  WRITE 'Olá, eu sou o resto do programa'.
{{< /highlight >}}

The type S message pretended to be type E. It seemed to be E - but it was joking.

If you try it out, you’ll see that the system returns an error but it does not exit the program completely; it goes back to the selection screen and does not run the rest of the program (because of the EXIT).

Thanks to Sérgio Lopes for this tip.

And thanks to Tiago Celestino for the photo

Greetings from Abapinho.
