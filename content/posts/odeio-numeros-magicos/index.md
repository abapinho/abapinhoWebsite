---
slug: odeio-numeros-magicos
title: Odeio números mágicos
description: Porque é que toda a gente em SAP adora números mágicos?
date: 2026-04-20T09:00:00
tags: [magicos]
categories: [artigos]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quem trabalha em SAP acha normal que tudo seja representado por números e códigos obscuros que não significam nada. Mas não tem de ser assim. Pára com isso! Cria códigos que os seres humanos entendam por favor.

<!--more-->
Ainda recentemente tive de trabalhar numa funcionalidade já implementada que atribuía *roles* a utilizadores: *Leader*, *electrician*, *welder* e mais alguns. Era algo deste género:

|Código|Descrição|
|-|-|
|`01`|leader|
|`02`|electrician|
|`03`|welder|

Quem olha para estes códigos nas tabelas, ou já esta muito habituado a eles ou fica aos papéis. Mas há necessidade disto?

Eu sei que isto é considerado normal no mundo do SAP. A minha pergunta é: porquê? Porquê?! Não vivemos em 1984 em que havia falta de espaço e cada caracter extra saía caro. Hoje há kilobytes para dar e vender. Então porquê? É porque estás habituado? Porque te parece melhor? Porque gostas de coisas obscuras? Pára com isso!

Neste caso a minha missão era só acrescentar algumas funcionalidades extra a esta funcionalidade. Mas, neste caso, o problema não era só os números mágicos. Para piorar, quando um utilizador tinha mais do que um *role*, em vez de listar os dois, alguém achou boa ideia usar outros números mágicos para representar as combinações de *roles*:

|Código|Descrição|
|-|-|
|`04`|leader+electrician|
|`05`|leader+welder|

Esta ideia é tão má que decidimos deitar tudo fora e fazer de raíz, criando uma tabela para relacionar utilizadores e *roles*. Mas desta vez sem números mágicos, claro:

|Código|Descrição|
|-|-|
|`LEADER`|leader|
|`ELECTRO`|electrician|
|`WELDER`|welder|

Usei `CHAR10` em vez de `NUM02`. Pior? Não. Melhor? Sim!

Vamos fazer uma experiência: sem olhar para a tabela lá em cima diz-me lá o que representa o código `02`. Ainda te lembras? E agora diz-me lá se sabes o que representa o código `LEADER`? Se calhar até desconfias, certo? Claro!

O SAP já tem suficientes coisas obscuras. Não inventes mais desnecessariamente.

Obrigado Janan pela [foto][1].

O Abapinho saúda-vos.

[1]: <https://unsplash.com/photos/gray-rabbit-on-brown-wood-log-302xfiIGOfE>
