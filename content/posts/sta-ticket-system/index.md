---
title: 'STA Ticket System acelera a resolução de incidentes SAP'
slug: sta-ticket-system
date: 2016-02-29 09:00:53
tags: [debug]
categories: [artigos]
wordpressId: 3429
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['ticket system']
---
Hoje temos um convidado, Tamás Holics. Ele é dono da STA Consulting, uma empresa Húngara que criou 2 produtos muito interessantes para SAP. Neste artigo o Tamás apresenta o STA Ticket System.

## O Problema

Desperdiça-se muito tempo nos processos de teste e manutenção SAP dado que os relatórios de erros produzidos pelos utilizadores serem muitas vezes incompletos ou incorrectos. A resolução do problema reportado normalmente fica pendente até a informação estar toda completa. Ora como em boa parte dos incidentes reportados a equipa de manutenção (analistas, programadores) tem de pedir mais informação sobre o erro, há uma enorme perda de tempo valioso em iterações desnecessárias, tanto de quem reporta incidentes como de quem lhes dá suporte.

<!--more-->

Alguns exemplos típicos:

* Falta de informação básica: os utilizadores esquecem-se de meter informação crítica nos relatórios de erro. Ex.: que sistema foi afectado, qual a transacção SAP, que Ordem de Venda tinha os dados incorrectos, etc;

* Informação incorrecta: os utilizadores introduzem mal a informação, por exemplo, enganam-se no número do material, etc. Como consequência um programador poderá fazer debug durante horas apenas para responder ao utilizador a dizer que tudo funciona bem. "Ops, desculpa, afinal era a Ordem de Compra 112000898 e não 112000989."

* Sem informação técnica: os utilizadores não sabem adicionar informação técnica. Ex.: não sabem o nome do programa ou do ecrã ou da transacção;

* Falta o anexo: os utilizadores esquecem-se de juntar uma imagem do ecrã, ou o short dump ou um relatório de falha de autorização sem os quais será difícil começar a investigar o problema.

Além disso, quando querem reportar um erro em SAP, os utilizadores têm de abrir janelas no _browser_ para lançar a ferramenta ITSM. Lá, terão de introduzir todos os dados manualmente. Algumas empresas usam mais de 5 ferramentas ITSM diferentes. Uma para o sistema de testes, outra para o produtivo, etc. Processos diferentes, interfaces diferentes. É normal que os utilizadores fiquem confusos.

## A solução

O STA Ticket System oferece uma solução elegante e eficaz para todos os problemas acima descritos.

Funcionalidades chave:

* Os erros podem ser reportados directamente a partir do SAP UI (todos os tipos: SAP GUI clássico, SAP Enterprise Portal, SAP Business Client, SAP Fiori Launchpad);

* O programa cria automaticamente uma ocorrência na ferramenta ITSM externa da empresa;

* O programa anexa automaticamente um ficheiro PDF com toda a informação técnica relevante para o contexto (sistema, programa, utilizador, dados de autorizações)

* Os utilizadores podem, em poucos cliques, adicionar contexto de negócio (valores de campos do ecrã actual)

* O programa anexa automaticamente uma captura do ecrã, short dump e relatório de autorizações (se se aplicar)

## Como funciona?

Para esta demonstração usámos o ServiceNow como ferramenta de incidentes. O primeiro ecrã mostra como reportar um incidente a partir do SAP. O business partner 331 é apresentado utilizando a transacção BP. O utilizador encontra um erro (o valor de um campo no ecrã errado), e cria o incidente simplesmente utilizando o menu "Sistema". Nem sequer tem de mudar de ecrã:

![sta1][1]

A segunda imagem mostra o ecrã principal da STA Ticket System, que é apresentado numa janela de popup. Aqui podes adicionar uma descrição curta e uma longa.

Na metade inferior do ecrã pode facilmente adicionar-se campos extra. Por exemplo, se tiveres alguns campos específicos definidos no ServiceNow podes acrescentá-los aqui. Além disso os utilizadores podem decidir, dos vários ficheiros gerados automaticamente sobre este incidente, quais serão anexados no ServiceNow.

![sta2][2]

Os utilizadores podem ainda acrescentar conteúdo de campos do ecrã actual com apenas alguns cliques. São-lhe apresentados todos os campos de ecrã que estavam presentes na transacção original e ele pode simplesmente escolher quais quer incluir, poupando tempo e evitando os erros dactilográficos da introdução manual.

![sta3][3]

Quando se carrega em “Complete” o programa cria automaticamente um incidente no ServiceNow. Lá, todos os campos aparecem definidos como no ecrã do SAP. Bem como os anexos adicionados automaticamente (captura do ecrã e PDF). Nesta integração fizemos o seguinte:

* Criámos um novo tipo de contacto (“Sent from SAP”)

* Criámos uma subcategoria (“SAP”) debaixo da categoria “Software”

* Criámos dois campos customizados no ServiceNow:

  * Scope (Entire SAP system, Entire department, Entire team or group, Single User)

  * Type (Authorization, Functional correctness, Fatal error, Performance, User Experience)

* Definimos grupos por módulo SAP, tipo SAP Finance, SAP Material Management, SAP Security, etc.

![sta4][4]

## Informação extra

[Aqui está um documento PDF][12] que foi gerado utilizando o STA Ticket System. Toda esta informação estará disponível para todos os incidentes que os utilizadores criem:

Os anexos adicionados ao ServiceNow dependem do contexto do programa actual:

* Uma captura de ecrã gerada automaticamente (que tem de ser confirmada pelo utilizador);

* Um relatório de autorizações (SU53). A equipa de segurança vai adorar esta funcionalidade;

* Um short dump, caso tenha ocorrido, que será automaticamente convertido para HTML.

![sta5][5]

![sta6][6]

![sta7][7]

Também podes usar este produto a partir do SAP Enterprise Portal. Lança-o a partir do topo do portal ou a partir do menu Sistema do Transaction iViews.

![sta8][8]

![sta9][9]

## Benefícios

É fácil ver como a tua empresa pode beneficiar de integrar o SAP com as ferramentas ITSM existentes através do STA Ticket System:

* Reduz comunicações desnecessárias resultantes de relatórios incompletos ou incorrectos;

* Acelera o debugging e tarefas de manutenção ao disponibilizar informação adicional relevante para os programadores;

* Aumenta a satisfação da equipa de suporte ao diminuir a quantidade de trabalho desnecessário resultante da melhoria da eficácia da comunicação de incidentes;

* Reduz o tempo que demora a reportar um incidente;

* E como consequência, reduz os custos do SAP IT ao melhorar drasticamente o tempo de resolução dos incidentes.

Podes poupar muito tempo particularmente se a equipa de suporte IT estiver localizada longe dos utilizadores. Trabalhando em diferentes fusos horários, por vezes as pessoas têm de esperar um dia inteiro por informação em falta. É um cenário muito comum em empresas multinacionais ou que tenha feito outsource do suporte de IT.
E depois há as férias. Se um utilizador reportar um erro antes de se ausentar para férias por um período prolongado os programadores não poderão trabalhar no incidente a não ser que tenha sido reportado com toda a informação necessária e correcta. Esqueceu-se em que transacção estava? Ou de dizer que sistema estava a usar dos 30 disponíveis? Esqueceu-se de introduzir a Organização de Vendas e o Canal de Distribuição que usou? É o suficiente para perder um mês, piorar KPIs e falhar SLAs.

Para mais informação sobre o STA Ticket System, visita [aqui][10].
Podes vê-lo em acção ligado ao ServiceNow [neste vídeo][11].

   [1]: images/sta1.jpg
   [2]: images/sta2.jpg
   [3]: images/sta3.jpg
   [4]: images/sta4.jpg
   [5]: images/sta5.jpg
   [6]: images/sta6.jpg
   [7]: images/sta7.jpg
   [8]: images/sta8.jpg
   [9]: images/sta9.jpg
   [10]: http://sta-technologies.com/products/ticket-system/
   [11]: https://www.youtube.com/watch?v=ML0G8sCA9K4
   [12]: txt/Incident_INC0010066_ECC_20151202.pdf
