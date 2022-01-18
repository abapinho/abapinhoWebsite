---
title: 'Gosto do LIKE'
slug: gosto-do-like
date: 2013-06-17 09:00:16
tags: [estilo]
categories: [dicas]
wordpressId: 2330
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Nos maus velhos tempos em que o ABAP era ainda mais antiquado do que é hoje, as declarações de variáveis eram quase todas feitas com LIKE e referenciadas a campos de tabelas:


{{< highlight ABAP >}}
DATA: V_KUNNR LIKE KNA1-KUNNR.
{{< /highlight >}}

<!--more-->

Depois a SAP caiu em si, começou a perceber o disparate que isto era e lentamente foi convencendo as pessoas a fazer declarações tipificadas, introduzindo o TYPE:


{{< highlight ABAP >}}
DATA: V_KUNNR TYPE KUNNR.
{{< /highlight >}}

E agora que o TYPE já está vulgarizado e que até se tornou obrigatório quando se usa ABAP OO, o LIKE volta a atacar, agora com uma nova filosofia. Filosofia da qual eu sou partidário.

Se tiveres uma variável e depois quiseres declarar outra variável auxiliar que vais usar relacionada com a outra, o último grito em estilo de programação ABAP é recorreres ao LIKE. Mas desta vez fazendo referência à variável e não ao tipo:


{{< highlight ABAP >}}
DATA: V_KUNNR TYPE KUNNR,
      V_KUNNR_AUX LIKE V_KUNNR.
{{< /highlight >}}

Isto torna mais claro o código pois permite, olhando apenas para a declaração de dados, entender melhor as relações entre as várias variáveis declaradas.

O caso mais comum será o LIKE LINE OF que já foi tratado antes aqui no Abapinho:


{{< highlight ABAP >}}
DATA: T_KUNNR TYPE STANDARD TABLE OF KUNNR,
      T_KUNNR_AUX_ LIKE T_KUNNR               " tabela auxiliar
      S_KUNNR LIKE LINE OF T_KUNNR.           " linha auxiliar
{{< /highlight >}}

Portanto, sempre que declarares variáveis auxiliares, usa o LIKE para que fique claro com qual estão relacionadas.

O Abapinho saúda-vos.
