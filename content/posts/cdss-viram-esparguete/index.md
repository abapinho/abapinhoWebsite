---
slug: cdss-viram-esparguete
title: As CDSs tendem a virar esparguete
description: As CDSs presta-se a código esparguete
date: 2026-10-19T09:00:00+01:00
tags: [CDS]
categories: [artigos]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---
Eu sei que toda a gente adora CDSs e que é pecado dizer mal delas, mas deixem-me desabafar por favor.
<!--more-->

Compreendo o encanto e gosto da ideia. São muito mais poderosas que SQL e permitem fazer imensa magia. Mas têm alguns problemas muito graves que as fragilizam:

## Não são _agile_

Nos dias que correm é fundamental que o código e as ferramentas à volta dele sejam flexíveis e capazes de lidar com a necessidade de mudança. Uma das maiores (r)evoluções do Eclipse ADT em relação à SE24 é permitir renomear classes, métodos, parâmetros e variáveis com enorme facilidade e risco muito baixo. É raro acertar com o nome certo das coisas à primeira e assim consigo facilmente mudar de ideias a meio do processo. Torna também fácil **adaptar os nomes** a novas realidades que entretanto surjam. Já uma CDS... esquece: não dá para renomear. tens de criar uma nova e depois ir à mão modificar cada sítio onde é chamada e finalmente apagar a antiga. Na práctica o que acontece é que acaba por ficar para sempre com o primeiro nome que lhe foi dado, mesmo quando este possa não ser o melhor.

## É tudo global

E não há forma de encapsular código. Não existe o conceito de público e privado como nos métodos. É tudo público e acessível. Por consequência, código que deveria ser específico para uma situação particular e que não deveria pode ser reutilizado acaba disponível e torna-se ruído no meio de tudo o resto. É certo que poderíamos usar O [ABAP Package Concept][1] e um _Package Interface_ para tornar algumas CDSs privadas a um pacote, mas acho que todos concordamos que o _ABAP Package Concept_, embora conceptualmente excelente, na práctica é tão rígido e difícil de usar que acaba por atrapalhar mais do que ajuda.

## Sem constantes

Numa CDS não consegues fazer referência a constantes ABAP. Para piorar também não há forma de criar constantes dedicadas a CDSs.  A coisa mais perto de constantes que as CDSs oferecem são _CDS Enumerated types_. Não só não substituem constantes normais como não são compatíveis com as _Enumerations_ do ABAP. Tirando isso, a solução que aconselham é fazer referência aos valores dos domínios tipo `zmessage_type."40"`. Portanto, não há forma de evitar que as CDSs fiquem pejadas de literais mágicos potencialmente obscuros.

## Daqui resultará sempre código esparguete

Os problemas que descrevi acima não são só problemas teóricos. Eles têm como consequência tornar quase impossível evitar que o código das CDSs se torne esparguete.

Se não consegues renomear facilmente, tudo ficará com o primeiro nome que teve e tenderá a ficar obscuro. Como não podes encapsular, fica difícil estruturar e acaba tudo ao monte. E para ajudar à confusão, a impossibilidade de usar constantes vai deixar o código pejado de números mágicos. Juntas isto tudo com uns anos de manutenção evolutiva em cima e acabarás sempre com esparguete.

É muito triste que uma tecnologia tão recente tenha estes problemas todos. Por um lado, a SAP passa o tempo todo a falar em Clean Code mas por outro dá-nos esta "nova" tecnologia que é quase impossível de usar sem acabar com imenso código esparguete. Que tiro no pé e que desperdício de oportunidade!

Faz lembrar os Web Dynpros, essa tecnologia monolítica horrível que nasceu torta e mesmo assim durante uns anos alguns achavam que era o máximo.

Querida SAP, não me leves a mal o desabafo. Gosto de ti e espero que numa futura versão consigas encontrar solução para todos estes problemas.

Obrigado a alguém pela [foto][2].

O Abapinho saúda-vos.

[1]: {{< ref "pacotes-2-0" >}}
[2]: <https://pngimg.com/image/85932>
