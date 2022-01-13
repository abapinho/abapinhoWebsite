---
title: 'O detective do ABAP'
slug: o-detective-do-abap
date: 2014-03-10 09:00:42
tags: [estilo, sapgui]
categories: [artigos]
wordpressId: 2622
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Em SAP, quando um desenvolvimento está concluído, chega finalmente o momento de o enviar para outros sistemas onde pode ser devidamente testado e por fim executado pelos utilizadores.
Mas antes disso, é crucial verificar se não existem lapsos, erros e afins que possam levar ao aparecimento de alguns comportamentos imprevisíveis por parte dos nossos programas.
Existe uma ferramenta muito útil que permite filtrar alguns desses erros e lacunas. Chama-se ABAP Code Inspector.

<!--more-->

[![odetectivedoabap1][1]][1]

**O que é o Code Inspector?**

É uma ferramenta destinada a verificar Objectos do Repositório, de uma forma estática, de modo a diagnosticar problemas de performance, segurança, sintaxe e aderência a nomenclatura de nomes dos clientes.

Através da transacção SCI, podem ser efectuadas Inspecções, cujo resultado fica disponível para consulta no sistema.
Essas inspecções podem ser efectuadas a objectos individuais ou a conjuntos (Set of Objects). Cada inspecção baseia-se numa variantes que configura os filtros e critérios que serão tidos em conta na análise.
Existem já muitas variantes standard que podem ser utilizadas mas é também possível criar novas, adaptadas aos requisitos específicos dos nossos clientes/projectos.

O Code Inspector é, portanto, uma ferramenta de análise de código.

Existem também ferramentas de análise de performance disponibilizadas pela SAP, como é o caso da SE30 (Runtime Analysis Tool), ST05 (Performance Trace) e ST30 (Global Performance Analysis Function). Mas que não as abordaremos neste artigo.

Pode ser invocado de duas formas:

  1. Directamente das transacções SE37, SE38 e SE24 para inspeccionar objectos individuais;

  2. Autonomamente, via transacção SCI. Esta é sem dúvida a forma mais poderosa de o chamar, visto que assim podem ser configurados Object Sets para definir um conjunto de objectos a inspeccionar e as Variantes, como veremos mais adiante.

Transacção SCI :

[![odetectivedoabap2][2]][2]

**Como efectuar uma inspecção via SCI?**

Em primeiro lugar damos um nome à inspecção. De seguida, escolhemos Object Set, Request, ou Single. Neste caso escolhemos Single Object para analisar apenas um programa e deixamos a variante DEFAULT.

Existem 2 opções de execução: imediata ou em background.

[![odetectivedoabap3][3]][3]

Clicando no botão ‘Result’, obtemos uma lista de erros, avisos e informações que poderemos usar para detectar, corrigir e melhorar o código analisado. Cada linha tem informação detalhada sobre o que foi detectado e como pode ser corrigido, permitindo navegar directamente para o lugar exacto no código fonte.

[![odetectivedoabap4][4]][4]

**Configurar Object Sets**

Ao contrário do exemplo anterior, podemos querer analisar um conjunto de elementos específico. Para isso criamos um Object Set:

[![odetectivedoabap5][5]][5]

Uma vez criado, o Object Set fica disponível para ser usado em todas as inspecções futuras.

**Criar Variantes**

Como já foi dito, uma variante permite definir com exactidão quais os critérios a ter em conta durante a análise. Ao criar uma variante, temos ao nosso dispor uma lista extensa de possibilidades, que pode ser configurada conforme as necessidades. Cada linha tem um texto de ajuda que explica o seu efeito.

[![odetectivedoabap6][6]][6]

A título de exemplo temos aqui a possibilidade de validar a nomenclatura de nomes:

[![odetectivedoabap7][7]][7]

Podemos definir filtros de performance (procurar SELECTs ou LOOPs encadeados),
procurar por execuções que possam ter comportamentos críticos e delicados (Critical statements), verificar se o SY-SUBRC é devidamente testado e ainda se a utilização de índices e chaves de tabelas é a mais correcta. Além disso, existe todo um conjunto de possibilidades de filtros e pesquisas de elementos críticos do nosso código.
É de ter em conta que quantos mais critérios forem adicionados, mais tempo levará a ser executada a Inspecção e mais alertas serão apresentados.

Inspecção, Object Set, e Variante podem ser criados como objectos locais (apenas visíveis para o próprio utilizador) ou como objectos globais (disponíveis para todos os utilizadores autorizados).
Para as trocar de locais a globais, basta clicar no símbolo em frente ao seu nome.

O Code Inspector é uma ferramenta poderosa, que permite optimizar a performance dos programas bem como evitar comportamentos ineficientes e contra-produtivos.
Além disso, ajuda-nos a escrever programas mais legíveis e que aderem a convenções globais indicadas pela SAP.

**Saber mais**

[http://help.sap.com/saphelp_nwpi711/helpdata/en/8d/ 4b64488cce3945ba42b059319d62dc/content.htm][8]

<http://scn.sap.com/docs/DOC-15932>

<http://scn.sap.com/community/abap/testing-and-troubleshooting/blog/2007/03/12/code-inspector-s-performance-checks-i>

O Abapinho agradece a Artur Moreira.

   [1]: images/odetectivedoabap1.jpg
   [2]: images/odetectivedoabap2.jpg
   [3]: images/odetectivedoabap3.jpg
   [4]: images/odetectivedoabap4.jpg
   [5]: images/odetectivedoabap5.jpg
   [6]: images/odetectivedoabap6.jpg
   [7]: images/odetectivedoabap7.jpg
   [8]: http://help.sap.com/saphelp_nwpi711/helpdata/en/8d/4b64488cce3945ba42b059319d62dc/content.htm
