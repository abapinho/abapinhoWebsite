---
title: 'Passar tabelas internas por valor é bom'
slug: passar-tabelas-internas-valor-bom
date: 2016-07-11 09:00:21
tags: [performance]
categories: [dicas]
wordpressId: 3578
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando um método devolve um valor como RETURNING este é sempre passado por valor e não por referência. Muitas vezes faço métodos que devolvem tabelas internas, algumas bastante grandes. Mas sempre me preocupou a ideia de que, como está a ser devolvida por valor, o ABAP devolva uma cópia da tabela interna, algo que pode ter impacto na performance e na memória que o programa gasta.

Felizmente fiquei recentemente a saber que não é assim.

<!--more-->

[Nesta discussão na SCN][1] um utilizador chamado começa por manifestar esta preocupação e acaba por descobrir ele próprio, através do _debugger_ que, mesmo quando uma tabela é devolvida por valor, não é feita nenhuma cópia (ou seja, é como se fosse passada por referência) até ao momento em que o seu conteúdo seja alterado. Caso isso aconteça o SAP encarrega-se então de, apenas nesse momento, criar uma cópia e alterar a cópia, mantendo a original inalterada. É o melhor dos dois mundos.

Mais à frente na discussão, outro utilizador que parece pertencer à SAP diz que este mecanismo tem nome e tudo e se chama _table sharing_.

A conclusão é que é rápido e eficiente passar tabelas internas por valor. Bom saber. Se já se tinham preocupado com isto podem ficar descansados. Se tal coisa nunca vos tinha passado pela cabeça então ficam a saber que nem têm de chegar a preocupar-se.

O Abapinho saúda-vos.

   [1]: https://scn.sap.com/thread/280115
