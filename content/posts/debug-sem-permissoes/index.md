---
title: 'Debug em utilizador sem permissões para debug'
slug: debug-sem-permissoes
date: 2018-03-05 09:00:48
tags: [debug, segredo]
categories: [dicas]
wordpressId: 3948
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['debug sem permissões']
---
Num sistema bem protegido, os utilizadores não têm permissões para debug. Mas muitas vezes isso complica a vida dos ABAPers que, ao quererem resolver um problema desse utilizador, não podem fazer debug à sua sessão.

Mas há uma forma legítima, ainda que pouco óbvia, de contornar o problema.

<!--more-->

No teu computador crias um break-point externo em nome do utilizador.
No computador do utilizador em que precisas de fazer debug, na sessão GUI do utilizador escreves:


{{< highlight ABAP >}}
/hext user = NOMEDOTEUUTLIZADOR
{{< /highlight >}}

E isto diz ao SAP que quem vai fazer debug és tu. Mal o utilizador executa este comando abre-se uma sessão de debug no teu computador.

Obrigado Sérgio Serra pela dica.

O Abapinho saúda-vos.
