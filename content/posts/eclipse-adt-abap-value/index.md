---
slug: eclipse-adt-abap-value
title: O Eclipse converte dados em VALUE
description:
date: 2024-11-18T09:00:00Z
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT VALUE]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Às vezes é preciso pegar em dados da base de dados e replicá-los declarativamente em ABAP utilizando o comando VALUE. Para, por exemplo, construir testes unitários ABAP Unit.

<!--more-->

## No SAPGUI

No SAPGUI nada feito. Ficas quieto ou fazes à mão: exportas para CSV e depois constróis o `VALUE()` à pata.

## No Eclipse ADT

Abres o Data explorer para ver o conteúdo de uma tabela ou de uma query de SQL. Tens duas hipóteses: com o botão direito podes converter o conteúdo todo da tabela num comand `VALUE()` assim:

![Exportar para comando VALUE](images/value1.png)

Alternativamente, podes usar om menu em cima à direita:

![Exportar para comando VALUE](images/value2.png)

E o resultado é isto:

```text
VALUE #(
( MANDT = '100' BNAME = 'SAP*' STCOD = '' SPLD = '' SPLG = ''  )
( MANDT = '100' BNAME = 'SAP_SYSTEM' STCOD = '' SPLD = '' SPLG = ''  )
( MANDT = '100' BNAME = 'SAP_SUPPORT1' STCOD = '' SPLD = '' SPLG = ''  )
( MANDT = '100' BNAME = 'SAP_WFRT' STCOD = '' SPLD = '' SPLG = ''  )
 )
```

E pronto, é só fazer copy+paste disto para o ABAP Unit e já está.

Obrigado Aurélien Albert pela dica.

O Abapinho saúda-vos.
