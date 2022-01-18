---
title: 'CONCATENATE LINES OF itbl'
slug: concatenate-lines-of-itbl
date: 2015-10-05 09:00:50
tags: [estilo]
categories: [dicas]
wordpressId: 3222
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Se queres serializar um conjunto de _strings_ que tens guardadas numa tabela interna tens duas formas de o fazer. Uma ranhosa e outra cheia de estilo.

<!--more-->

Comecemos por definir os dados:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_output,
         field1 TYPE char10,
         field2 TYPE char10,
         field3 TYPE char10,
       END OF ty_output.

DATA: t_output TYPE TABLE OF ty_output.

APPEND INITIAL LINE TO t_output ASSIGNING <output> .
<output>- field1 = 'a1' .
<output>- field2 = 'a2' .
<output>- field3 = 'a3' .
APPEND INITIAL LINE TO t_output ASSIGNING <output> .
<output>- field1 = 'b1' .
<output>- field2 = 'b2' .
<output>- field3 = 'b3' .
{{< /highlight >}}

Temos agora uma tabela interna com uma estrutura de 3 campos alfa-numéricos preenchida com 2 linhas de dados.

O objectivo: construir uma linha com tudo serializado: a1 a2 a3 b1 b2 b3.

Se fores uma pessoa ranhosa que ouve música foleira, não tem gosto a vestir e gosta de ir jantar ao Macdonalds fazes assim:

{{< highlight ABAP >}}
LOOP AT t_output ASSIGNING <output>.
  CONCATENATE opcao1
              <output>-field1
              <output>-field2
              <output>-field3
    INTO opcao1 SEPARATED BY space .
ENDLOOP.
CONDENSE opcao1.
{{< /highlight >}}

Se, pelo contrário, fores uma pessoa sofisticada, que só ouve música daquela muita boa, veste roupa de alta categoria e se recusa a levar à boca comida que não seja molecular de uma ponta à outra então fazes assim:

{{< highlight ABAP >}}
CONCATENATE LINES OF t_output INTO opcao2 SEPARATED BY space.
CONDENSE opcao2.
{{< /highlight >}}

Obrigado Leandro Gambim pela dica.

Obrigado Nick Thompson pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/pelegrino/8111801072
