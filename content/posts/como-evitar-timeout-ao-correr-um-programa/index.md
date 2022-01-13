---
title: 'Como evitar <i>timeout</i> ao correr um programa'
slug: como-evitar-timeout-ao-correr-um-programa
date: 2015-11-02 09:00:52
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 3252
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Normalmente os sistemas SAP têm definido um tempo limite para que um programa possa correr interactivamente. Se o programa demorar mais ocorre um erro de execução (vulgo _dump_ ).

<!--more-->

Se souberes que o teu programa corre o risco de demorar mais do que o permitido podes usar o módulo de função TH_REDISPATCH para reiniciar o contador do tempo limite de execução. Só tens de garantir que o teu programa executa esta função de vez em quando.

Um truque antigo passava por usar o indicador de progresso (FM SAPGUI_PROGRESS_INDICATOR) mas consta que deixou de ter este efeito secundário.

Obrigado André Silva pela dica.
