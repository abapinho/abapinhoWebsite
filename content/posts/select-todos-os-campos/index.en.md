---
title: '<!--:pt-->SELECT com mais olhos que barriga<!--:-->'
slug: select-todos-os-campos
date: 2010-11-21 22:56:36
tags: []
categories: [artigos]
wordpressId: 486
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Embora seja evidente que, ao fazer selecções de dados de uma tabela da base de dados, devemos ter o cuidado de escolher apenas os campos que necessitamos, a verdade é que há muito boa gente que não se dá a esse trabalho e manda vir tudo.

Mediremos aqui a diferença real entre as duas abordagens.

<!--more-->
A transacção SE38 tem um ecrã onde podemos fazer experiências correndo pequenos pedações de código ABAP. A miserável tradução em português chama-lhe "Dicas e sugestões para performance de ABAP Objects" e pode ser acedido a partir do menu SE38 -> Ambiente -> Exemplos -> Exemplos de performance.

Lá encontram duas janelitas que permitem correr dois programas lado a lado. Experimente-se correr os seguintes códigos:

**Muitos registos**

Neste primeiro exemplo todos os campos da tabela KNA1 são carregados para a tabela interna:

{{< highlight ABAP >}}
data: tab type standard table of kna1.
select * from kna1 into table tab.
{{< /highlight >}}

Já no segundo exemplo, carrega-se apenas o campo KUNNR:

{{< highlight ABAP >}}
data: tab type standard table of kunnr.
select kunnr from kna1 into table tab.
{{< /highlight >}}

E os resultados são:
\- todos os campos: 1053 microsegundos
\- só o KUNNR: 17 microsegundos

Ou seja, pedir todos os campos da tabela demorou 60 vezes mais do que pedir apenas o KUNNR.

**Um único registo**

Se no caso de selecções de vários registos ainda vai sendo comum ter-se o cuidado de fazer esta filtragem, já no caso da selecção de apenas um registo o mundo ABAP está atafulhado de SELECT SINGLE *. Veja-se então o que acontece na escolha de apenas um registo:

Neste exemplo carregam-se todos os campos do primeiro registo da KNA1:

{{< highlight ABAP >}}
DATA: dat TYPE kna1.
SELECT SINGLE * INTO dat FROM kna1 WHERE kunnr = '0000000001'.
{{< /highlight >}}

Já aqui só se carrega o campo KUNNR do primeiro registo da KNA1:

{{< highlight ABAP >}}
DATA: dat TYPE kunnr.
SELECT SINGLE kunnr INTO dat FROM kna1 WHERE kunnr = '0000000001'.
{{< /highlight >}}

E os resultados são:
\- todos os campos: 390 microsegundos
\- só o KUNNR: 209 microsegundos

Valente diferença, não? Ler apenas um campo é 2x mais rápido do que ler todos.

Vá, vamos lá a deixar de ser preguiçosos. Nada de mandar vir tudo para depois não usar. Toca a escolher só o que interessa.

O Abapinho saúda-vos.
