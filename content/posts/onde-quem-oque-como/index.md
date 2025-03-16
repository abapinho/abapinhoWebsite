---
slug: onde-quem-oque-como
title: Onde? Quem? O quê? Como?
description: Encontra resposta para estas perguntas antes de começares a programar
date: 2025-03-17T09:00:00Z
tags: [oo]
categories: [artigos]
keywords: [Onde Quem O quê Como]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Pediram-te para criar uma nova funcionalidade. Estás pronto para a construir. Mas aguenta os cavalos. Antes de começares sugiro que encontres resposta a algumas perguntas. Encontrares uma boa resposta para cada uma delas é fundamental para garantir que o que vais construir fica sólido e elegante.

<!--more-->
Adoptemos um exemplo para mais facilmente ilustrar esta ideia: precisas de um obter uma lista das ordens de venda de um cliente.

## Onde?

A primeira pergunta tem a ver com domínios. Já ouviste falar em _Domain Driven Development_? Pensa no código todo do teu sistema como um território. Distancia-te e olha para ele de cima, como quem está num avião a olhar lá para baixo e, numa compreensível inversão entre realidade e existência, diz "Parece mesmo o Google Maps"! Sinal dos tempos. Mas distraí-me. Esta piada não tem nada a ver com o que eu ia dizer. Adiante. Olhas lá para baixo e vez zonas, territórios, fronteiras. Se calhar chama-lhes módulos, ou aplicações. Ou outra coisa. Chama-lhes o que quiseres, desde que os identifiques e reconheças. Podem ser áreas maiores, como Finanças ou HR. Mas também podem ser pequenos territórios, como Relatório Anual de Vendas ou Processamento de Salários. Isso vai depender da organização do teu sistema. E já que falamos nisso, nunca te esqueças que provavelmente tens mais poder do que julgas para influenciar esse teu sistema. Para reinventar as suas fronteiras. Ou subdividir reinos em múltiplos condados. Quanto melhor conheceres o território que o teu código habita, mais facilmente te será decidir onde irá habitar o novo código que te propões construir.

Caso não tenhas ainda percebido, refiro-me a pacotes. Um sistema bem governado está devidamente subdividido numa hierarquia de pacotes e sub-pacotes.

Se o teu sistema ainda só tem pacotes chamados `ZFI` e `ZSD` então tens muito trabalho pela frente. Não hesites em reivindicar pequenos territórios: começa por criar um pacote para cada desenvolvimento. Proponho-te propores a quem governa o teu sistema que pensem numa hierarquia mais fina feira com 2 níveis de pacotes do tipo `MAIN` debaixo dos quais poderão então começar a criar pacotes tipo `DEVELOPMENT`, cada um albergando um desenvolvimento. Quanto mais pequenos forem os pacotes mais organizado será o sistema e mais fácil será navegares o seu mapa. Já agora, estou a presumir que o [ABAP Package Concept][1] está activo no teu sistema. Se não estiver, devia estar. Trata disso.

Não tem de haver apenas uma resposta certa, claro. Mas haverá certamente pelo menos uma. Essa resposta será o nome do pacote onde irás criar o novo código.

Para responder ao nosso exemplo concreto, eu diria que era fixe teres um pacote dedicado a ordens de venda. Algo tipo `ZSD_SO` onde `SD` representa o domínio Vendas e `SO` representa o sub-domínio Sales Orders.

## Quem?

Desce agora de altitude. Já não estás nas nuvens a olhar para o mapa dos teus domínios. Agora és um drone que paira no ar, zumbindo a poucos metros do chão. No chão vês uma série de actores que interagem entre eles fervilhando de actividade. Rapidamente os reconheces: vês o padeiro, a peixeira, o agricultor, o camionista e tantos outros. Idealmente cada um sabe do seu mester. Se o teu sistema estiver bem construído, o que um sabe fazer o outro já não precisa de saber. Contam uns com os outros. Nesta sociedade todos colaboram e quanto menos se sobrepuserem melhor: mais ágil e elegante é a sua organização. São fáceis de reconhecer pelo nome. O padeiro não amanha o peixe, né? Ora para responderes a esta pergunta a primeira coisa que deves fazer é tentar perceber se já existe algum ser cuja área de actividade tenha a ver com o que pretendes construir. Caso não exista ainda, não tenhas medo de criar um novo actor, adequado à tua necessidade. Dá-lhe um nome justo, digno, que torne fácil entender o que o move. Mas caso identifiques alguém já existente que seja adequado ao que queres fazer, escolhe-o.

Pois é, falamos agora de classes. Um domínio bem gerido é populado por muitas pequenas classes em que cada uma sabe fazer pouco, mas o pouco que faz, faz bem. Não caias no erro de dar viva a seres desenrascados que fazem tudo e mais um par de botas. Prefere antes seres puros, elegantes, simples mas virtuosos. Mantém as tuas classes o mais focadas possível numa única actividade. E tenta usar substantivos para as nomear.

No nosso exemplo o substantivo evidente é "Lista de ordens de venda". Parece-me portanto adequado chamarmos à classe `ZCL_SD_SALESORDERS`. Nota que é plural porque o exemplo fala claramente em muitas ordens de venda. Se vieres a ter funcionalidades que se apliquem directamente a uma ordem de venda em particular não as metas na mesma classe. Mete-as antes numa classe chamada, por exemplo, `ZCL_SD_SALESORDER`.

Uma vez que tenhas decidido qual a classe que irá albergar o código novo deverás também pensar: esta classe é suficiente ou deverei precisar de mais? Identifica quantas forem necessário. Se uma das classes que identificaste já começa a ficar demasiado complexa não hesites em subdividi-la. Nunca deixes que uma classe fique demasiado complexa.

## O quê?

Já estás mesmo a ver que agora vamos falar dos nomes dos métodos, não é? É isso, não vou estar com suspenses.

Afinal, o que é que te foi pedido exactamente? Descreve-o numa palavra. Ou duas. Ou numa pequena expressão. Mas pá, não sejas aldrabão. Se o teu método começar por `GET_` não te ponhas a escrever na base de dados ou a alterar atributos na classe. E se o teu método começar por `SET_` não confundas as pessoas fazendo-o devolver parâmetros. Mas, acima de tudo, não julgues nunca que vais construir toda a tua funcionalidade dentro desse método. Nada disso. A resposta a esta pergunta é só o nome do método público que servirá de ponto de entrada à tua nova funcionalidade. A não ser que o que tens a fazer seja deveras simples, esse ponto de entrada deverá conter só chamadas de alto nível a vários outros métodos igualmente nomeados com igual cuidado.

No nosso exemplo a frase pedida é "Obter lista de ordens de venda". O verbo é "Obter". O substantivo já está reflectido no nome da classe por isso só temos de nos preocupar com o verbo: `GET_LIST`. Poderia ser `GET` mas isso ficaria ambíguo pois pode haver também necessidade de um método para obter apenas uma e assim ficaremos com, por exemplo, `GET_LIST` e `GET_SINGLE`.

## Como?

Chegados aqui, sabemos onde vai ser feito, sabemos quem vai fazê-lo e sabemos o que vai ser feito. Só falta mesmo decidi como será feito. Da minha experiência, a resposta às 3 primeiras perguntas muitas vezes facilita em muito a resposta a esta pergunta. Acima de tudo não te esqueças de que, seja o que for que faça, este método deverá fazer apenas uma coisa. Se fizer várias, então deves delegar essas várias coisas para vários outros métodos. E, claro, deverás aplicar este questionário de 4 perguntas a cada um desses métodos. Só assim conseguirás concluir como se devem chamar e se podem existir na mesma classe ou se deverão antes pertencer a outra, ou mesmo a outro pacote.

Neste caso o como é o mais fácil. Provavelmente faremos um `SELECT` à tabela `VBAK` ou algo assim.

## Abusa da composição

Nota que uma possibilidade alternativa seria escolher a classe `ZCL_SD_CUSTOMER` e o método `GET_SALESORDERS`. O problema disto é que podes vir a associar imensas funcionalidades ao cliente. Se assim for, rapidamente a classe `ZCL_CUSTOMER` se tornará ingerível. E por isso a opção que escolhemos acima é preferível. Mas repara que,podes ter o melhor dos dois mundos. Crias o método `ZCL_SD_CUSTOMER->GET_SALESORDERS` que se limita a chamar o método `ZCL_SD_SALESORDERS->GET_LIST`. Topas? Assim a classe `ZCL_SD_CUSTOMER`, por ser de mais alto nível, serve apenas de fachada para as suas funcionalidades que estão implementadas em várias outras classes de mais baixo nível.

O Abapinho saúda-vos.

  [1]: {{< ref "arvore-de-pacotes-z" >}}
