---
title: 'Não farás SELECT *'
slug: nao-facas-select-asterisco
date: 2014-09-04 11:25:03
tags: [performance, sql]
categories: [boaspracticas]
wordpressId: 2731
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Tenta seleccionar sempre apenas os campos que vais realmente usar. Escolher todos é um desperdício de recursos. Excepção feita ao uso das FM *_SINGLE_READ que, embora leiam os campos todos, fazem cache dos dados, sendo por isso ainda assim mais rápidos de usar quando usados múltiplas vezes com a mesma chave.
Se queres apenas verificar que um registo existe, selecciona apenas um campo, e se possível aquele que estás a usar como critério, evitando assim declarares uma variável extra. Exemplo: SELECT KUNNR INTO V_KUNNR FROM KNA1 WHERE KUNNR = V_KUNNR.
{{< ref "select-todos-os-campos" >}}
