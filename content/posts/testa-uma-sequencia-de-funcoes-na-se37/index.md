---
title: 'Testa uma sequência de funções na SE37'
slug: testa-uma-sequencia-de-funcoes-na-se37
date: 2018-07-09 09:00:17
tags: [se37, segredo, testes]
categories: [dicas]
wordpressId: 4008
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'testar sequência de funções'
---
Podia jurar que já tinha feito um post sobre isto mas não consigo encontrá-lo por isso aqui vai.

Há funções que guardam dados globais que serão depois usados por outra função do mesmo grupo. Ora se quiseres testar as duas juntas é fundamental que corram sequencialmente dentro da mesma transacção.

Toda a gente sabe que a transacção SE37 permite testar uma função. O que pouca gente sabe é que a transacção SE37 permite testar uma sequência de funções dentro da mesma transacção. Quem não sabe isto normalmente acaba por criar um pequeno programa de testes para chamar as várias funções em sequência. Fica agora a saber como o pode evitar.

<!--more-->

  * No primeiro ecrã da SE37 vai ao menu Function Module > Execute > Test sequences;

  * Aparece-te um popup com uma lista de campos onde podes introduzir vários nomes de módulos de função;

  * Faz F8 e aparece-te o ecrã com os parâmetros da primeira. Preenche-os;

  * Faz F8 para testar a primeira função. Obterás os resultados desta

  * Faz F3 para recuar e, para tua surpresa, aparecerá o ecrã com os parâmetros da segunda função. Preenche-os;

  * Faz F8 para testar a segunda função. Obterás os resultados desta

E assim conseguiste matar várias funções com uma cajadada só.

Um clássico exemplo da necessidade disto é uma função que precisa de um COMMIT. A ferramenta de teste de funções não faz COMMIT. Uma solução é fazer uma sequência da função que queres testar e da BAPI_TRANSACTION_COMMIT. Zás!

O Abapinho saúda-vos.
