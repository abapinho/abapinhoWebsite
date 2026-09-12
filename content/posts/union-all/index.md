---
slug: union-all
title: Usa UNION ALL sempre que possível
description: Usa UNION ALL sempre que isso for possível. É mais rápido.
date: 2026-09-14T09:00:00+01:00
tags: [cds]
categories: [dicas]
keywords: [UNION ALL]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Em SQL usa-se `UNION` para somar o resultado de duas _queries_. Mas muitas das vezes devia usar-se `UNION ALL` ao invés.
<!--more-->

Sabias que o `UNION`, depois de somar os dois resultados, faz uma operação de deduplicação para garantir que o resultado não tem registos repetidos? E isso dá bastante trabalho.

Em boa parte dos casos, nós já sabemos à partida que os resultados são mutuamente exclusivos. Por exemplo quando seleccionamos dados distintos:

```sql
SELECT id FROM ZDOC_HEADER
UNION
SELECT id FROM ZDOC_ITEM
```

Neste caso, faz sentido evitar que o sistema perca tempo (e é muito!) a deduplicar algo que já sabemos não ter duplicados. E nesses casos usas `UNION ALL`:

```sql
SELECT id FROM ZDOC_HEADER
UNION ALL
SELECT id FROM ZDOC_ITEM
```

Dependendo da quantidade de registos, a _query_ pode facilmente ficar 20% mais rápida.

O Abapinho saúda-vos.
