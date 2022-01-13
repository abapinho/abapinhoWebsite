---
title: '<!--:pt-->Import/Export = Contrabando<!--:-->'
slug: importexport
date: 2010-08-14 00:37:24
tags: [estilo]
categories: [artigos]
wordpressId: 346
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
O Java, uma linguagem de programação bem pensada, ajuda o programador a organizar o seu código obrigando-o a desenvolvê-lo de forma estruturada. A sua própria filosofia potencia o pensamento estruturado e promove coerência e arrumação.

Já o ABAP... promove o caos. Está cheio de caminhos perniciosos que levam direitinho a um inferno confuso e labiríntico. E geralmente são as coisas aparentemente mais convenientes que se revelam as mais perigosas.

Uma das conveniências piores é a parelha **IMPORT** e **EXPORT**.

<!--more-->

Tão simples e conveniente! Mete-se algo na memória e depois, algures noutro sítio distante, lá está esse algo à nossa espera, disponível, mesmo à mão de semear. Caros leitores, não se deixem enganar. É preciso ser forte! Há que resistir à tentação de enveredar pela via da promiscuidade.

Usar IMPORT/EXPORT é contrabandear informação:

  * a leitura e a escrita ficam desconexas;

  * torna bastante difícil encontrar os IMPORTs e EXPORTs;

  * não é possível procurá-las através da "lista de utilizações";

  * tendo encontrado um EXPORT podem existir mais, escondidos, noutro sítio totalmente diferente;

  * é fácil deixar lixo na memória que numa futura iteração não é correctamente inicializada e depois é o a ver se te avias.

Alternativas para evitar estes demónios em forma de comandos ABAP:

**1\. Parâmetros**
Já vi situações em que se utilizava um EXPORT num programa que depois chamava uma função que fazia um IMPORT. Só a preguiça ou a ignorância podem explicar que isto aconteça em vez de se usar um simples parâmetro;

**2\. Variáveis globais de grupo de funções**
Por vezes usa-se IMPORT/EXPORT para guardar o valor de uma variável entre várias chamadas de uma função. Uma forma mais saudável de conseguir o mesmo efeito é a utilização de variáveis globais, declaradas no TOP do grupo de funções. Pode-se por exemplo criar no mesmo grupo de funções uma função GUARDA_X que escreve o valor na variável global e outra função LE_X que lê o valor da variável, fazendo estas as vezes do EXPORT e do IMPORT respectivamente;

**3\. Artibutos estáticos de uma classe**
Os atributos estáticos numa classe comportam-se da mesma forma que as variáveis globais do grupo de funções e podem ser usadas nas mesmas situações. Com a vantagem de uma classe ser sempre mais elegante e arrumada que um grupo de funções.

**4\. STATICS**
Declarando uma variável local à função ou procedimento como STATICS obtém-se o mesmo efeito que com a utilização de variáveis globais pois esta guardará o seu valor entre as várias que é chamada. Com a limitação de a variável neste caso ficar disponível apenas para a função ou procedimento onde foi declarada, não podendo portanto ser usada para comunicar entre funções diferentes.

Haverá alguma situação em que seja inevitável usar esta funcionalidade horrenda? Talvez. Mas são menos do que se pensa. De qualquer forma o conselho do Abapinho é este: manter distância.

O Abapinho saúda-vos.

Actualização: O Bruno Filipa mostrou-me um exemplo onde realmente não parece haver forma de evitar usar IMPORT/EXPORT. Nas palavras dele: «Imagina que no meio do standard tens um submit. Precisas de aceder a dados “dentro do submit” que só tens disponíveis antes desse submit ser feito. Supostamente tendo um grupo de funções com uma variável global que é afectada antes do submit (num exit qq) e consultada dentro do submit resolveria o problema. Mas na verdade quando fazes um submit os valores das variáveis globais dos grupos de função vão à vida… Por outro lado com um IMPORT/EXPORT conseguirias resolver a questão». Realmente, nenhum das alternativas que proponho neste artigo funcionariam neste caso. Bolas.
