---
title: 'The SAPGui history does not work even when active?'
slug: sapgui-historico
date: 2012-02-06 10:00:01
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 1325
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Has it ever happened to you that SAPGui does not store a history of values that you input to various fields even though the History option is actived in the settings?

<!--more-->

![SAPGui - Opções - Histórico][1]

This apparent paradox may be due to the fact that in _SAP Logon,_ your connection to this SAP server is set as "slow connection (reduced network traffic)" instead of "fast connection (LAN)." In this case the history is automatically disabled.

![SAP Logon - Conexão - Rede][2]

Obscure.

(Thanks to [unaluzazul][3] for the photo)

Greetings from Abapinho.

   [1]: images/sapgui-opcoes-historico.png (SAPGui - Opções - Histórico)
   [2]: images/saplogon-coneccao-rede.png (SAP Logon - Conexão - Rede)
   [3]: https://www.flickr.com/photos/unaluzazul/2484113976/
