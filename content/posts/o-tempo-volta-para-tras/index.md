---
title: 'Ó Tempo Volta Para Trás'
slug: o-tempo-volta-para-tras
date: 2012-04-02 10:00:08
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1583
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
"Ó tempo volta para trás
Dá-me tudo o que eu perdi
Tem pena e dá-me a vida
A vida que eu já vivi
Ò tempo volta p'ra trás
Mata as minhas esperanças vãs
Vê que até o próprio sol
Volta todas as manhãs" - António Mourão

Ó [Tony][1], é para já. Vou mostrar-te como podes voltar atrás no tempo.

<!--more-->

Estás tu muito bem a fazer debug e, sem querer, avanças demais. Querias ter mudado um parâmetro antes de chamar uma função, por exemplo. Mas distraíste-te. Sem o poder de viajar no tempo a única hipótese seria recomeçar o debug do início, o que pode ser doloroso.

Aqui está o cenário trágico. Passaste por cima da função e não alteraste a variável:

[![][2]][3]

Para salvares a situação fazes clique com o botão direito na linha acima para a qual desejas regressar e no menu escolhes "Ir para a instrução":

[![][4]][5]

Feito isto, depurador regressa ao passado sem refilar:

[![][6]][7]

E tu podes continuar a trabalhar e já não precisas de cantar o fado até ao fim.

Obrigado Sérgio Fraga pela óptima dica.

O Abapinho saúda-vos.

   [1]: https://www.youtube.com/watch?v=LOtAfLvhSZo
   [2]: images/otempovoltaparatras11.png (Debug demasiado à frente)
   [3]: images/otempovoltaparatras11.png
   [4]: images/otempovoltaparatras2.png (Pedir para viajar no tempo)
   [5]: images/otempovoltaparatras2.png
   [6]: images/otempovoltaparatras3.png (Voltámos atrás no tempo)
   [7]: images/otempovoltaparatras3.png
