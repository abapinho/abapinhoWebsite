---
slug: eclipse-adt-mudanca-de-contexto
title: No Eclipse ADT não mudas constantemente de contexto
description: No SAPGUI estás sempre a mudar de contexto
date: 2024-04-01T09:00:00Z
tags: [eclipse]
categories: [artigos]
keywords: [Eclipse ADT context switching]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Cada vez que trocas de contexto, perdes ligeiramente o fio à meada. É a natureza humana. Portanto, quanto menos o fizeres, melhor.

<!--more-->

## No SAPGUI

A `SE24` clássica só mostra uma coisa de cada vez. Se estás num método e queres ver outro tens de mudar de contexto. E, como em cada mudança de contexto o SAPGUI tem de falar com o servidor, há sempre um atraso que pode ser irrelevante ou substancial, dependendo da rede e do sistema. Isto não era muito grave quando se programava tudo num único include com centenas de linhas. Mas se fores um ABAPer moderno, vais modularizar o código da classe em vários métodos. E agora tu dizes: mas hoje em dia podes mudar para o _Source mode_ e ver o código todo de uma classe. É verdade. E é assim que eu uso sempre a `SE24`. Mas se, além de moderno, fores um ABAPer sofisticado, vais querer dividir o código por várias classes. E aí terás sempre de mudar de contexto. OK, o SAPGUI permite abrir 5 janelas por sessão, e isso até pode funcionar quando só estás a trabalhar em 3 ou 4 métodos fixos. Mas se, além de moderno e sofisticado, fores um ABAPer dinâmico, vais estar constantemente a fazer coisas como espreitar uma estrutura na `SE11` para ver qual o elemento de dados de um determinado campo ou consultar o interface de um método para confirmar quais os parâmetros de entrada, etc. E aí, querido leitor, o SAPGUI só te vai atrapalhar.

## No Eclipse ADT

Por defeito, o Eclipse ADT mostra-te a classe inteira. Podes abrir dúzias de classes em vários separadores. Além disso, consegues facilmente subdividir o ecrã em várias janelas adjacentes, horizontal e verticalmente, para veres várias coisas ao mesmo tempo. Se estiveres a trabalhar em dois métodos diferentes da mesma classe, podes fazer _split Window_ e a janela subdivide-se em dois para mostrar duas zonas distintas da mesma classe. Portanto, com muita facilidade podes organizar o ecrã para te mostrar ao mesmo tempo tudo aquilo em que estiveres a trabalhar. O que não estiver à vista mas estiver aberto noutros separadores está à distância de um clique ou de um atalho de teclado, instantaneamente, sem necessidade de falar com o servidor.

Isto já é fantástico, não é? Mas há mais.

Se estiveres com o código de uma classe aberto e quiseres saber o elemento de dados de uma variável ou o interface de um método (ou muitas outras coisas) basta colocares o cursor em cima dele se fizeres `F2` aparece-te um popup maneirinho com todos os detalhes de que precisas. O código, esse continua lá quietinho.

Ainda há mais.

Podes fazer _where-used_ em cima de qualquer coisa no código. O código continua lá porque os resultados do _where-used_ aparecem ao lado, na sua própria janela. O mesmo para _ABAP Test Cockpit_, execução de _ABAP Units_, _Package validation_, etc.

Sempre sempre sempre sem mudares de contexto.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.
