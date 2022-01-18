---
title: 'Não implementarás código em user-exits'
slug: nao-implementaras-codigo-em-user-exits-badis-enhancements-etc
date: 2014-06-26 09:00:47
tags: [estilo, oo]
categories: [boaspracticas]
wordpressId: 2713
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Todo o código que colocares em user-exits (BADIs, enhancements, SMOD, etc.) deverá ser encapsulado.

  * É comum incluir num user-exit múltiplas partes independentes. Cada uma destas partes deverá ser encapsulada no seu próprio método. Mesmo que seja constituída por apenas uma linha de código;

  * Isto deve ser aplicado tanto a implementações novas como a alterações a código existente;

  * A necessidade de alteração de código existente deverá ser vista sempre como uma oportunidade para reorganizar em métodos código clássico existente, uma vez que este terá necessariamente de ser testado de novo;

  * Se uma classe associada com um determinado user-exit ainda não existir, deverás criar-lhe uma;

  * O nome da classe deve estar claramente relacionado com o nome do user-exit: Ex: no user-exit ZXF01U01 usa a classe ZCL_ZXF01U01;

<{{< ref "metodos-privados-em-badis" >}}>
<{{< ref "melhorar-os-melhoramentos" >}}>
