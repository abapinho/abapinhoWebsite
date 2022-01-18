---
title: 'Bloquear dados em tabelas Z sem objecto de bloqueio'
slug: bloquear-dados-em-tabelas-z-sem-objecto-de-bloqueio
date: 2013-01-28 09:00:54
tags: [ddic]
categories: [dicas]
wordpressId: 2149
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Até há dois dias atrás, se eu precisasse de criar entradas de bloqueio numa tabela ZCOISO criada por mim iria à SE11 criar um objecto de bloqueio para a tabela ZCOISO para depois poder usar os módulos de função gerados pelo objecto de bloqueio para bloquear os dados.

Mas agora já não.

<!--more-->

Porque agora já sei que existe o módulo de função ENQUEUE_E_TABLE.
Este FM permite criar entradas de bloqueio para qualquer tabela, seja ela Z ou não, sem ter de criar um objecto de bloqueio específico para ela.


{{< highlight ABAP >}}
  data: l_tablename type tabname,
          l_varkey type vim_enqkey,
          lw_zcoiso type zcoiso.

  lw_zcoiso-kunnr = '12345'.
  l_varkey = lw_zcoiso.
  l_tabname = 'ZCOISO'.

  call function 'ENQUEUE_E_TABLE'
       exporting
            tabname = l_tabname
            varkey = l_varkey
       exceptions
            foreign_lock = 1
            system_failure = 2
            others = 3.
{{< /highlight >}}

Pronto, está criada uma entrada de bloqueio para tabela ZCOISO para a chave da tabela '12345'.

Obrigado Michael Opoczynski pela dica..

O Abapinho saúda-vos.
