---
title: 'Como sabotar tabelas'
slug: como-sabotar-tabelas
date: 2012-03-12 13:30:24
tags: [segredo]
categories: [artigos]
wordpressId: 1520
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Mais um artigo em auxílio dos que buscam a subversão subreptícia. Espiões, reparem como editar uma tabela que não pode (e provavelmente não deve) ser editada. Apresento-vos 3 técnicas. A primeira já caducou há anos, a segunda está em vias de caducar e a terceira vamos ver quando caducará.

<!--more-->

**1\. SE16 /H OK_CODE EDIT**
O primeiro sistema é já do século XX e usar a velha transacção SE16.

  * na transacção SE16 escolhe a tabela a editar

  * selecciona os dados e vai para o detalhe de um dos registos

  * /H para debug

  * muda o valor da variável OK_CODE para "EDIT"

  * F8 para continuar

Se tudo tiver corrido bem agora o registo está editável. Depois é só gravar.

**2\. SE16N &sap;_edit**

  * na transacção SE16N escolhe a tabela a editar

  * selecciona os dados se quiseres filtrar registos

  * no campo da transacção escreve &sap;_edit e enter

  * F8 para ires para a lista de dados

Um Service Pack recente da SAP inibe esta técnica. Se, com um bocado de sorte, o teu sistema estiver desactualizado, agora o registo está editável. Depois é só gravar. Se não der, experimenta a mesma coisa mas com a transacção UASE16N ao invés.

**3\. Função SE16N_INTERFACE**

  * transacção SE37, função SE16N_INTERFACE

  * F8 para testar

  * parâmetros:

    * I_TAB = KNA1 :-)

    * I_EDIT = X

    * I_SAPEDIT = X

    * IT_SELFIELDS preenchido opcionalmente para restringir os registos a editar

  * novamente F8 para executar

Se tudo tiver corrido bem agora aparece uma lista de registos editável. Depois é só gravar.

Vá, agora não comeces para aí a sabotar tabelas como se não houvesse amanhã!

Obrigado a Renato Oliveira pelo material secreto.

O Abapinho saúda-vos.
