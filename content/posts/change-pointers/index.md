---
title: 'Change pointers'
slug: change-pointers
date: 2009-03-19 17:07:02
tags: []
categories: [artigos]
wordpressId: 3
draft: false
---
Neste artigo tento explicar o que são _change pointers_ e revelar como são úteis e fáceis de usar.

**O que é um change pointer**
Um _change pointer_ é um mecanismo de registo de alteração de dados baseado em _change documents_ desenvolvido pela SAP especialmente para ALE. Permite saber, de forma simples e eficiente, quais os registos alterados em uma ou nas várias tabelas por ele monitorizadas. Os _change pointers_ são utilizados maioritariamente como gatilhos para a criação de IDOCs. Mas não devem ser vistos apenas como tal e espero que este artigo traga alguma luz a este mecanismo tão útil mas tão descurado no SAP.

<!--more-->

**Como funciona**
Em primeiro lugar há que descobrir o (ou os) _change document_ adequado. Para a maior parte das tabelas standard existem já _change documents_ standard que podem ser usados. Por exemplo, o MAT_FULL deverá ser utilizado para todas as estruturas organizacionais de um material.

Uma vez identificado o _change document_ necessário (ou criado um novo, no caso de tabelas do utilizador), é necessário definir o _message type_. A um _message type_ iremos associar um ou vários campos pertencentes a um ou mais _change documents_ e é este _message type_ que servirá de base para os _change pointers_.

É tudo. Agora, sempre que houver uma alteração num dos campos de uma das tabelas monitorizadas por este _message type_ , será criado um registo que permite identificar a chave primária da tabela cujo campo foi alterado. Com esta informação é fácil obter uma lista de todas as alterações feitas a um determinado conjunto de dados que pretendamos monitorizar.

Além disso, cada um dos registos de _change pointer_ contém uma flag que indica se já foi processada. Dessa forma, com o auxílio de umas funcões próprias para isso, é possível obter uma lista dos _change pointers_ ainda não processados bem como, após o seu processamento, marcá-los como processados para que não sejam seleccionados no futuro.

**Como configurar _change pointers_ **
Imaginemos um exemplo prático: há um sistema externo ao SAP que necessita de manter uma lista dos seus materiais. Mas este sistema necessita apenas de guardar dois dados: código de material (MARA-MATNR) e grupo de mercadorias (MARA-MAKTL). De cada vez que há uma alteração a um destes campos num material, ela deverá ser transmitida a esse sistema externo. Vejamos:

1\. Activar ALE
Antes de mais há que verificar que o ALE está activo no mandante de SAP a usar. O ALE está activo quando o conteúdo da tabela TBDA1 contém X.

2\. Escolher change document
A transacção SCDO mantém os _change documents_. Necessitamos do MAT_FULL. Na SCDO pode-se ver a lista de tabelas associadas a este change document. Entre elas encontraremos a MARA, claro.

2.1. Criar change document
No caso de os dados que queremos monitorizar estarem armazenados numa tabela de utilizador será necessário criar um novo _change document_ mas se se utilizar um dos _change document_ standards não será necessário fazer nada nesta transacção. Para um campo poder ser associado a um _change document_ basta que o seu elemento de dados tenha activa a opção change document, um pisco que está no ecrã Further Characteristics. Os _change documents_ são armazenados nas tabelas CDHDR e CDPOS. Neste caso será ainda necessário gerar, nesta mesma transacção SCDO, a função que o sistema vai utilizar para criar os _change documents_. Pode usar-se como exemplo uma outra já existente. A função do MAT_FULL é MAT_FULL_WRITE_DOCUMENT. Embora esta seja bastante complexa, fazer uma para gerir apenas uma tabela de utilizador é bastante mais simples.

3\. Definir _message type_
A transacção WE81 permite definir os _message type_ s. Lá poder-se-ão encontrar, entre outros, o MATMAS e o MATMAS_BAPI, ambos relacionados com o mestre de material. Existem vários pois, quando um material é alterado, vários processos diferentes poderão ter de ser espoletados, necessitando cada um do seu _message type_. Deveremos aqui criar um novo para o nosso processo. Chamemos-lhe Z_ACME, sendo ACME neste caso o nome do sistema externo.

4\. Activar _message type_
A transacção BD50 permite activar e desactivar individualmente cada _message type_.

5\. Associar campos ao _message type_
Utilizando a transacção BD52, associamos os campos MATNR e MATKL da tabela MARA do _change document_ MAT_FULL. Isto quer dizer que apenas serão criados _change pointers_ para o nosso _message type_ quando um destes dois campos for alterado. Dito de outra forma, sempre que há uma alteração num dos campos pertencentes a um determinado change document, é criada uma entrada para cada _message type_ que o contenha.

Já está. A partir de agora serão criadas entradas nas tabelas BDCP e BDCPS de cada vez que se derem alterações relevantes nos nossos dados.

**Como usar _change pointers_ **
Hipótese A: IDOC
Explicar como se faz não está no âmbito deste artigo mas, uma vez definido e configurado o IDOC, pode utilizar-se o report RBDMIDOC, quer interactivamente quer através de um job recorrente. Para saber mais sobre IDOCs consultar [este][1] e [este][2] documento.

Hipótese B: Programaticamente
Esta é a parte mais simples. A função CHANGE_POINTERS_READ devolve todos os _change documents_ para um determinado _message type_ (definindo opcionalmente um intervalo de tempo). A função CHANGE_POINTERS_STATUS_WRITE marca como processados um conjunto de _change pointers_ .

Hipótese C: Sei lá
Deve haver mais formas de usar _change pointers_ mas não me lembro agora de mais nenhuma.

O Abapinho saúda-vos.

   [1]: http://www.scribd.com/doc/24447/SAP-R3-IDoc-Cookbook-for-EDI-and-Interfaces-by-Axel-Angeli
   [2]: http://www.scribd.com/doc/5884984/Idoc-Quick-Reference-Sheet
