---
title: 'SELECT de um conjunto de valores conhecidos'
slug: select-de-um-conjunto-de-valores-conhecidos
date: 2015-12-14 09:00:36
tags: [sql]
categories: [dicas]
wordpressId: 3343
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Pedem-te para seleccionares registos cujo critério é um conjunto de meia dúzia de códigos que são conhecidos e nunca vão mudar. Sabias que podes fazer tudo logo no SELECT?

<!--more-->

{{< highlight ABAP >}}
SELECT * INTO T_T005T
FROM T005T
WHERE LAND1 = I_LAND1 AND
           SPRAS IN ( 'PT', EN' ).
{{< /highlight >}}

Compete-me lembrar-te que fixar valores em programas não é a melhor das ideias por isso usa isto com tino.

Obrigado Sérgio Fraga pela dica.

O Abapinho saúda-vos.
