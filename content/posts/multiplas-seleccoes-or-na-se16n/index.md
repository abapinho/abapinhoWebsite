---
title: 'Múltiplas selecções OR na SE16N'
slug: multiplas-seleccoes-or-na-se16n
date: 2015-08-03 09:00:15
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 3156
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Se tu és daquelas pessoas que ainda usa a SE16, este artigo não é para ti. Se continuares a ler corres o risco de encontrar ainda mais uma razão para finalmente passares a usar a SE16N (como se todas as outras não fossem já suficientes).

Imagina que queres seleccionar todos os materiais que tenham “PREGO" no nome e que sejam do tipo FERRAGENS e além disso todos os materiais que tenham “GUARDANAPO" no nome e que sejam do tipo COMIDA. Ou seja, não deverá aparecer o “PREGO_NO_PAO” nem o “GARDANAPO_PAPEL”. O que tu queres é isto (faz de conta):

(MATNR = “PREGO%” AND MTART = “FERR” ) OR (MATNR = “GUARDANAPO%” AND MAKT = “COMI” )

Como bem sabes, numa utilização normal (sem recorrer a isto que te vou mostrar) da SE16N terias de a executar duas vezes e cruzar manualmente a informação porque o ecrã de selecção não dá para fazer ORs.

Ou dá?

<!--more-->

Dá.

  1. Começa por activar a visão técnica no menu “Suplementos -> Visão técnica ON”;

  2. Depois, introduz a primeira parte da condição no ecrã de selecção normal;

  3. Em seguida vai novamente ao menu “Suplementos” e escolhe a opção “Entr.Múltipla”. Vai saltar uma janela com um novo ecrã de selecção vazio;

  4. Preenche a segunda parte da condição neste novo ecrã de selecção;

  5. Ainda podes complicar mais e introduzir mais critérios se carregares nas setinhas para a direita e para a esquerda. Podes reparar que no topo da janela há um número a identificar qual a tela de selecção em que estás;

  6. Quando estiveres satisfeito executa e ser-te-á apresentada a união dos resultados dos vários ecrãs de selecção.

Obrigado Carlos Constantino pela dica.

O Abapinho saúda-vos.
