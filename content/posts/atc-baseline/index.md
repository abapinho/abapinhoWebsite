---
slug: atc-baseline
title: Define uma ponto de partida para o ATC
description: Define uma ponto de partida para o ATC
date: 2025-10-20T09:00:00+01:00
tags: [atc]
categories: [artigos]
keywords: [ATC baseline]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Sabes que podes definir um ponto de partida para o ATC e que isso te permite correr o ATC em código legacy?

<!--more-->

Há anos que defendo que se deve correr sempre o ABAP Test Cockpit em cima de todo o código desenvolvido. Isso é simples de fazer em código novo. Mas, o que fazer no caso de alterações feitas em código antigo, herdado, com milhares de linhas cheias de erros?

Nesse caso podes usar uma funcionalidade do ATC chamada [Baseline][1]. Esta funcionalidade permite adicionar resultados de um "ATC run" à baseline de forma a que, em futuras execuções do ATC, esses resultados serão ignorados, considerados excluídos ou definidos como baixa prioridade, conforme assim se deseje.

Corres o ATC no teu código _legacy_ e depois adicionas os seus milhares de milhões de problemas ao _ATC Baseline_. A partir daqui podes correr o ATC à vontade em cima de código _legacy_ e ele só te vai reportar problemas novos, que não existam já no _baseline_ que definiste.

O Abapinho saúda-vos.

[1]: <https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_752/ba879a6e2ea04d9bb94c7ccd7cdac446/21f52fff7cef458b88e49c6087895162.html>
