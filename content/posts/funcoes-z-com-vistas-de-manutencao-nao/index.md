---
title: 'Funções Z misturadas com vistas de manutenção, não!'
slug: funcoes-z-com-vistas-de-manutencao-nao
date: 2013-06-24 09:00:02
tags: [estilo]
categories: [dicas]
wordpressId: 2351
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A dica de hoje não é uma dica. É um conselho.

Criada uma tabela, depois crias as suas vistas de manutenção. As vistas de manutenção vivem dentro de um grupo de funções. Grupo de funções esse que te é pedido aquando da criação delas. Porque afinal aquilo não passa de um conjunto de código gerado, sendo que a maior parte são ainda assim includes standard. Montes deles.

Apresento-te o problema: há quem crie funções Z suas e as coloque em grupos de função que contêm vistas de manutenção. É verdade. Há quem o faça.

<!--more-->

E agora o conselho: não faças isso.

Tão simples quando isso.

Porquê? Porque não pode vir bem daí. Só mal. É uma questão de higiene. Razão suficiente, não?

Sugiro-te que identifiques sempre bem os grupos de função destinados a vistas de manutenção terminando-lhes o nome com _MAINT ou algo do género. Imagina que tens um projecto a que te referes como PROJ. Então o grupo de funções para a manutenção de tabelas pode chamar-se ZPROJ_MAINT. Se precisares de criar funções tuas para esse projecto, cria outro grupo de funções ZPROJ. Ou, caso prefiras, encontra um grupo de funções adequado que já exista mas garante que este não é já usado para manutenção de tabelas.

E já que aqui estamos, outro conselho, que é tipo corolário do anterior: Agrupa no mesmo grupo de funções vistas de manutenção de tabelas que estejam relacionadas, mas não metas à bruta todas as vistas de manutenção que crias no mesmo grupo de funções, acima de tudo não mistures no mesmo grupo de funções tabelas que não têm nada a ver umas com as outras. Aqui posso dar-te uma razão palpável para não o fazeres: se tiveres definidos eventos para a tabela A e por causa de alterações à tabela B recriares o grupo de funções, lá se vão as definições dos eventos.

Portanto, era para ser um conselho e afinal foram dois.

Obrigado a AmsterSam The Wicked Reflectah pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/amstersam/4608512202
