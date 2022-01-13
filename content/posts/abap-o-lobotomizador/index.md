---
title: 'ABAP, o lobotomizador'
slug: abap-o-lobotomizador
date: 2018-10-15 09:27:05
tags: [estilo]
categories: [historias]
wordpressId: 4072
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
O João estuda Engenharia Informática na Universidade onde aprende Java, polimorfismo, encapsulamento e uma série de outras técnicas e boas prácticas. Quando termina o curso é contratado por uma empresa para trabalhar em SAP. No curso de introdução ao ABAP que a empresa lhe oferece, a primeira coisa que ensinam é como fazer o programa ZJOAO. Explicam assim:

_"Vais à SE38, crias o programa ZJOAO e crias logo os includes ZJOAO_TOP, ZJOAO_FRM e ZJOAO_SEL. Depois metes as variáveis todas no _TOP, o ecrã de selecção no _SEL e todos os FORMs no _FRM. A partir daqui é só ires programando. Primeiro escreves START-OF-SELECTION e a seguir fazes todos os SELECTs e depois escreves END-OF-SELECTION e mostras tudo numa ALV. É simples, vês? Bem-vindo ao ABAP."_

<!--more-->

Lá vai então o João todo contente programar para um cliente e, quando começa a ver os programas que lá encontra constata que, de facto, quase todos têm um _TOP, um _SEL, um _FRM e começam com START-OF-SELECTION. Mas fica intrigado porque só alguns têm END-OF-SELECTION.

Passado um mês a trabalhar na SE38, o João já mal se lembra de tudo o que aprendeu no curso de engenharia. Um ano mais tarde já faz coisas a sério, complexas e de responsabilidade. Os programas dele têm milhares de linhas distribuídas por vários FORMs (que ele escreve no _FRM) com centenas de linhas cada um. Os FORMS não usam parâmetros porque seria um disparate andar a passar as variáveis de um lado para o outro quando se podem meter todas no _TOP e ficam mais facilmente acessíveis. Assim, o _TOP dos programas do João acabam com dúzias de variáveis globais.

Até que alguém lhe fala em [encapsulação][1] e ele diz:

_"O quê? Fazer módulos de função reutilizáveis na SE37? Sim, eu podia fazer alguns, mas sei que nunca mais ninguém vai reutilizar isto por isso não vale a pena."_

Até que alguém lhe fala em [ABAP OO][2] e na transacção [SE24][3] e ele diz:

_"Ah, as classes? É pá isso é mau porque demora imenso tempo e dá imenso trabalho e não dá jeito nenhum para fazer debug. Neste cliente os prazos são apertados e além disso não vejo vantagem nenhuma em usar classes nas coisas que eu faço."_

E lá segue a sua vida, acrescentando cada vez mais linhas aos seus muito queridos _FRM e o _TOP.

Até que alguém lhe fala em [Software][4] [Design][5] [Patterns][6] e o João diz:

_"É pá, aprendi UML na Universidade e odiei. Não serve para nada. Além disso esses desenhos têm classes e no SAP eu acho que não faz sentido usar classes."_

Até que alguém lhe fala nas virtudes do [SOLID][7] e ele diz:

_"Hum... isso parece interessante e se tivesse tempo até aprendia em casa mas no SAP isso não dá porque o SAP é diferente porque a maneira de programar em ABAP não tem nada a ver e não dá para aplicar isso."_

Até que alguém lhe fala no [ATC (ABAP Test Cockpit)][8] e ele diz:

_"O que é isso? Experimentei num programa meu e deu tantos erros, todos inúteis, que não tive paciência"._

E lá segue a sua vida escrevendo programas tranquilamente sem ter de se preocupar com vulnerabilidades, falhas de nomenclatura, erros semânticos, excepções por apanhar, etc.

Até que alguém lhe fala em [TDD (Test Driven Development)][9] e [ABAP Units][10] e ele fica com os olhos em bico e diz:

_"Test quê? Eu já vi isso do ABAP Unit algures na SE80 mas não liguei. Para fazer testes eu peço uns dados ao funcional e vejo se funciona e depois digo-lhes que já está e eles que testem o resto."_

Até que alguém lhe diz que [Shared][11] [Objects][12] é óptimo para fazer cache de instâncias em memória e ele diz:

_"Cache? Eu normalmente faço uma tabela ZRESULTADOS e guardo lá os dados temporariamente e depois faço SELECT àquilo. Mas é rápido por isso está bom assim. E depois faço um programa para apagar a tabela de tempos a tempos. Funciona muito bem."_

Até que alguém lhe fala no [SAP Package Concept][13] e na utilização de [Package Interfaces][14] e ele diz:

_"Pacotes? Se for de FI meto tudo no ZFI, se for de SD meto tudo no ZSD e se for de MM meto tudo no ZMM. Assim nunca me engano."_

Até que alguém lhe fala nos [ADT (ABAP Development Tools)][15] e no [Eclipse][16] e ele diz:

_"Eu usei Eclipse na Universidade. Mas isso é para Java. Para o ABAP não vejo vantagem nenhuma."_

Até que alguém lhe fala no [abapGit][17] que permite usar o maravilhoso [git][18] em ABAP, e ele diz:

_"Mas eu sempre pude fazer versões no ABAP! Além disso normalmente quando quero guardar versões ou copiar código entre sistemas uso o NOTEPAD.EXE que nunca falha."_

E porque no mundo do SAP os clientes raramente se preocupam com a qualidade do código, não há quaisquer padrões nem normas de indústria, é raro haver controlo de qualidade e, quando há, é quase sempre feito por alguém que pensa como o João, passados 10 anos o João lá continua, de roda da SE38, a criar os seus _TOPs, _FRMs e _SELs.

Até que alguém lhe pergunta a profissão:

"Sou Engenheiro Informático."

Não és não.

   [1]: https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)
   [2]: https://archive.sap.com/documents/docs/DOC-10236
   [3]: http://zevolving.com/category/abapobjects/
   [4]: https://en.wikipedia.org/wiki/Software_design_pattern
   [5]: https://en.wikipedia.org/wiki/Design_Patterns
   [6]: http://shop.oreilly.com/product/9780596007126.do
   [7]: https://en.wikipedia.org/wiki/SOLID
   [8]: https://blogs.sap.com/2012/10/18/getting-started-with-the-abap-test-cockpit-for-developers/
   [9]: https://en.wikipedia.org/wiki/Test-driven_development
   [10]: https://wiki.scn.sap.com/wiki/display/ABAP/ABAP+Unit
   [11]: https://help.sap.com/doc/saphelp_nw70/7.0.31/en-US/14/dafc3e9d3b6927e10000000a114084/frameset.htm
   [12]: https://blogs.sap.com/2015/02/19/how-to-use-shared-object-memory-and-sap-memory-to-share-the-objects-for-processing-in-sap-with-an-example/
   [13]: https://blogs.sap.com/2011/12/04/abap-package-concept-part-1-the-basics/
   [14]: {{< ref "pacotes-2-0" >}}
   [15]: https://blogs.sap.com/2012/06/12/faqs-abap-development-tools-for-eclipse/
   [16]: https://blogs.sap.com/2014/03/17/how-to-get-your-colleges-into-abap-in-eclipse/
   [17]: https://github.com/larshp/abapGit
   [18]: https://git-scm.com/
