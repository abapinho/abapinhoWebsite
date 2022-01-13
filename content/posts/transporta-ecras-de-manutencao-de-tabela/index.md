---
title: 'Transporta uma tabela local com os ecrãs de manutenção'
slug: transporta-ecras-de-manutencao-de-tabela
date: 2018-10-01 12:47:47
tags: [segredo, sysadmin]
categories: [dicas]
wordpressId: 4037
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Criaste uma tabela e os seus ecrãs de manutenção como objectos locais.

Quando mais tarde te arrependeres e decidires transportar a tabela, como fazes para os transportar também os ecrãs de manutenção?

Transportar só o grupo de funções não chega, vai dar erro.

<!--more-->

Tens de transportar mais umas coisas:


{{< highlight ABAP >}}
R3TR | FUGR | nome do grupo de funções
R3TR | TOBJ | ZTABS (o nome da tabela com um S à frente)
R3TR | TABU | TVDIR
R3TR | TABU | TDDAT
{{< /highlight >}}

Mas ainda melhor é escolheres esta ferramenta que faz o mesmo mas de forma automática:


{{< highlight ABAP >}}
SE54 > Utilities > Total Transport
{{< /highlight >}}

Obrigado Ricardo Monteiro pela dica.

Foto: [Wanderin' Weeta][1].

O Abapinho saúda-vos.

   [1]: https://visualhunt.com/author/7f395d
