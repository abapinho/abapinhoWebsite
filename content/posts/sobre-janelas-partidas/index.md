---
slug: sobre-janelas-partidsa
title: Sobre janelas partidas
description: Atenta na teoria das janelas partidas
date: 2025-06-09T09:00:00+01:00
tags: []
categories: [artigos]
keywords: [janela partida]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

A teoria das janelas partidas diz que, se uma janela de um prédio for partida e não for reparada rapidamente, as pessoas ficam tentadas a atirar pedras e partir as outras janelas.

<!--more-->

Pela mesma ordem de ideias, quando tens de alterar código já existente, se ele for uma porcaria pegada, se, para usar a metáfora das [janelas][1], estiver partido, é provável que te sintas menos motivado para criar código bonito nas alterações que lá fizeres.

O problema é que os sistemas SAP são geralmente prédios cheios de janelas partidas.

A solução que encontrei é criar um pacote novo (`ZCLEAN`?), completamente independente de todos os restantes, e anunciar à equipa que todo o código que for colocado por baixo desse pacote deverá seguir todas as boas práticas do projecto (que hoje em dia deverão estar alinhadas com o [Clean ABAP][2]). Presumindo que tens o [ABAP Package Concept][3] activado no sistema (deverias ter!), esse pacote deve ser definido como `STRUCTURE` ou, pelo menos, `MAIN`. Depois crias uma série de sub-pacote por baixo desse pacote onde ficará o novo código.

Não movas nada antigo e partido para esse pacote de topo. Em vez disso, cada vez que houver oportunidade para criar algum módulo novo ou reescrever um antigo, cria [debaixo dele um sub-pacote][4] para esse código novo.

Podes depois configurar o ATC para correr um job diário que verifica o código de todos os pacotes debaixo desse novo pacote. Depois é monitorizar os resultados do ATC e garantir que os problemas descobertos (novas janelas partidas) são rapidamente resolvidos para não deixar a coisa descambar outra vez.

Esta é, para mim, a melhor forma de tentar que uma equipa de desenvolvimento abandone os vícios antigos e comece a programar sem partir mais janelas.

O Abapinho saúda-vos.

[1]: <https://pt.wikipedia.org/wiki/Teoria_das_janelas_quebradas>
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md>
[3]: {{< ref "pacotes-2-0" >}}
[4]: {{< ref "arvore-de-pacotes-z" >}}
