---
slug: eclipse-adt-open-in-project
title: No Eclipse ADT abres o mesmo objecto noutro cliente
description: eclipse-adt-open-in-project
date: 2024-10-07T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse Open in project]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Historicamente foi sempre impossível saltar de um sistema SAP para o outro sem perder o contexto. Agora já dá.

<!--more-->

## No SAPGUI

Estás tu muito bem na SE24 a desenvolver um programinha todo lindo no mandante de desenvolvimento que é o 100. Agora queres testá-lo com um _break-point_ na linha em que estás no editor mas o mandante que tem dados é o 200. O que é que fazes? Vais ao SAPLogon, abres uma nova sessão no mandante 200 do mesmo servidor, abres a SE24, navegas para a classe onde estavas, navegas até à linha desejada e activas um _break-point_ nela.

## No Eclipse ADT

Estás todo contente a editar a classe, limitas-te a fazer botão direito e escolhes a opção _Open in project..._ e escolhes o 200. Aparece um novo separador com a classe no mandante 200 e já com o _break-point_ na linha desejada porque já o tinhas metido ontem e ele ainda lá está.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.
