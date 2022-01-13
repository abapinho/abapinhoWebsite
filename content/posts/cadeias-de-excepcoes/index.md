---
title: 'Cadeias de excepções'
slug: cadeias-de-excepcoes
date: 2015-02-02 09:00:48
tags: [estilo, oo]
categories: [artigos]
wordpressId: 2976
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Hoje vou ensinar-te a encadear excepções. É uma solução muito práctica para um problema complicado mas pouco óbvio.

Começo por descrever o problema.

Imagina que estás na aplicação BANANA.
É uma aplicação bastante complexa.
Tem, aliás, três módulos. São eles BANANA1, BANANA2 e BANANA3.
Cada um tem a sua classe de excepção ZCX_BANANA1, ZCX_BANANA2 e ZCX_BANANA3.
E como a aplicação até está bem desenhada, todas as classes de excepção herdam da mesma ZCX_BANANA.
Agora imagina o seguinte cenário.
Estás no módulo BANANA1 a fazer não sei o quê.
E lá tens de chamar uma classe do módulo MORANGO
Ora essa classe lança, claro, excepções, do tipo ZCX_MORANGO.
Este é o contexto.

Tens várias hipóteses:

<!--more-->

**Hipótese 1** : Declarar as excepções externas
O método que invoca a classe do MORANGO declara a excepção ZCX_MORANGO no RAISING.
Todos os métodos que o chamarem terão de a declarar também.
Assim por adiante até ao topo da hierarquia de chamadas.
É uma grande promiscuidade.
Imagina que o BANANA também tem de usar classes dos módulos ABACATE, LARANJA e UVA.
Terá também de declarar, em todos os métodos que os usarem, as respectivas classes de excepção.
Quanto mais complexo mais confuso.
Não é isso que queremos.
Geralmente quem faz isto acaba por ter de fazer um CATCH CX_ROOT, algo pouco saudável.
Por tudo isto, a hipótese 1 é de evitar.
A não ser em cenários muito simples.

**Hipótese 2** : Converter as excepções externas em internas
Cada método da BANANA que invoca métodos do MORANGO faz sempre TRY CATCH à ZCX_MORANGO e lança imediatamente uma excepção do tipo ZCX_BANANA.
Isto até funciona.
O problema é que por cada excepção do MORANGO terá de haver uma excepção equivalente da BANANA.
Se for só uma, tudo bem.
Mas se forem dezenas torna-se palerma.
E não é muito seguro.
E cada uma das excepções criadas terá de replicar o texto específico da excepção do MORANGO respectiva.
Não é muito práctico.
Porque se amanhã alguém mudar algo no MORANGO, a BANANA fica desactualizada.
Também tende resultar numa grande confusão.
Por tudo isto, a hipótese 2 é de evitar.
A não ser em cenários muito simples.

**Hipótese 3** : Usar o PREVIOUS para criar cadeias de excepções
Todas as classes de excepção têm um atributo chamado PREVIOUS.
Este é uma referência para uma classe de excepção.
Quando o método da BANANA invoca métodos do MORANGO faz sempre TRY CATCH à ZCX_MORANGO.
Mas não lança uma excepção específica por cada excepção do MORANGO.
Em vez disso lança sempre a mesma excepção ZCX_BANANA.
Mas atribui a excepção do MORANGO ao PREVIOUS dessa excepção BANANA.
Quem, cá em cima, tratar das excepções todas, só tem de ver se o PREVIOUS tem conteúdo.
Caso tenha, apresentar/guardar/processar também a excepção que aí estiver.
E deverá idealmente fazer isto em LOOP.
Para o caso da excepção do PREVIOUS ter, por sua vez, outra excepção no seu PREVIOUS.
Isto é o melhor dos dois mundos:
Código à prova de futuro mas que não perde a informação das excepções específicas.
Esta é, para mim, a hipótese preferida.

Espero que tanto o problema como a solução que proponho tenham ficado claras.

Deixo-vos com uma implementação simplificada da hipótese 3:


{{< highlight ABAP >}}
TRY.
  TRY.
      o_morango1->cresce().
    CATCH cx_morango INTO o_exp.
      RAISE EXCEPTION TYPE cx_banana
        EXPORTING
          previous = o_exp.
  ENDTRY.
CATCH cx_banana INTO o_exp.
  WHILE o_exp IS BOUND.
    log( o_exp ).
    o_exp = o_exp->previous.
  ENDWHILE.
ENDTRY.
{{< /highlight >}}

Obrigado a Clark pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/photos_by_clark/14418660613/
