---
slug: reconstantes
title: Reconstantes
description: Reconstantes
date: 2025-02-17T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O meu projecto tem constantes espalhadas por todo o lado, com nomes confusos ou errados. Uma salgalhada. Encontrei uma forma de reorganizar e rearrumar as constantes para que o código novo possa usar constantes bonitas sem espatifar o código antigo que pode continuar a usar as confusas.

<!--more-->
Há centenas de constantes em vários includes, classes e interfaces. E todas elas são utilizadas em dezenas e mesmo centenas de sítios.

Já por várias vezes, ao escrever código novo, considerei começar a arrumá-las, mas sempre abandonei a ideia porque isso obrigaria a mexer em código antigo que continua a usá-las. Também considerei criar cópias das antigas já no sítio certo e com um nome decente, mas também abandonei essa ideia porque ficariam duplicadas, o que seria perigoso e trapalhão.

Hoje, assim de repente sem mais nem menos, lembrei-me de uma forma de conseguir o melhor dos dois mundos: ter novas arrumadas sem mexer nem duplicar as antigas. Imagina que tens estas constantes antigas:

```abap
(class ZCL_OLD)

CONSTANTS c_status_001 TYPE i VALUE '001'. " Start
CONSTANTS c_Status_002 TYPE i VALUE '002'. " End
```

Podes fazer isto:

```abap
(class ZIF_NEW)

CONSTANTS:
  BEGIN OF c_status,
    start TYPE i VALUE zcl_old=>c_status_001,
    end   TYPE i VALUE zcl_old=>c_status_002,
  END OF c_status.
```

Topas?

Crias novas constantes, com o nome certinho, no sítio certo, e no `VALUE` fazes referência à antiga.

No dia em que o código antigo deixar de usar a antiga podes facilmente apagá-la e a nova constante passa a definir o valor em vez de apontar para a antiga. Até lá vives com as duas: o código novo usa a nova, o código velho continua a usar a antiga, mas estão explicitamente ligadas uma à outra.

O Abapinho saúda-vos.
