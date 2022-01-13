---
title: 'Testar na SE37 não grava dados? Grava.'
slug: se37-gravar
date: 2009-05-20 10:40:40
tags: [segredo]
categories: [dicas]
wordpressId: 75
draft: false
---
Uma forma prática de aprender a usar um módulo de funções ou verificar se este nos é útil é através da funcionalidade de teste da transacção SE37. Escolhe-se o módulo de função, faz-se F8 (Executar) e tem-se uma forma interactiva de testar uma função.

Isto é óbvio.

O que não será óbvio para toda a gente é que este teste não faz COMMIT à transacção e, por isso, qualquer alteração que a função possa fazer à base de dados - como gerar um documento por exemplo - não é gravada.

Bem, se isto também é óbvio para muita gente, menos óbvia será talvez a solução para esta limitação:

  1. Escolher a função e fazer F8 para a testar;

  2. Preencher os parâmetros desejados e fazer F8 novamente para a executar;

  3. Seleccionar a opção de menu "Módulos de Função->Outro Módulo de Função";

  4. Escolher o módulo de função "BAPI_TRANSACTION_COMMIT" e fazer F8.

Agora as alterações feitas pela primeira função estão gravadas na base de dados.

O Abapinho saúda-vos.
