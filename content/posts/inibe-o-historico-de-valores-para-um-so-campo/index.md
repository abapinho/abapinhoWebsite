---
title: 'Inibe o histórico de valores para um só campo'
slug: inibe-o-historico-de-valores-para-um-so-campo
date: 2016-02-08 09:00:08
tags: [sapgui, secret]
categories: [dicas]
wordpressId: 3415
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['value history']
---
Normalmente o SapGUI memoriza os últimos valores introduzidos em cada campo. E isso costuma ser bom. Mas podes muito bem não querer que isto aconteça. (ex: no caso, improvável eu sei, de quereres introduzir valores pornográficos num determinado campo). Uma hipótese é desligar globalmente esta funcionalidade nas configurações do SapGUI.

Mas e se quiseres desligar apenas num campo? O Abapinho ensina-te.

<!--more-->

Fazes CTRL-clique em cima do campo em que queres inibir o histórico. Aparece-te um menu de contexto. Como usaste o CTRL além das opções normalmente associadas a esse campo aparecem-te algumas opções extra. Entre as quais três relacionadas com o histórico:

![disable_history][1]

Escolhe "Desactivar histórico" e a partir de agora este campo deixa de mostrar o histórico. Já podes introduzir esses valores pornográficos à vontade.

O Abapinho saúda-vos.

   [1]: images/disable_history.png
