---
slug: eclipse-adt-extract-method
title: O Eclipse ADT extrai métodos automaticamente
description: O Eclipse ADT extrai métodos automaticamente
date: 2024-07-01T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT extract method]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Quando tens um método muito grande, deves subdividi-lo em vários mais pequenos.

<!--more-->

O Clean ABAP [diz que][1] os métodos idealmente devem ter de 3 a 5 comandos e sugere um máximo de 20 em casos extremos. Se continuas a fazer métodos de 300 linhas, pensa bem nisto, ganha vergonha e vai lá subdividi-los.

O Sr. Martin Fowler estudou profundamente os processos óptimos para reescrita (_refactoring_) de programas e publicou os seus resultados num livro excelente chamado [Refactoring][2] que te aconselho vivamente a conheceres. Como alternativa, podes consultar o site [refactoring.guru][3].

O livro _Refactoring_ descreve processos sistemáticos para executar cada um dos casos. Estes são os passos por ele propostos para o [Extract Method][4]:

1. Cria um novo método e dá-lhe um nome que torne o seu objetivo evidente.
2. Copia o fragmento de código relevante para o seu novo método. Elimina o fragmento da sua antiga localização e coloqua uma chamada para o novo método.
3.  Encontra todas as variáveis usadas neste fragmento de código. Se estiverem declaradas dentro do fragmento e não forem utilizadas fora dele, basta deixá-las inalteradas - tornar-se-ão variáveis locais para o novo método.
4. Se as variáveis forem declaradas antes do código que estás a extrair, terás de passar estas variáveis para os parâmetros do teu novo método de modo a utilizar os valores previamente contidos nelas. Por vezes é mais fácil livrares-te destas variáveis recorrendo a Replace Temp with Query.
5.  Se vires que uma variável local muda de alguma forma no seu código extraído, isso pode significar que esse valor alterado será necessário mais tarde no seu método principal. Verifica novamente! E, se for esse o caso, devolve o valor dessa variável ao método principal para manter tudo a funcionar.

## No SAPGUI

Pois. Mesmo cocó de sempre. Se queres extrair parte do código de um método para outro método, tens de fazer tudo à pata. Não há cá automatismos. Não admira que quem usa o SAPGUI tenda a fazer métodos longos. Pudera. O SAPGUI devia ser chamado de IUE em vez de IDE. O U é de _Underdeveloped_.

## No Eclipse ADT

1. Selecciona o código que queres extrair
2. Botão direito, _Source code > Extract method_
3. Nomeia o novo método e ajusta os parâmetros
4. _Next, next, finish_.

Pronto, já está. Os 5 passos acima descritos foram automaticamente executados. Siga.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#keep-methods-small>
[2]: <https://martinfowler.com/books/refactoring.html>
[3]: <https://refactoring.guru>
[4]: <https://refactoring.guru/extract-method>
