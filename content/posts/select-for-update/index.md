---
slug: select-for-update
title: SELECT FOR UPDATE
description: Se vais actualizar a seguir usa SELECT FOR UPDATE
date: 2022-05-23T09:09:09+01:00
tags: [sql, database]
categories: [dicas]
keywords: [SELECT FOR UPDATE]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Quando vais modificar registos na base de dados é comum fazeres primeiro um `SELECT` para ver como as coisas são e depois então fazeres `UPDATE` como as coisas serão.

<!--more-->
Mas o ABAP é como um ovo de Fabergé. Quanto mais olhas mais pormenores encontras. Agora encontrei isto:

Quando fazes um `SELECT` já sabendo que vais fazer `UPDATE` no fim podes logo acrescentar `FOR UPDATE` e assim o ABAP te faz logo o favor de bloquear para escrita os registos seleccionados.

Exemplificando:

```ABAP
SELECT calorias FROM bolos WHERE id = 'bolodearroz' FOR UPDATE.
```

Tem algumas [regras e limitações][2]. Mas mesmo assim isto é bueda ya, não?

Obrigado Jason Pier pela [foto][1].

O Abapinho saúda-vos.

[1]: https://www.flickr.com/photos/jasonpier/5519425731/
[2]: https://help.sap.com/saphelp_nwce72/helpdata/en/4b/03fb92ea162593e10000000a42189b/content.htm
