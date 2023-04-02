---
slug: empacoto-tudo
title: Empacoto tudo o que mexe
description: Cada desenvolvimento deve estar no seu pacote
date: 2023-04-03T09:00:00+01:00
tags: []
categories: [artigos]
keywords: [pacotes]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Eu empacoto obsessivamente tudo o que mexe.

<!--more-->

Se vou fazer um desenvolvimento de raiz é óbvio que a primeira coisa a fazer é criar um pacote encapsulado só para ele.

Mas sempre que faço uma alteração a um desenvolvimento existente, por muito pequena que seja, também tento empacotá-lo.

## O que eu faço

1. Crio um pacote com o nome do desenvolvimento
2. Coloco-o como sub-pacote do pacote onde o desenvolvimento está actualmente
3. Movo para o novo pacote todos os objectos que encontrar pertencentes a esse desenvolvimento (programas, includes, classes, grupos de função, transacções, objectos DDIC, etc)
4. Se o _ABAP Package Concept_ estiver activado no sistema, uso a ferramenta _Package Check_ para me ajudar a encontrar outros objectos menos óbvios e verificar se alguns são partilhados entre outros desenvolvimentos.
5. Só agora, com o desenvolvimento empacotado, implmento a alteração necessária.

## Risco ZERO

- Mover os objectos de um pacote para o outro não tem risco;
- Se me esquecer de mover algum objecto para o novo pacote não há consequências;
- Se algum dos objectos movidos for utilizado por outro desenvolvimento também não há problema.

Ao fazer isto sei que estou a deixar o sistema ligeiramente mais organizado do que o encontrei.

O Abapinho saúda-vos.
