---
title: 'Enviar relatório ou ordem de spool por e-mail'
slug: relatorio-por-email
date: 2012-02-13 10:00:35
tags: []
categories: [artigos]
wordpressId: 1430
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Este post inaugura uma nova categoria no Abapinho: Código. Os posts desta categoria apresentarão programas úteis prontos a correr.

Este serve para enviar por e-mail o resultado de qualquer relatório ou ordem de spool. O programa apresentado faz uso da nova BCS (Business Communication Services) através da classe CL_BCS em vez do velho e cansado SO_DOCUMENT_SEND_API1, paz à sua alma.

O conteúdo pode ser enviado no corpo do email, como um anexo TXT ou como um anexo HTML, sendo que este último até vai com as cores todas certinhas e tudo. Disfruta-o. Copia-o cegamente e usa-o ou disseca-o e aprende como usar a CL_BCS. Pelo meio, se te apetecer, ainda podes aprender como usar classes locais e como usar classes de excepção.

<!--more-->

Uma classe local é mais simples de apresentar aqui no Abapinho mas se quiseres transforma numa classe global através da SE24 conforme o Abapinho já [explicou há uns tempos atrás][1] para a poderes usar a partir de qualquer lado.

[Código no GitHub][2].

Textos do ecrã de selecção:

P_SUBJ| Assunto
---|---

S_REC| Recipientes

P_SUBMIT| Enviar relatório

P_REP| Relatório

P_VAR| Variante

P_SPOOL| Enviar ordem de spool

P_RSPOID| ID da ordem de spool

P_TEXT| No corpo do e-mail

P_TEXTA| Anexo TXT

P_HTMLA| Anexo HTML

O Abapinho saúda-vos.

   [1]: {{< ref "importar-classes-locais" >}}
   [2]: https://github.com/abapinho/send_report_by_email
