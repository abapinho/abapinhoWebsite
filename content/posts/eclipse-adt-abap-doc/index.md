---
slug: eclipse-adt-abap-doc
title: O Eclipse ADT dá bom uso aos ABAP Doc
description: O SAPGUI nem sequer sabe o que é ABAP Doc
date: 2024-04-29T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT ABAP Doc]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

ABAP Doc é uma forma excelente de integrar a documentação no código.

<!--more-->

## SAPGUI

O SAPGUI nem sabe o que isso é.

## Eclipse ADT

O Eclipse ADT não só permite criar ABAP Doc como é excelente a consumí-los. Ao contrário dos comentários nomais, que só são úteis se lá fores lê-los, os ABAP Doc permitem gerar documentação que vai ser realmente lida, mesmo à distância. Como expliquei no [post anterior][1], ao carregar na tecla `F2` em cima de uma palavra, seja ela uma classe, um método, uma variável ou outra coisa quaqluer, aparece uma pequena janelinha contextual com a _Code element information_ que dá uma série de detalhes sobre essa palavra: o tipo de dados, a descrição, e os ABAP Doc associados a ela.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.

[1]: {{< ref "eclipse-adt-f2" >}}
