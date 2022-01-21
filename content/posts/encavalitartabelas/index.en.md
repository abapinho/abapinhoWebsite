---
title: '<!--:pt-->Como encavalitar tabelas<!--:-->'
slug: encavalitartabelas
date: 2011-02-05 16:38:20
tags: [ddic, ui]
categories: [artigos]
wordpressId: 599
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Às vezes temos de criar uma tabela Z. Às vezes temos até de criar várias tabelas Z. Às vezes estas tabelas estão relacionadas de alguma forma. Como quando uma contém dados de cabeçalho e a outra dados de item, por exemplo. Ora se estão relacionadas pode dar jeito que sejam editadas em conjunto. É para isso que servem os Clusters de Visão (view cluster).

<!--more-->

Este artigo ensina tintim por tintim a fazer um Cluster de Visão que relaciona duas tabelas.

**1\. Criar tabela de cabeçalho ZTIPO (SE11)**

Na SE11, cria a tabela de cabeçalhos ZTIPO com os seguintes campos:

  * MANDT

  * TIPOID

  * DESCRICAO

[![][1]][2]

Faz tudo como sempre fazes com uma excepção: no separador "entrega e actualização" garante que a opção "atualiz.visão tabs." tem o valor "exibição/actualização permitida com restrição". Isto serve para impedir que a tabela possa ser mantida independentemente (na SM30).

Agora cria os ecrãs de manutenção desta tabela.

[![][3]][4]

**2\. Criar tabela de ZANEDOTA (SE11)**

Na SE11, cria a tabela de itens ZANEDOTA com os seguintes campos:

  * MANDT (chave)

  * TIPOID (chave)

  * ANEDOTAID

  * DESCRICAO

[![][5]][6]

Desta vez, na opção "atualiz. visão tabs." escolhe a opção "exibição/actualização não permitida". Isto porque esta tabela não vai ser usada na manutenção mas sim uma vista criada sobre ela. Por isso, não cries os ecrãs de manutenção desta tabela.

Cria a chave externa para o campo TIPOID fazendo referência à tabela ZTIPO.

![][7]

**3\. Criar vista de actualização ZANEDOTA_V (SE11)**

Na SE11, cria a vista de actualização ZANEDOTA_V, associa-lhe a tabela ZANEDOTA e escolhe o separador "Campos visão". Nota que ele mostra automaticamente os campos da chave. Adiciona-lhe agora tu o campo DESCRICAO.

[![][8]][9]

Nota a 4ª coluna chamada "Caracterização actualização para campo visão". Esta coluna é muito importante. Na linha do campo TIPOID preenche essa coluna com o valor S (campo visão utilizado para formatação subset). Isto na prática quer dizer que, sendo a tabela ZANEDOTA dependente da tabela ZTIPO, o campo ZANEDOTA-TIPOID será herdado da ZTIPO-TIPOID e será preenchido automaticamente. Se não entendeste não te preocupes, falarei disso mais tarde.

No separador "Status at.", vai ao campo "Data Browser/atualiz.visão tabs." e escolhe o valor "Exibição/atualização permitida com restrição" para evitar que se possa manter independentemente esta vista (na SM30).

Finalmente, cria os ecrãs de manutenção desta vista.

[![][10]][11]

E pronto, já está. Grava e vai-te embora da SE11.

**4\. Criar cluster de visão (SE54)**

Na transacção SE54 escolhe a opção "ProcessCluster visão" (que raio de traduções mas enfim). Vais parar a um novo ecrã onde deverás inserir o nome do nosso cluster de visão: ZANEDOTAS. Depois escolhe "criar/modificar". E pronto, será aqui que tudo vai acontecer.

[![][12]][13]

No menu da esquerda escolhe "Estrutura de objecto". Aí vais definir as duas tabelas e como se relacionam.

Na primeira linha introduz a ZTIPO conforme está aqui:

[![][14]][15]

Depois selecciona-a, escolhe a opção "dependência de campos" e garante que está conforme aqui se vê:

[![][16]][17]

De volta à "estrutura de objecto", introduz na segunda linha a vista de actualização ZANEDOTA_V conforme aqui se vê:

[![][18]][19]

Depois selecciona-a, escolhe a opção "dependência de campos" e garante que está como aqui se vê:

[![][16]][17]

Pronto, já estão as duas configuradas. Agora é só gravar e activar. Escolhe a opção "entrada de cabeçalho" e depois lá à direita espreme o botão "Ativar". Ele vai perguntar-te se pode alterar os ecrãs de manutenção e tu obedientemente vais dizer que sim.

[![][20]][21]

**5\. Experimentar cluster de visão (SM34)**

Se tudo tiver sido feito como deve de ser, agora basta ir à transacção SM34, introduzir o cluster de visão ZANEDOTAS e editar as duas tabelas em conjunto pois lá elas estão encavalitadas uma na outra.

[![][22]][23]

Depois de introduzires pelo menos um tipo de anedota na tabela ZTIPO, ao seleccionares uma dessas linhas e navegares para a tabela inferior constatarás que por cima das linhas da tabela inferior aparece um cabeçalho com a chave primária da tabela superior que está actualmente a ser considerada. Isto é por causa do tal S no campo "Caracterização actualização para campo visão" na vista de actualização da tabela ZANEDOTA. Este é o truque que evita ter de preencher o campo TIPOID na tabela ZANEDOTAS.

Agora é começares para aí a encavalitar tudo o que é tabela.

O Abapinho saúda-vos.

(a imagem do post foi obtida [aqui][24] sob a licença Creative Commons).

   [1]: images/cluster00.png (cluster00)
   [2]: images/cluster00.png
   [3]: images/cluster03.png (cluster03)
   [4]: images/cluster03.png
   [5]: images/cluster02.png (cluster02)
   [6]: images/cluster02.png
   [7]: images/cluster01.png (cluster01)
   [8]: images/cluster04.png (cluster04)
   [9]: images/cluster04.png
   [10]: images/cluster05.png (cluster05)
   [11]: images/cluster05.png
   [12]: images/cluster06.png (cluster06)
   [13]: images/cluster06.png
   [14]: images/cluster07.png (cluster07)
   [15]: images/cluster07.png
   [16]: images/cluster08.png (cluster08)
   [17]: images/cluster08.png
   [18]: images/cluster12.png (cluster12)
   [19]: images/cluster12.png
   [20]: images/cluster10.png (cluster10)
   [21]: images/cluster10.png
   [22]: images/cluster13.png (cluster13)
   [23]: images/cluster11.png
   [24]: http://www.flickr.com/photos/52953262@N00/414506361
