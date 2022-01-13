---
title: 'Finalmente encadeiam-se expressões'
slug: expressoes-encadeadas
date: 2013-04-15 09:00:33
tags: [estilo]
categories: [dicas]
wordpressId: 2232
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Finalmente, com o _SAP NetWeaver 7.0 Enhancement Package 2_ o ABAP começa a parecer-se com uma linguagem de programação normal.

Até já dá para encadear expressões, vê lá tu!

<!--more-->

É certo que o EhP2 já chegou há muito tempo, mas há muitos projectos que ainda não o têm. No meu, só chegou no mês passado. E mesmo aqueles que já o têm acredito que possam não fazer ideia das inúmeras possibilidades que o ABAP agora lhes põe à disposição.

Até aqui, quando querias encadear expressões umas nas outras, o ABAP dizia: _syntax error_. E lá tinhas tu de fazer as coisas às prestações. Tipo assim:


{{< highlight ABAP >}}
x = a + b
y = c + d
IF x > y.
  z = e + f.
  DO z TIMES.
    CONCATENATE g h INTO i.
  ENDDO.
ENDIF
{{< /highlight >}}

Agora (ou melhor dizendo, quando no teu projecto fizerem upgrade para o EhP2) já podes fazer assim:


{{< highlight ABAP >}}
IF a + b > c + d.
  DO e + f TIMES.
    i = g && h.
  ENDDO.
ENDIF.
{{< /highlight >}}

E em vez de teres de fazer isto:


{{< highlight ABAP >}}
DATA o_cl1 TYPE REF TO cl1.
o_cl1 = cl2=>da_cl1( ).
o_cl1->faz_algo( ).
{{< /highlight >}}

já podes fazer isto:


{{< highlight ABAP >}}
cl2=>da_cl1( )->faz_algo( ).
{{< /highlight >}}

E notaste ali em cima o && a faz as vezes do famigerado CONCATENATE? Há também inúmeras novidades na manipulação de _strings_ , mas isso fica para outro artigo.

Se ainda não tens o EhP2, vai sonhando. Se já o tens, faz experiências, porque há muitas possibilidades novas destes género.

Obrigado KayVee.INC pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/kayveeinc/4246957346/
