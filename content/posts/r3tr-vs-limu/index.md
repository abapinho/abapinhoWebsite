---
title: 'R3TR vs LIMU'
slug: r3tr-vs-limu
date: 2013-05-06 23:00:21
tags: [sysadmin]
categories: [artigos]
wordpressId: 2259
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Espatifaste o sistema produtivo: fizeste uma alteração a um método de uma classe (ou a uma função, vá). Outra pessoa faz outra alteração a outro método da mesma classe (ou a outra função do mesmo grupo de funções, vá) e grava-a num transporte diferente. Quando transportas as tuas alterações para produtivo descobres que a classe (ou função, vá) agora tem um erro de sintaxe porque as alterações tinham dependências. Descobres também que agora, e até resolveres este problema, todos os teus colegas funcionais te odeiam.

<!--more-->

Uma forma de resolver o problema é ir à cata das outras alterações que foram feitas e transportá-las também. Corres o risco de demorar horas a passar as coisas aos bocadinhos, isto se não deres em doido antes.

Mas há uma forma mais simples e eficaz: transportar a classe toda.

E agora uma aulinha teórica sobre ordens transportes. Concentra-te:

As entradas no catálogo de objectos são constituídas por 3 partes:

  1. ID-Programa

  2. Objecto

  3. Nome do objecto

A primeira parte, o ID-Programa, normalmente é uma de duas coisas: R3TR ou LIMU. E é entendendo o que significa cada um que reside a diferença entre conseguires resolver o problema e tornar a ter amigos ou apontarem-te como culpado da falência empresa.

Quando crias uma classe (ou grupo de funções, vá) ela é registada no catálogo de objectos da seguinte forma:

    R3TR CLAS ZCLXXXX (em que ZCLXXXX é o nome da classe)

    R3TR FUGR ZYYYY (em que ZYYYY é o nome do grupo de funções)

Seja o que for que cries nessa classe (ou grupo de funções) enquanto não liberares esta ordem de transporte, mais nenhuma entrada será acrescentada à lista de entradas de catálogo da ordem de transporte.

Mas agora experimenta liberar este transporte e fazer uma alteração a um método ou função ou outra coisa qualquer dessa classe ou grupo de funções. Vais constatar que as entradas são agora do tipo LIMU:

    LIMU METH ZCLXXXX AAAA (em que AAAA é o nome do método)

    LIMU FUNC BBBB (em que BBBB é o nome do módulo de função)

Agora presta bem atenção à descrição do R3TR e do LIMU:

  * R3TR - Objeto total

  * LIMU - Sub-objecto do ambiente de desenvolvimento

Eureka! Aqui reside a solução para todos os teus problemas:

Sempre que estiveres com problemas por uma classe ou grupo de funções estar inconsistente em qualidade ou produtivo, basta criares uma entrada do tipo R3TR numa ordem de transporte com o nome dessa classe ou grupo de funções. Quando transportares a ordem terás a garantia de que a totalidade do objecto será transportada: no caso da classe, as implementações de todos os métodos bem como as declarações públicas, protegidas e privadas. No caso do grupo de funções, a implementação e definição de todos módulos de função bem como os includes associados.

Segue este conselho e rapidamente conseguirás recuperar os amigos que perdeste.

O único cuidado que tens de ter é garantir que todos os métodos ou funções que vais passar estão realmente prontos para passar para produtivo, para não arranjares num lado e estragares no outro.

Obrigado cobra_55 pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/cobra55/6876086286/
