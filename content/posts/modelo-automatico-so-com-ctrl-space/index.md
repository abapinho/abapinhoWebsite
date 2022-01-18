---
title: 'Modelo automático só com CTRL-SPACE'
slug: modelo-automatico-so-com-ctrl-space
date: 2014-09-22 09:00:04
tags: [sapgui]
categories: [dicas]
wordpressId: 2891
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Claro que já conheces o botão “Modelo” no editor de ABAP que permite introduzir automaticamente modelos para módulos de função, chamadas a métodos e outros.

Mas o novo editor agora cresceu um bocadinho (já só está 10 anos atrasado em relação ao Eclipse em vez de 20) e já permite completar automaticamente alguns comandos através do atalho CTRL-SPACE.

<!--more-->

Já deves usar esta funcionalidade para evitar ter de escrever o nome inteiro de comandos ou variáveis num programa. Mas vou aqui mostrar-te que o rapazito é ainda mais esperto do que parece. Senão repara.

Primeiro declara uma instância de uma classe qualquer e escreve o nome da variável com um ponteiro para um método:

[![pattern1][1]][1]

Tens o cursor no final da linha, após o ponteiro? Então faz CTRL-SPACE:

[![pattern2][2]][2]

Aparece-te uma lista dos métodos da classe. Porreiro. Mas nada de revolucionário. Escolhe um e faz ENTER. E depois faz CTRL-SPACE pela segunda vez:

[![pattern3][3]][3]

Aparece-te o método que já lá tens. À primeira vista parece inútil. Mas experimenta fazer ENTER:

[![pattern4][4]][4]

Apareceu-te o interface do método. Papinha toda feita. Bom, não?

Obrigado Micael Reis pela dica.

Obrigado Ben Sutherland pela [foto][5].

O Abapinho saúda-vos.

   [1]: images/pattern1.png
   [2]: images/pattern2.png
   [3]: images/pattern3.png
   [4]: images/pattern4.png
   [5]: https://www.flickr.com/photos/bensutherland/5587949321/in/photolist-9vMGDP-eDCTs-4FzBKd-2dpra-aViSN8-7jR3G8-2dTZyY-dpTvFq-q9ort-5e914x-8D678y-9xhJFn-5e8Zw6-8udEMa-8udEQa-9xhJZk-9xkJ23-9xhJLp-6RsN15-bUzaG-2UMLve-dB6Bv1-7zjGac-eCYtv6-eCYrfH-eD5xLU-e6cYWu-4A6dyX-7osvBs-7orBcT-eabkR9-cZVtBE-8D678N-8D678J-9vQJxJ-8ugL4d-8ugKZ1-bUzfV-df6gvt-df6haj-df6gJK-44LjvV-oxYQA7-eD5yuS-eD5wCm-eD5vVG-eD5vpS-7ooAQ4-7ooBov-a7p824
