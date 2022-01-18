---
title: 'Pára lá mas não já'
slug: para-la-mas-nao-ja
date: 2014-02-03 09:00:56
tags: [debug]
categories: [dicas]
wordpressId: 2516
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Estás a fazer um LOOP AT a uma tabela com 1000 linhas e sabes que a linha que te interessa é a 853. Até há pouco tempo tinhas duas hipóteses: ou carregavas 852 vezes na tecla F8, arriscando-te a carregar 853 e teres de começar tudo de novo ou então criavas um _watchpoint_ com a condição SY-TABIX = 852 ou lá perto e rezavas para que funcionasse.

Agora tens uma terceira alternativa.

<!--more-->

Uma alternativa bem mais simples e infalível. Agora já é possível configurar um break-point normal para só parar após N ocorrências. No separador "Ptos.par./watchpts" do depurador, há uma coluna chamada "Ignorar (número)" que define o número de vezes que o _break-point_ é ignorado antes de parar.

[![break-point-skip][1]][1]

E se reparares mesmo ao lado está uma coluna para criares condições. Se usares estas coisas deixas de ter de usar _watchpoints_. Nunca gostei deles.

Outra grande vantagem de usar esta técnica em vez dos antigos _watchpoints_ é que nestes últimos não dava para usar _field-symbols_ nas condições e assim já dá. Bom, não?

Obrigado Sérgio Fraga pela dica.

E obrigado Dirk Knight pela [foto][2].

O Abapinho saúda-vos.

   [1]: images/break-point-skip.jpg
   [2]: “http://www.flickr.com/photos/dkshots/5331436372”
