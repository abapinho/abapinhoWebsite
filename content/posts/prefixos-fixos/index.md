---
slug: prefixos-fixos
title: Prefixos fixos
description: prefixos-fixos
date: 2023-05-01T09:00:00+01:00
tags: [segredo]
categories: [artigos]
keywords: [packages]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

É muito fácil fazer asneira com os nomes dos objectos em SAP. Encontrei recentemente uma forma de minimizar esse problema: definir regras para fixar prefixos por pacote para determinados tipos de objecto.

<!--more-->

Estás a fazer o desenvolvimento `DEV1`. A primeira coisa que fazes (porque és uma [pessoa][1] [asseadinha][2]) é criar um pacote dedicado a esse desenvolvimento. Chamas-lhe, por exemplo, `ZDEV1`. A partir daqui (e porque, infelizmente, o SAP ainda não tem nenhuma forma decente de definir _namespaces_) todos os objectos deveriam ter um prefixo que os associe a `DEV1`:

- Classes: `ZCL_DEV1_*`
- Tabelas: `ZDEV1_*`
- Funções: `Z_DEV1_*`
- Programas: `ZDEV1*`
- etc: `ZDEV1*`

Isto normalmente fica implícito e dependente da boa vontade de quem vier a seguir.

Mas há uma forma de fixar estas regras para o futuro: `SM30 V_TRESN`. Não é interessante? Podes definir prefixos por pacote e tipo de objecto.

Um exemplo para o nosso caso seria:

- Program ID: `R3TR`
- Object type: `CLAS`
- Name range: `ZCL_DEV1_`
- Package: `ZDEV1`
- Reservation type: `H`

O _reservation type_  tem 3 hipóteses mas só duas nos são úteis: _Package (D)_ e _Package hierarchy (H)_. A diferença é que o _package hierarchy_ é válido também para sub-pacotes e, como tal, parece-me o mais adequado à maior parte dos casos.

Um vez definido este prefixo, a `SE24` passará a dar erro caso se tente criar debaixo do pacote `ZDEV1` uma classe que não comece por `ZCL_DEV1_`. E assim garante-se que os nomes dos objectos do `DEV1` continuarão decentes.

O Abapinho saúda-vos.

[1]: {{< ref "pacotes-2-0" >}}
[2]: {{< ref "empacota-tudo" >}}
