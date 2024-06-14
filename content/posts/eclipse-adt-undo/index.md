---
slug: eclipse-adt-undo
title: No Eclipse ADT podes sempre fazer undo
description: No Eclipse ADT podes sempre fazer undo
date: 2024-06-17T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT undo]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Diz-se: Não voltes onde foste feliz. Mas a verdade é que, em muitos casos, se pudesses voltar atrás, voltavas.

<!--more-->

## No SAPGUI

Mas no SAPGUI não tens muita sorte. Logo para começar, ainda que o editor de ABAP consiga fazer undo, assim que gravas ou activas algo, ele limpa o histórico. Ora, como para saltares de um método para o outro tens de o gravar, sempre que o fizeres, já não há volta a dar: undo caput. Em suma, o undo no SAPGUI não presta para nada.

Para minimizares um pouco o problema podes mudar para o modo _source code_ que sempre te mostra a classe toda de uma vez e assim ao menos consegues trabalhar em vários métodos ao mesmo tempo. Mas mal graves alguma coisa, puxas o autoclismo ao undo.

Mas a solução mais simples para resolveres o problema é simples: não uses o SAPGUI para programar.

## No Eclipse ADT

No Eclipse ADT é simples: quando precisares de fazer undo, fazes undo. Mesmo que tenhas gravado e activado e mesmo que tenhas trocado para outra janela de outra classe. Seja um minuto depois ou no dia seguinte. Funciona como é suposto.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.
