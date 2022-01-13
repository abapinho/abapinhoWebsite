---
title: 'Concatenemos'
slug: concatenemos
date: 2015-01-05 09:00:35
tags: [estilo]
categories: [dicas]
wordpressId: 2963
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Temos duas variáveis:


{{< highlight ABAP >}}
DATA palavra1 TYPE string.
DATA palavra2 TYPE string.
DATA: frase TYPE string.

palavra1 = ‘isto’.
palavra2 = ‘aquilo’.
{{< /highlight >}}

E queremos concatená-las metendo entre elas a palavra ‘mais’ e, claro, separando-as por espaços.

<!--more-->

Forma 1 (a clássica):

{{< highlight ABAP >}}
CONCATENATE palavra1 ‘mais’ palavra2 INTO frase SEPARATED BY space.
{{< /highlight >}}

Forma 2, que não retém os espaços:

{{< highlight ABAP >}}
frase = palavra1 && ‘ ‘ && mais && ‘ ‘ && palavra2.
{{< /highlight >}}

Forma 3, rebuscada mas retendo os espaços:

{{< highlight ABAP >}}
frase = palavra1 && ‘ALT+255‘ && ‘mais' && ‘ALT+255‘ && palavra2.
{{< /highlight >}}

(em que ALT+255 é mesmo carregar no ALT e depois escrever 255)
(em rigor não fica lá um espaço, mas o aspecto é o mesmo)

Forma 4, que é o último grito nesta modalidade:

{{< highlight ABAP >}}
frase = | { palavra1 } mais { palavra2 } |.
{{< /highlight >}}

Aliás, este último até dá para invocar métodos pelo meio, tipo:

{{< highlight ABAP >}}
frase = | { o_livro->get_palavra( 1 ) } mais { o_livro->get_palavra( 2 ) } |.
{{< /highlight >}}

Obrigado Ricardo Monteiro pelo truque do ALT+255 e Sérgio Fraga por nos mostrares o futuro.
Obrigado halfrain pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/halfrain/9259704265
