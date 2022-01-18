---
title: '<!--:pt-->Procurar uma BADI no palheiro<!--:-->'
slug: procurar-uma-badi-no-palheiro
date: 2010-06-14 10:46:04
tags: [debug]
categories: [artigos]
wordpressId: 309
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O SAP é um enorme palheiro. E os ABAPers são pessoas que trepam por esse palheiro acima e nele vasculham e escarafuncham em busca de agulhas de todo o género. Às vezes, desesperados, deitam-se a descansar e vêm uma quantidade enorme de bicharocos que vivem no palheiro fazer-lhes comichão. Para evitar que isso aconteça, o Artur Moreira propõe-nos uma série de diferentes técnicas para procurar BADIs neste grande palheiro que é o SAP.

<!--more-->

Aqui ficam. É escolher ao gosto do freguês:

  1.
**Transacção desejada**
Ir à transação desejada e ir ao menu:
>System > Status, fazer duplo click em cima do programa desejado
Procurar por “CALL CL_EXITHANDLER”
Na transação SE24 ir ao método GET_INSTANCE da class CL_EXITHANDLER
Colocar aqui um breakpoint;
Quando a transação for chamada, o programa para nesse método;
O conteúdo da variável EXIT_NAME vai dar-nos o nome da BADI disponível.

Por este método, apanhamos os diferentes episódios (chamadas de
BADIs), e como tal temos de identificar qual o episódio que nos
interessa no meio de todos os que são sucessivamente apresentados.
Diria que este método é o mais imediato.

  2.
**Transacção ST05**
Activar o Trace ( com a opção para o Table Buffer Trace);
Executar a transação desejada;
Desactivar o Trace e fazer o Display do LOG;
Pesquisar pelos seguintes objectos:
\- V_EXT_IMP
\- V_EXT_ACT

O nome das Interface Classes começa sempre por IF_EX_XYZ,onde XYZ é a
BADI que procuramos;
Podemos ainda procurar directamente na VIEW V_EXT_IMP, as BADIs,
seguindo o principio anterior que os interfaces IF_EX_XYZ apontam para
a BADI XYZ.

Por este método, temos acesso imediato à lista de todos os episódios;
Identificar na lista qual é o que pretendemos utilizar/visualizar;

  3.
**Transação SE93**
Indicar a transação para a qual procuramos a BADI;
Escolher: Display;
Obter o nome do “Package Name”
Na transação SE84 ir ao menu:
Enhancements >Business Add-Ins > Definition
Indicar o “Pagkage Name” e Executar;
Aí está a lista das BADIs para o Package associado à nossa transação.

Tendo em conta que esta informação surge ao nível do Package, é mais
lata e abrangente (episódios de várias séries);

  4.
**Transacção SE18**
Nesta transacção fazer F4 -> Procurar BADIs pelo “Package”
Esta é uma pesquisa ao nível do repositório de BADIs.

  5.
**Módulo de função SXV_GET_CLIF_BY_NAME**
Colocar um break-point neste módulo de função. Mais uma visualização dos episódios de BADIs uma a uma.

  6.
**Programas específicos**
Para quem quiser pesquisar na internet, existem programas que listam
BADIs por transação – Isso fica para trabalho de casa. Têm como
inconveniente terem de ser criados no sistema e nem sempre vemos onde
é efectuada a chamada, daí todas as sugestões anteriores.

  7.
**Tabelas úteis**
\- SXS_ATTRT - BAdi Definition list
\- V_EXT_ACT - Active implementations of an exit
\- V_EXT_ IMP - Implementation class for an interface+filter
\- V_EXT_M - BAdi’s with filters

  8.
**Transações uteis para implementar BADIs**
\- SE18 - Business Add-in builder
\- SE19 – Implementation of Badi
\- SE24 – Class/Interface Builder

Muito obrigado ao Artur Moreira pela colaboração!

O Abapinho saúda-vos.
