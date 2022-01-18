---
title: 'Erro de sintaxe ao retornar tabela num método'
slug: erro-ao-retornar-tabela-num-metodo
date: 2013-10-21 09:00:37
tags: []
categories: [dicas]
wordpressId: 2451
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando, num método de uma classe, crias um parâmetro de retorno que é um TABLE TYPE baseado num tipo declarado na própria classe, às vezes aparece um erro que diz:

"Os parâmetros RETURNING devem ser completamente tipificados."

<!--more-->

O misterioso é que isto só acontece no parâmetro de retorno. Se usares o EXPORTING em vez do RETURNING já funciona.

A definição do tipo usado no parâmetro é, por exemplo assim:


{{< highlight ABAP >}}
 TYPES: BEGIN OF ty_s_info,
           kunnr TYPE kunnr,
           name1 TYPE name1,
         END OF ty_s_info,
         ty_t_info TYPE STANDARD TABLE OF ty_s_info.
{{< /highlight >}}

Durante muito tempo não percebi o que isto queria dizer e a minha solução foi usar EXPORTING ou definir a TABLE TYPE necessária na SE11. E assim já não tinha problemas. Mas no outro dia fartei-me disso, irritei-me, os meus olhos raiaram de sangue, dei um murro no ecrã e decidi tentar ir mais a fundo nesta questão.

Para dizer a verdade não tive de ir muito fundo porque é simples.

É que de facto, na perspectiva do SAP, a tabela TY_T_INFO não está completamente definida. Falta definir a chave. A solução é fazer algo deste tipo:


{{< highlight ABAP >}}
TYPES: ty_t_info TYPE SORTED TABLE OF ty_s_info WITH UNIQUE KEY kunnr.
{{< /highlight >}}

E pronto, acabou-se o erro.

Obrigado a C.G. Megee pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/88441986@N06/8075257531/in/photostream/
