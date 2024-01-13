---
slug: nova-sintaxe-complicada
title: Para aqueles que criticam a nova sintaxe da 7.4
description: Há sempre os velhos do Restelo que resistem em vez de se adaptar
date: 2024-01-15T09:01:01Z
tags: [7.4]
categories: [historias]
keywords: [Velho do Restelo do ABAP]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Este post dirige-se à personagem colectiva que representa todas as pessoas já me disseram que gostam de algumas coisas da nova sintaxe funcional da 7.4 mas acham que não se deve exagerar e se deve evitar usar `REDUCE` e essas coisas desnecessariamente esquisitas pois o código fica mais obscuro, é mais lento e não vêem vantagens.

Estás a falar a sério?

<!--more-->

Não é que me surpreenda dizeres isso. Afinal também passaste anos a dizer-me que não vias vantagens na programação orientada por objectos e continuaste até recentemente a rodear-te confortavelmente de `FORM`s e `FUNCTION MODULE`s.

E foste também tu quem, quando o teu projecto finalmente te obrigou a adoptar classes, as passaste a usar como se fossem funções sem nunca teres realmente compreendido como pensar em OO.

Ficas a saber que é para mim fascinante que vivas tranquilo adicionando diariamente mais um IF dentro de outro IF dentro de outro IF aos teus métodos de 2500 linhas mas que depois ficas atrapalhado com um `REDUCE` de 4 linhas que não consegues decifrar à primeira. E em vez de o ires aprender e o começares a usar para ganhar experiência, optes por teorizar sobre as suas óbvias desvantagens.

Mas está tudo bem. O mundo SAP, por ser tão retrógrado e afastado do resto da indústria, permite que tal aconteça. Não temas. Tens-te safado e vais continuar a safar-te.

Vamos então aos teus argumentos:

- Velocidade: comecemos pelo mais simples. Não experimentaste pois não? Se tivesses experimentado terias tido uma surpresa: em todas as experiências que fiz a nova sintaxe é mais rápida ou igual. Isto faz-me lembrar quando andavas a dizer que usar classes e métodos era mau porque ficava mais lento poro SAP demorar muito tempo a instanciar classes e a chamar métodos. E ao mesmo tempo que dizias isto ias espalhando `SELECT`s pelo código sem nunca te preocupares com o facto deu um `SELECT` ser várias ordens de grandeza mais lento que qualquer outra coisa que faças em ABAP;

- Obscuro: isto vindo de quem usa variáveis globais (agora sob a forma de atributos de classe) para não ter de andar a passar coisas por parâmetros, mas ok. Claro que um comando se pode tornar obscuro se tentares fazer tudo ao mesmo tempo de uma única vez. Mas só porque a nova sintaxe é tão poderosa que o permite, não quer dizer que o devas fazer. Isso é como dizer que a pólvora é má porque explode pessoas. A solução é sempre a mesma: aprender a usar e usar com bom senso. Diria até que o potencial de os comandos funcionais ser tornarem densos demais é uma vantagem porque, se um comando fica demasiado complicado, isso salta à vista e dá vontade de o subdividir em 2 ou em 3 para o manter legível. Já com código imperativo, como cada comando é simples de entender, o que acontece é que vais adicionando mais um IF aqui e mais outra variável auxilar ali e de repente tens um algoritmo intragável com 300 linhas em que cada bocadinho continua simples mas o todo já é tão confuso que agora tens medo de lhe mexer. Isso sim, é uma desvantagem;

- Sem vantagens: pá, vai ler. Lê o [Clean Code][1], o [Head First Design Patterns][2] e o [Refactoring][3], assiste a esta lição do [Uncle Bob sobre os princípios SOLID][4] e tens também aqui alguns links para te iluminares: [Princípios SOLID][5], [Clean ABAP][6], [Refactoring][7], [Design patterns][8].

Volta sempre.

O Abapinho saúda-vos.

[1]: <https://app.thestorygraph.com/books/0fb5f91c-d628-4366-88b1-eda9c4bfdc75>
[2]: <https://drive.google.com/file/d/1U_9ZtNsO3qGLD7YwM94dp_cFjio33QjK/preview>
[3]: <https://app.thestorygraph.com/books/3b87bb83-ff18-425d-be63-055b43299e25>
[4]: <https://www.youtube.com/watch?v=zHiWqnTWsn4&t=12s>
[5]: <https://en.wikipedia.org/wiki/SOLID>
[6]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md>
[7]: <https://refactoring.guru/refactoring>
[8]: <https://refactoring.guru/design-patterns>
