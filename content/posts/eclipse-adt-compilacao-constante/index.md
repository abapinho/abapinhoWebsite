---
slug: eclipse-adt-compilacao-constante
title: No Eclipse o compilador não é preguiçoso
description: eclipse-adt-compilacao-constante
date: 2024-03-25T09:00:00Z
tags: [eclipse]
categories: [artigos]
keywords: [Eclipse ADT compilador]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Ainda usas o SAPGUI em vez do Eclipse ADT? Prepara-te para ser achincalhado.

<!--more-->

Nesta nova série de artigos, vou dar-te, querido leitor, um conjunto de razões pelas quais me considero no direito de gozar contigo e dizer mal de ti aos outros se ainda usares o SAPGUI e a `SE80` e a `SE24` em vez do Eclipse ADT.

Eu nem gosto muito do Eclipse. Sou mais fã do Visual Studio Code. Mas ainda assim o Eclipse é 10x melhor que o SAPGUI. E eu vou tentar mostrar-te porquê.

## No SAPGUI

Quando estás a escrever código, o compilador está a dormir. Só acorda quando gravas, activas ou verificas o código. E aí o que acontece é lamentável: provavelmente porque está ensonado, ele pára assim que encontra o primeiro erro. Enquanto não corrigires esse primeiro erro, o compilador não te reporta mais nenhum. Se o teu código tiver 50 erros só sais dali depois de o teres tentado activar 50 vezes, corrigindo um erro de cada vez. Tão triste que dói.

Além disso, por alguma razão muito estranha, ele só mostra os _warnings_ se existir pelo menos um erro no código. Se não existirem erros, não mostra _warnings_ mesmo que o código esteja cheio deles. Porquê? Não sei. Mas é muito pateta.

## No Eclipse ADT

O compilador está sempre a trabalhar. É incansável. Enquanto estás a programar, todos os erros e _warnings_ são discretamente assinalados na linha respectiva. Estes sinais estão constantemente a actualizar-se. Basta passares o rato por cima de um deles para ver a descrição do problema. Alternativamente, podes abrir a janela de _Problems_ para ver uma lista com todos. À medida de que os vais corrigindo, eles vão desaparecendo. Se não existir nenhum, à partida sabes que podes activar o código com sucesso. Simples. Isto sim, faz sentido.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.
