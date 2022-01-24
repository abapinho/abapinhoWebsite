---
title: 'INSERT e APPEND com ASSIGNING FIELD-SYMBOL'
slug: insert-initial-line-into-table
date: 2012-11-05 09:00:11
tags: [estilo]
categories: [dicas]
wordpressId: 2038
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A verdade nua e crua, custe o que custar, é que as estruturas estão fora de moda. Agora o que está em voga é FIELD-SYMBOLS.

Quando fazes um LOOP a uma tabela interna, claro que também [usas ASSIGNING FIELD-SYMBOL em vez de INTO estrutura][1], não é?

Mas o que me lixava era o APPEND e o INSERT. Ainda não sabia como evitar usar uma estrutura para adicionar registos.

<!--more-->

E até há uns dias ainda fazia assim:


{{< highlight ABAP >}}
DATA: T_ABC TYPE STANDARD TABLE OF ZABC,
      W_ABC LIKE LINE OF T_ABC.

W_ABC-XYZ = 'Olá'.
APPEND W_ABC TO T_ABC.
{{< /highlight >}}

O que é uma pena porque, lá está, usar estruturas… enfim… é como ainda ter o Windows 7 quando o Windows 8 já saiu há mais de uma semana. Ou como ainda ouvir Madonna agora que já há Lady Gaga. Ou mesmo como ainda ouvir Lady Gaga agora que já há [Die Antwoord][2].

Mas tudo mudou quando recentemente o Sérgio Fraga me mostrou que afinal sempre dá para usar FIELD-SYMBOLS com INSERT e APPEND:


{{< highlight ABAP >}}
DATA: T_ABC TYPE STANDARD TABLE OF ZABC.
FIELD-SYMBOLS: <ABC> LIKE LINE OF T_ABC.

INSERT INITIAL LINE INTO TABLE T_ABC ASSIGNING <ABC>.
<ABC>-XYZ = 'Olá'.
{{< /highlight >}}

Obrigado Sérgio Fraga porque isto é tão bom, tão bom, que apetece encontrar já uma tabela a necessitar de que lhe insiram registos para ir a correr usar isto.

Obrigado [mscaprikell][3] pela foto.

O Abapinho saúda-vos.

   [1]: {{< ref "assigning-vs-into" >}}
   [2]: https://www.youtube.com/watch?v=AIXUgtNC4Kc
   [3]: https://www.flickr.com/photos/mscaprikell/18972629/
