---
title: 'Procurar texto numa WebDynpro'
slug: procurar-texto-numa-webdynpro
date: 2015-03-23 09:00:31
tags: [segredo, webdynpros]
categories: [artigos]
wordpressId: 3025
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A SAP não sabe fazer as coisas bem à primeira. As WebDynpros são um bom exemplo disso. Aquilo nem sequer permite pesquisar texto. É triste.

Felizmente o Sérgio Fraga descobriu uma forma, ainda que rebuscada:

<!--more-->

  1. Vais à transacção SE24 e executa o seguinte método:
CL_WDY_WB_NAMING_SERVICE=>GET_CLASSNAME_FOR_COMPONENT();

  2. No parâmetro de entrada metes o nome da WebDynpro que queres pesquisar. O resultado é o nome de uma classe gerada. Um nome feio.

  3. Copias esse nome feio e vais metê-lo na SE24 e fazer F7 para entrar na classe. A classe é aparentemente simples. Mas deve ter estar cheia de cordelinhos invisíveis porque...

  4. Uma vez dentro da SE24 fazes CTRL-F ou carregas no botão da pesquisa e introduzes o texto que queres pesquisar;

  5. Aparece-te uma lista de resultados e, magicamente, podes navegar para o sítio exacto na WebDynpro onde cada resultado se encontra.

O bizarro e misterioso é que a classe gerada parece não ter lá código nenhum. Mas que ele encontra, encontra. E isso chega-me.

Obrigado Sérgio Fraga pela dica.

O Abapinho saúda-vos.
