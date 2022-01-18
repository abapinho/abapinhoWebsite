---
title: 'Função para gerar bonecada'
slug: funcao-para-gerar-bonecada
date: 2013-11-11 09:00:47
tags: [sapgui]
categories: [dicas]
wordpressId: 2460
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Bonecada fica sempre bem num relatório. Num SAPGui que é um tédio azulado, quanto mais cores e bonecos melhor. O Luís Rocha mostrou-me uma função muito conveniente para atafulhar um relatório com ícones.

<!--more-->

A função chama-se ICON_CREATE e usa-se, por exemplo, assim. Primeiro, no ecrã de selecção, declara um botão:


{{< highlight ABAP >}}
SELECTION-SCREEN PUSHBUTTON (40) isel_all VISIBLE LENGTH 4.
{{< /highlight >}}

E depois no evento INITIALIZATION define o seu texto. Mas em vez de meteres um texto metes o resultado da função:


{{< highlight ABAP >}}
INITIALIZATION.

  CALL FUNCTION 'ICON_CREATE'
    EXPORTING
      name   = icon_select_all
    IMPORTING
      result = isel_all.
{{< /highlight >}}

O ICON_SELECT_ALL é o nome do ícone. Podes encontrar lista de todas as possibilidades na table ICON.
Experimenta fazer uma SE16N à tabela ICON e vais ver quão bonita é essa tabela.

No fundo a única coisa que esta função faz é converter o ID do ícone na cadeia de caracteres que o o define no SAP. Mas não é por isso que é menos práctica.

Dica extra: também podes usá-la para escrever ícones no ecrã com o WRITE. Tentei usá-lo para escrever uma carta de amor à minha namorada mas não encontrei o ícone do coração. É triste. Mas ainda assim há lá bonecos suficientes para fazeres uma banda desenhada.

O Abapinho saúda-vos.
