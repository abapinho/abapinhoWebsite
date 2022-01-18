---
title: 'Já usaste expressões regulares?'
slug: regex
date: 2013-07-15 09:00:55
tags: []
categories: [artigos]
wordpressId: 2392
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
As expressões regulares já existem há que tempos. Mas ainda são muito pouco conhecidas e ainda menos usadas. São uma espécie de linguagem descritiva que permite efectuar pesquisas e substituições muito sofisticadas em cadeias alfa-numéricas.

<!--more-->

Um exemplo simples: validar um endereço de correio electrónico. Se tiveres de o fazer através de um algoritmo tens um trabalhão. Mas com expressões regulares, basta duas ou três linhas de código e a expressão regular ["\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\b"][1].

Quase sempre que é necessário fazer pesquisas e substituições relativamente complexas dentro de cadeias alfa-numéricas é quase certo que recorrer a expressões regulares é preferível a desenvolver um algoritmo próprio.

Existem duas partes na utilização de expressões regulares.

  1. Criar o código ABAP para fazer o que queremos, seja uma pesquisa, uma validação ou uma substituição;

  2. Determinar a expressão regular propriamente dita que resolve o nosso problema.

Em relação à primeira parte existem duas abordagens possíveis para usar expressões regulares em ABAP:

  * Usar os comandos FIND e REPLACE conjuntamente com REGEX;

  * Usar as classes CL_ABAP_REGEX e CL_ABAP_MATCHER.

O primeiro é mais simples e directo mas o segundo é muito mais flexível e tem vantagens em termos de performance se pretenderes aplicar a coisa em massa.

[Aqui][2] encontras a documentação online oficial da SAP sobre expressões regulares em ABAP. E [aqui][3] encontras um PDF que ensina a usar ambas as formas e que é uma óptima referência para aprender a usar expressões regulares em ABAP. Pela net fora há exemplos e documentação de como usar expressões regulares em ABAP.

Em relação à segunda parte é importante recordar o seguinte:

  * As expressões regulares são algo padrão, disponível na maioria das linguagens de programação e como tal a mesma expressão regular deverá ter um comportamento semelhante em ABAP, Java ou qualquer outra linguagem que as implemente. Como tal, para aprenderes expressões regulares não precisas de o fazer no contexto do ABAP;

  * Não inventes a roda. Por serem tão poderosas, as expressões regulares são complexas. Na maior parte dos casos típicos já existe uma expressão regular feita por alguém que faz o que queres. Por isso, antes de perderes tempo a tentar fazer a tua, procura uma feita. Há bases de dados de expressões regulares online como [esta][4];

  * [Aqui][5] tens um bom tutorial sobre expressões regulares. É baseado em .NET mas isso não interessa porque, lá está, vai dar no mesmo;

  * O fantástico programa **DEMO_REGEX_TOY** (SE38) permite-te testar a tua expressão regular e afiná-la antes de finalmente a fixares no programa onde a vais usar.

Eu uso expressões regulares raramente. Mas quando as uso sei que a alternativa seria muito dolorosa. É importante acima de tudo saber que existem, para que servem e como funcionam. Assim poderás identificar facilmente quando é vantajoso utilizá-las.

Se tiveres curiosidade, a [Wikipédia][6] é um bom ponto de partida para aprender sobre esta fascinante ferramenta.

Obrigado a irene nobrega pela [foto][7].

O Abapinho saúda-vos.

   [1]: http://www.regular-expressions.info/email.html
   [2]: http://help.sap.com/abapdocu_70/en/ABENREGULAR_EXPRESSIONS.htm
   [3]: http://www.sdn.sap.com/irj/scn/go/portal/prtroot/docs/library/uuid/902ce392-dfce-2d10-4ba9-b4f777843182?QuickLink=index&overridelayout=true&49533857875589
   [4]: http://regexlib.com/
   [5]: http://www.codeproject.com/Articles/9099/The-30-Minute-Regex-Tutorial
   [6]: http://en.wikipedia.org/wiki/Regular_expression
   [7]: http://www.flickr.com/photos/irenewn/2536788858/
