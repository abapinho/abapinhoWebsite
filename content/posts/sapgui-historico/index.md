---
title: 'O histórico do SAPGui não funciona ainda que activo?'
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
Já te aconteceu o SAPGui não guardar um histórico dos valores que vais introduzindo nos vários campos ainda que, nas configurações, a opção de Histórico esteja activa?

<!--more-->

![SAPGui - Opções - Histórico][1]

Este aparente paradoxo pode dever-se ao facto de, no _SAP Logon_ , a tua ligação a este servidor SAP estar configurada como "conexão lenta (tráfego de rede reduzido)" em vez de "conexão rápida (LAN)". Nesse caso o histórico é automaticamente desactivado.

![SAP Logon - Conexão - Rede][2]

Obscuro.

(Obrigado a [unaluzazul][3] pela foto)

O Abapinho saúda-vos.

   [1]: images/sapgui-opcoes-historico.png (SAPGui - Opções - Histórico)
   [2]: images/saplogon-coneccao-rede.png (SAP Logon - Conexão - Rede)
   [3]: http://www.flickr.com/photos/unaluzazul/2484113976/
