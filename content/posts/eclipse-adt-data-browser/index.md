---
slug: eclipse-adt-data-browser
title: O Data browser do Eclipse ADT é bem melhor que a SE16N
description: eclipse-adt-data-browser
date: 2024-09-30T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT data browser]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

As ferramentas que o SAP disponibiliza para ver o conteúdo de tabelas da base de dados sempre foram muito ranhosas.

<!--more-->

## No SAPGUI

A melhor forma de ver o conteúdo de uma tabela da base de dados é usando a transacção `SE16N` que provavelmente foi actualizada pela última vez no mesmo século em que os irmãos Wright inventaram o aeroplano. Permite-te escolher os campos de output, filtrar os campos por conteúdo e pouco mais. Nem ordenar podes. Se quiseres algo mais sofisticado tens de exportar o resultado para um ficheiro e depois importá-lo no Excel.

## No Eclipse ADT

Quando fazes `F8` numa tabela, abre-se um novo separador com o _Data browser_. Este permite-te filtrar pelos campos, e escolher os campos de output, oferecendo um interface muito mais sofisticado. No entanto, ainda não viste nada. Um dos botões do _Data browser_ é o _SQL Console_ que abre uma consola num novo separador com o comando SQL usado para te mostrar aqueles dados. A partir daqui podes editar o SQL à vontade e imediatamente ver o seu resultado. Ou seja, podes facilmente fazer `INNER JOIN`s e tudo o mais que a base de dados e o SQL permitirem.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.
