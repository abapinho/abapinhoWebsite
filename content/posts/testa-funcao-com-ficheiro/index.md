---
title: 'Testa função com dados de teste carregados por ficheiro'
slug: testa-funcao-com-ficheiro
date: 2018-06-04 09:00:33
tags: [se37, testes]
categories: [artigos]
wordpressId: 3982
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['testa função SE37']
description: 'A transacção SE37 permite testar módulos de função. Por vezes esses módulos de função utilizam tabelas. Pode dar-se o caso de precisarmos de carregar muitas linhas de dados de teste em uma ou mais dessas tabelas. Aqui fica um truque para o conseguir fazer a partir de um ficheiro.'
---
A transacção SE37 permite testar módulos de função. Por vezes esses módulos de função utilizam tabelas. Pode dar-se o caso de precisarmos de carregar muitas linhas de dados de teste em uma ou mais dessas tabelas.

Aqui fica um truque para o conseguir fazer a partir de um ficheiro.

<!--more-->

1\. Entra em modo de depuração na SE37:

[![][1]][1]

2\. Cria um _break-point_ no módulo de funções RS_COMPLEX_OBJECT_EDIT:

[![][2]][2]

3\. Faz F8 para continuar. Vai parar na função:

[![][3]][3]

4\. Inspecciona a variável OBJECT (que é uma tabela interna) e entra nela com duplo clique:

[![][4]][4]

5\. Carrega no ícone da ferramenta para aceder às funcionalidades disponíveis:

[![][5]][5]

6\. Escolhe a opção "Upload from file" e carrega o ficheiro (que deverá ter a mesma estrutura que a tabela que estás a popular):

[![][6]][6]

7\. A tabela ficou agora populada com o conteúdo do ficheiro:

[![][7]][7]

8\. Faz F8 para voltar ao ponto de partida, agora com a tabela populada e pronta para correres o teste:

[![][8]][8]

Obrigado Rui Couto por nos demonstrares este óptimo e práctico truque.
Foto: [MGI Construction Corp.][9] em [Visualhunt.com][10] / [ CC BY-ND][11]

O Abapinho saúda-vos.

   [1]: images/Picture1.png
   [2]: images/Picture3.png
   [3]: images/Picture4.png
   [4]: images/Picture5.png
   [5]: images/Picture65.png
   [6]: images/Picture6.png
   [7]: images/Picture7.png
   [8]: images/Picture8.png
   [9]: https://visualhunt.com/author/c56abe
   [10]: https://visualhunt.com/re/0b3fcb
   [11]: https://creativecommons.org/licenses/by-nd/2.0/
