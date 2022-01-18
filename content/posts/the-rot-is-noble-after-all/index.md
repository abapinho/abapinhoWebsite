---
title: 'Afinal a podridão é nobre'
slug: the-rot-is-noble-after-all
date: 2016-02-22 09:00:45
tags: [fiori, hana, sapui5]
categories: [artigos]
wordpressId: 3404
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['fiori']
---
Durante anos queixei-me por o ambiente de desenvolvimento do SAP ser tão retrógrado e antiquado e por demorar tanto tempo a evoluir Sempre que mo ouvia dizer, um amigo meu avisava-me sabiamente: "não mordas a mão que te dá de comer".

Mas como pode um homem ficar calado?

<!--more-->

É exasperante trabalhar 8 horas por dia naquela coisa arcaica a que chamam ABAP Workbench depois de ter experimentado IDEs modernos como o XCode ou o Eclipse. Quando a SAP decide finalmente introduzir alguma nova funcionalidade ao IDE (como permitir completar automaticamente as palavras com base no contexto por exemplo) só quem nunca trabalhou no XCode, Eclipse ou VisualStudio é que, feliz ignorância, pode ficar contente. Porque os outros, que sabem bem que estas coisas são banais noutros IDEs desde o século XX, esses só largar um breve suspiro de alívio e continuar a tentar ignorar tudo o resto que lá falta.

No entanto o primeiro prémio vai para o descontrolo do controlo de versões do ABAP. Como é possível que, nos dias que correm, a gestão de versões seja ainda orientada ao ficheiro? Se uma classe é sempre constituída por vários ficheiros, é practicamente impossível não fazer asneira ao tentar recuar a versões anteriores de uma classe, pois a versão de cada um dos inúmeros ficheiros tem de ser gerida independentemente. Para não falar na trabalheira que dá. Fora do mundo SAP os sistemas de gestão de versões têm evoluido tanto que o Subversion, um sistema até há pouco tempo considerado sofisticado, é já considerado obsoleto desde que apareceram os sistemas descentralizados como o GIT. Eu venero o GIT. Mas até largaria um sorriso de alegria se o SAP disponibilizasse algo parecido com o Subversion. Só que nem isso.

Quem for à vinha e olhar para as uvas já vê que estão podres.

E de repente... em 2015... a SAP surpreendeu-me. Porque compreendi que afinal nos últimos anos ela tem andado a fazer a apanha (tardia, mas cuidada) de toda esta uva (podre, mas doce) e está agora a lançar uma série de vinhos _late harvest_ excepcionais. E em vez de continuar a tentar fazer evoluir um IDE retrógrado e moribundo, largou tudo e começou do zero.

Já há uns tempos que ouvia falar em HANA e Fiori e SAPUI5 mas ainda não tinha entendido como é que iriam ser adoptados. Só em 2015, em boa parte graças aos cursos da OpenSAP, é que comecei a ver as peças a encaixar.

O curso [In-Memory Data Management In a Nutshell][1] permite ter uma ideia clara da revolução tecnológica que o HANA traz em relação às bases de dados relacionais hoje em uso.

O curso [Developing Mobile Apps with SAP HANA Cloud Platform][2] permite meter as mãos na massa e experimentar o lado mais UI das novas aplicações feitas em Fiori e SAPUI5.

Os cursos [SAP S/4HANA in a Nutshell][3] e [SAP S/4HANA – Use Cases][4] explicam como os super-poderes do HANA estão já a ser usados para implementar a nova infra-estrutura aplicacional que vai substituir o R/3.

Depois de tanta crítica, deixo aqui o elogio:
Mas que belo puzzle. Estou ansioso por começar a montá-lo.

A SAP andou distraída e a definhar durante uma série de anos. Mas reparou a tempo, reinventou-se e agora acelera em direcção ao futuro. Amigo, se também andas distraído e a definhar, segue o meu conselho e presta atenção ao que se anda a passar à tua volta porque ou reparas agora e começas a correr ou ainda perdes o comboio (ou melhor dizendo, o foguetão).

O Abapinho saúda-vos.

   [1]: https://open.sap.com/courses/hana-warmup
   [2]: https://open.sap.com/courses/mobile2/resume
   [3]: https://open.sap.com/courses/s4h1-1
   [4]: https://open.sap.com/courses/s4h3
