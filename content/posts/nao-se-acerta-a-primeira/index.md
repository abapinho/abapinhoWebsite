---
slug: nao-se-acerta-a-primeira
title: Não se acerta à primeira
description: Não se acerta à primeira
date: 2025-04-07T09:00:00Z
tags: []
categories: [artigos]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---
No mundo do ABAP é costume fazer-se uma vez e nunca mais mexer. Como ficou, ficará para sempre. Que grande disparate.
<!--more-->
A verdade é que, seja o que for, seja quem for, é pouco provável que fique perfeito à primeira.

Como tal, podemos inferir que quase tudo o que foi feito em ABAP está imperfeito.

Eu defendo o contrário. Seja o que for que faças, parte do princípio de que é só um primeiro rascunho imperfeito.

A tua primeira versão até pode já funcionar, mas é pouco provável que tenhas acertado à primeira com os nomes das coisas e a estrutura do código. No dia seguinte, ou quando estiveres a fazer os primeiros testes, olhas de novo para o código e descobres um método com o nome no plural era na verdade singular, ou encontras uma classe está a tratar de duas coisas e por isso devia ser transformada em duas classes, ou ficas confuso com uma `LOOP` que está grande demais e [decides subdividi-lo][1] para ser mais fácil de entender ou, até, encontras uma forma melhor ou mais simples de fazer algo.

E agora tu dizes: "Ó Nuninho, tu deves ter muito tempo livre. Eu no meu projecto não tenho tempo para essas frescuras!" Sobre isso digo-te duas coisas: em primeiro lugar, rever e reescrever não tem de demorar muito tempo. Pelo contrário, se já seguires as normas do [Clean ABAP][2] e se usares [Eclipse ADT][3], em 5-10 minutos podes fazer muitas modificações muito radicais. E estes 5-10 minutos podem fazer toda a diferença. Fazer este tipo de retoques, correcções e reestruturações no Eclipse é muito rápido e indolor. E depois, se não acertares com os nomes dos métodos, classes e variáveis, o tempo que poupaste ao não os corrigir vai ser perdido no futuro por alguém (ou muitos alguéns) a tentar compreender a borrada que fizeste.

E ainda te digo uma terceira coisa: este exercício de olhar para o teu próprio código com espírito crítico, partindo do princípio de que o podes melhorar, vai-te permitir estar em constante evolução. A cada revisão ganhas experiência. Passado algum tempo passarás a fazer bem à primeira muitas coisas que antes fazias sempre mal. É, portanto, também uma forma de investires em ti.

O Abapinho saúda-vos.

[1]: {{< ref "split-loop" >}}
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md>
[3]: <https://abapinho.com/tags/eclipse/>
