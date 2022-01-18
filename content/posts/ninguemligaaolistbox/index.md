---
title: 'Ninguém liga ao LISTBOX'
slug: ninguemligaaolistbox
date: 2012-10-29 09:00:07
tags: [sapgui, ui]
categories: [dicas]
wordpressId: 2027
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Por alguma razão misteriosa, a LISTBOX é uma funcionalidade pouco utilizada nos ecrãs de selecção do SAP. E, no entanto, na web está por todo o lado. Vá-se lá saber porquê.

Caro leitor, proponho que atentes nas suas vantagens:

<!--more-->

  * sempre que a lista de valores possíveis não for muito extensa, usar uma LISTBOX evita o F4 pois os valores estão já disponíveis no ecrã

  * a descrição da opção escolhida é também apresentada além do código, aumentando a legibilidade

Tão simples:


{{< highlight ABAP >}}
TABLES: kna1.
PARAMETERS: p_land1 LIKE kna1-land1 AS LISTBOX
                    VISIBLE LENGTH 25 DEFAULT 'PT' OBLIGATORY.
{{< /highlight >}}

Depois fica assim:
![][1]

E tu, já usaste o LISTBOX?

O Abapinho saúda-vos.

   [1]: images/listbox.png (listbox)
