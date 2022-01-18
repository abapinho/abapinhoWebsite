---
title: 'ASSERT vs Excepção'
slug: excepcao-vs-assert
date: 2017-01-23 09:00:56
tags: [estilo]
categories: [dicas]
wordpressId: 3717
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['ASSERT vs Excepção']
description: 'Além de classes de excepções, o ABAP também disponibiliza o commando ASSERT. Aprende quando usar excepções e quando usar ASSERTs.'
---
Quem lê o Abapinho sabe quanto gosto de classes de excepções. No entanto, este não é o único mecanismo que o ABAP disponibiliza para controlo de erros.

Há outro, chamado ASSERT, que devia ser mais usado, e que hoje trago à baila.

<!--more-->

O que é o ASSERT? É um comando que “reclama” uma determinada condição. Se a condição for verdadeira, tudo bem, não acontece nada. Se, for falsa… DUMP. E ao contrário das classes de excepção, não há forma de evitar este DUMP. E isso é bom.

Exemplo:

{{< highlight ABAP >}}
ASSERT 1 = 0.
{{< /highlight >}}

DUMP!

Mas existem dois mecanismos para a mesma coisa? Como decidir qual usar?

A regra é esta:

  * Usa ASSERT para garantir que o código está correctamente escrito

  * Usa excepções para controlar erros de execução

Ficaste confuso? Exemplifiquemos:

Exemplo 1. O método DIVIDE( A, B ) divide A por B. Sabemos que se B for zero dá asneira matemática. Mas este erro depende da valor que for atribuído a B durante a execução. Como tal, deve ser controlado com uma excepção.

Exemplo 2. O método OPEN_FILE( F ) abre um ficheiro. Mas se o ficheiro não existir não temos nada para abrir. Isto é novamente um erro de execução porque depende do valor de F. Deve ser controlado com uma excepção.

Exemplo 3. Uma classe para fazer FTP tem um método FTP->SETUP( SERVER, PORT ) e um método FTP->OPEN(). A forma correcta de usar esta classe obriga a que antes de fazer OPEN() se use o método SETUP() para definir qual o servidor destino. No entanto um programa que a está a usar chama o método OPEN() antes de chamar o método SETUP(). Este programa está mal escrito e, como tal, nunca vai funcionar. O método OPEN() deverá fazer um ASSERT para verificar que o SETUP() já foi chamado como é devido. Mais à frente pode também usar uma excepção para tratar a possibilidade de a conecção não ser aberta com sucesso, algo que é já um erro de execução e que pode ou não acontecer dependendo das circunstâncias.

**Um ASSERT falhado é sempre resultado de um bug.**. Já uma excepção pode ser apenas resultado das circunstâncias (dados inválidos do utilizador, falha temporária na infra-estrutura, etc).

Portanto: idealmente uma classe deverá usar ASSERTs para garantir que está correctamente programada e que quem a usa está a fazê-lo correctamente.

Uma boa aplicação de ASSERTS torna a classe mais robusta porque permite identificar imediatamente bugs que de outra forma poderiam passar despercebidos.

O ASSERT pode ser usado de forma isolada ou associado a um CHECKPOINT GROUP conforme foi já explicado [aqui][1].

O Abapinho saúda-vos.

   [1]: {{< ref "saabs-assertar-primeira" >}}
