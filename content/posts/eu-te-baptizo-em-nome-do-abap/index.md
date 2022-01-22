---
title: 'Eu te baptizo em nome do ABAP'
slug: eu-te-baptizo-em-nome-do-abap
date: 2015-10-26 09:00:05
tags: [estilo]
categories: [artigos]
wordpressId: 3218
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando aprendemos ABAP ensinam-nos uma série de regras sobre como dar nomes a variáveis. Ainda que nem todos acabem por dar nomes iguais, ainda assim partilham-se algumas ideias rígidas:

  * As variáveis locais começam por L: L_BUKRS;

  * As variáveis globais começam por G: G_MODE;

  * As tabelas internas têm de ter lá um T_: LT_MARA;

  * As estruturas têm de ter lá um S_: LS_MARA;

  * As referências para objectos começam por R_: R_CUSTOMER;

  * Os parâmetros _input_ devem começar por I, os _output_ por O, os _changing_ por C e os _returning_ por R.

  * E a mais estúpida de todas, os _field-symbols_ devem começar por FS_: <FS_MARA>.

No início do século XXI isto até fazia sentido (excepto a dos _field-symbols_ que já na altura era tão estúpida como escrever a palavra "lápis" em todos os lápis que tivermos). Hoje quase já não. Passo a explicar.
<!--more-->

Ao longo do tempo as regras que sigo para dar nomes a variáveis tem mudado. Por exemplo, se as globais começam por G_ não há grande vantagem em usar o L para identificar as locais visto que, se não começam por G, são obviamente locais. Lá se vai uma das regras.

Quando se começa a programar com ABAP OO a coisa complica porque tecnicamente as variáveis globais de uma classe não são variáveis globais, são atributos da classe. Faz algum sentido começar os atributos de uma classe por G? Não faz. Lá se vai outra regra.

Quando se começa a usar referências para classes e _deep structures_ , estes tipos de dados podem encapsular diferentes dados complexos que misturar tabelas, estruturas, referências para outras classes com valores simples. Fará sentido começar todas por R_ quando na verdade elas potencialmente representam uma tabela interna? Se seguirmos esta lógica a maior parte das outras regras cai por terra.

No fim a única regra que ainda continua a fazer todo o sentido é a que distingue os parâmetros de entrada dos de saída dos modificáveis.

Recentemente o Sérgio Fraga mostrou-me [este artigo][1] que vem de encontro a algumas das ideias que eu já tinha e ainda as leva mais longe e propõe alternativas interessantes.

Resumidamente ele propõe que o nome deixe de:

  * distinguir globais de locais;

  * explicitar o tipo de dados (estrutura, tabela interna, etc.);

  * explicitar o nome técnico (LT_MARA);

E se limite a:

  * descrever a sua função (CUSTOMER);

  * distinguir singular de plural (LOOP AT CUSTOMERS INTO CUSTOMER);

  * distinguir as variáveis dos parâmetros com os tais I_, O_, C_ e R_.

E eu acho que ele tem toda a razão.

É difícil mudar algo que está tão interiorizado. E neste assunto nunca haverá consenso. Mas pelo bem da comunidade acho que valia a pena cada um de nós fazer uma introspecção sobre que raio de nomes anda a dar às suas variáveis. O mundo evoluiu. Deixemos a ITBL e a WA_KNA1 para trás.

Obrigado Stephen Lock pela [foto][2].

O Abapinho saúda-vos.

   [1]: https://scn.sap.com/community/abap/blog/2015/09/22/hungarian-beginners-course--a-polemic-scripture-against-hungarian-notation
   [2]: https://www.flickr.com/photos/stephendl/2212818035
