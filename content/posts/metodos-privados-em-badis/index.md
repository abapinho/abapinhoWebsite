---
title: 'Implementar métodos privados em BADIs'
slug: metodos-privados-em-badis
date: 2012-03-19 10:00:09
tags: [enhancements, oo]
categories: [artigos]
wordpressId: 1487
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Há uns tempos tive uma ideia meio estrambólica meio fantástica que hoje decidi partilhar aqui: criar métodos privados nas classes das BADIs.

Passo a explicar.

<!--more-->

Como parêntesis introdutório: há dois anos atrás, escrevi um artigo chamado [Melhorar os melhoramentos][1] a sugerir uma forma organizada de implementar _enhancements_ que consiste em nunca colocar código directamente nos _enhancements_ (sejam eles _user-exits_ , _mods_ , _BADIs_ ou _enhancements_ ) mas antes encapsular cada coisa distinta que lá se tem de fazer dentro de uma função. Lê o artigo para entenderes as vantagens desta abordagem. Na altura ainda não usava objectos e por isso sugeri a criação de um grupo de funções com um conjunto de módulos de função. Entretanto, 2 anos depois, acho que não faz sentido nenhum usar funções a não ser quando o SAP a isso nos obriga (RFCs por exemplo). Por isso o artigo mereceria ser actualizado para usar uma classe com métodos estáticos.

Ora estava eu a implementar uma BADI seguindo essa mesma lógica de encapsular sempre a lógica que se adiciona aos enhancements e comecei por criar uma classe, à qual acrescentei um método, o qual invoquei a partir do método da BADI.

Mas depois, _fiat lux_ , e pensei: mas a BADI já é ela própria uma classe. Porque é que hei-de eu então estar a criar uma classe nova? Pois.

Então surgiu a ideia de implementar métodos privados na própria classe que implementa a BADI e depois invocá-los a partir dos métodos oficiais da BADI. Desta forma, fica tudo arrumadinho à mesma sem ser necessário criar outra classe.

Passo a explicar o processo detalhadamente.

Imagina então que tens de implementar um método de uma BADI. Fazes assim:

  1. Na SE19 crias a implementação da BADI com base na BADI desejada. Dás-lhe um nome, etc, etc;

  2. Em vez de entrares no método que queres implementar, entras antes na classe que lá diz conter a implementação:

![][2]

  3. (Agora estás na SE24) Cria um método privado com um nome que descreva o que pretendes fazer (eu criei 2):

![][3]

  4. Define os parâmetros desse método copiando do método da BADI apenas os parâmetros de que vais necessitar:

![][4]

  5. Define excepções se tal fizer sentido;

  6. Implementa a tua lógica dentro do novo método privado:

![][5]

  7. Vai, agora sim, para o o método público da BADI que queres implementar (podes ir directamente pela SE24 ou fazê-lo a partir da SE19);

  8. Nesse método invoca o teu novo método privado (neste caso invoco logo os 2):

![][6]

Já está. Agora é só activares a BADI (na SE19) caso ainda não esteja activa.

Vantagem: Tudo arrumadinho sem ter de recorrer a classes externas

Desvantagem: Os métodos privados não são visíveis na transacção de BADIs tradicionais SE19 (que mostra apenas o interface da BADI) o que pode levantar alguma confusão para quem não esteja familiarizado com classes. Mas já aparecem no caso dos novos enhancements.

Eu acho que a vantagem ultrapassa a desvantagem. E tu? O que achas? Vês mais vantagens ou mais desvantagens?

Parece que a SAP também gosta desta abordagem porque entretanto descobri uma BADI standard (BNK_BADI_ORIG_PAYMT_CHG) que a usa na implementação "fallback" (CL_BNK_BADI_ORIG_PAYMT_CHG). Temos, portanto, a benção da SAP.

O Abapinho saúda-vos.

   [1]: {{< ref "melhorar-os-melhoramentos" >}} (Melhorar os melhoramentos)
   [2]: images/2012-02-07-08.10.30-pm.png (2012-02-07 08.10.30 pm)
   [3]: images/2012-02-07-08.12.27-pm.png (2012-02-07 08.12.27 pm)
   [4]: images/2012-02-07-08.13.52-pm.png (2012-02-07 08.13.52 pm)
   [5]: images/2012-02-07-08.46.50-pm.png (2012-02-07 08.46.50 pm)
   [6]: images/2012-02-07-08.09.03-pm.png (2012-02-07 08.09.03 pm)
