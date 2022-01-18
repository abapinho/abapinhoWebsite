---
title: 'Reutilizarás, não reescreverás'
slug: reutilizaras-nao-reescreveras
date: 2015-05-04 09:00:28
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2717
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Se o mesmo pedaço de código estiver repetido mais do que uma vez, pergunta-te porquê e tenta evitá-lo, criando uma rotina reutilizável.
Se, num programa, existir mais do que um SELECT para a mesma tabela, tenta fundi-los num único. Por vezes a utilização inteligente de RANGES para unificar parâmetros pode evitar a necessidade de múltiplos SELECTs a uma mesma tabela.
Se o mesmo código for usado em dois programas diferentes tenta, ao invés, mover esse código para uma classe que possa ser partilhada pelos dois.
{{< ref "mais-ranges-menos-selects" >}}
