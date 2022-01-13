---
title: 'Apagar pacotes que não querem ser apagados'
slug: apagar-pacotes-que-nao-querem-ser-apagados
date: 2014-06-23 08:30:48
tags: []
categories: [dicas]
wordpressId: 2804
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando tentas apagar um pacote no qual já criaste objectos que entretanto apagaste e o pacote aparente estar vazio quando visto na SE80, quando o tentas apagar não dá porque diz que o pacote ainda contém objectos.

Por alguma razão parva, a SE80 não mostra todo o tipo de objectos associados aos pacotes. Além disso, muitas vezes ao apagar um objecto a entrada desse objecto não é correctamente apagada. O SAP está cheio de falhas. Mas é o que temos, é ele que nos dá o pão, não vamos dizer muito mal dele.

O Abapinho dá-te a solução.

<!--more-->

Na transacção SE03 escolhe "Catálogo de objecto” e “Modificar entradas de catálogo de objectos”. Depois, em “Outras restrições”, introduz o pacote que queres apagar e executa.

Aqui sim, tens uma lista de todos os objectos realmente associados ao pacote que queres apagar.

Presumimos que todos esses objectos já foram apagados. Se algum não foi, terá de ser apagado directamente na transacção própria para esse tipo de objecto.

Para os objectos apagados tens duas hipóteses:

  * Se o objecto foi apagado em desenvolvimento mas ainda tem de ser transportado para os outros sistemas, é importante que exista uma entrada no catálogo para esse objecto. Aí o mais simples é tornar a criá-lo no pacote a apagar, movê-lo para outro pacote registando essa mudança numa ordem de transporte que vá ser transportada, e depois tornar a apagá-lo;

  * Se o objecto nunca foi transportado, então basta apagá-lo da ordem de transporte onde se encontra.

Uma vez feito isto, é só apagar uma a uma as linhas que ainda se encontrarem na lista acima referida obtida a partir da SE03.

Quando a lista já só tiver a entrada que corresponde ao próprio pacote já podes ir à SE80 apagá-lo.

O Abapinho saúda-vos.
