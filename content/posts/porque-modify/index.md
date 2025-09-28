---
slug: porque-modify
title: Porquê sempre MODIFY?
description: Tens o INSERT e o UPDATE, porque não os usas ao invés do MODIFY?
date: 2026-09-29T09:00:00+01:00
tags: [estilo]
categories: [artigos]
keywords: [MODIFY]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

É hábito em ABAP usar o MODIFY em vez de INSERT e UPDATE. Costumas fazê-lo? Explica-me porquê. É preguiça? É medo? É na base do "já agora"? Ou é mais na base do "caga nisso"?

<!--more-->

`INSERT` e `UPDATE` são duas operações radicalmente diferentes e deviam ser tratadas como tal.

Pára com isso! Pára de usar o `MODIFY` por dá cá aquela palha. Vou dar-te duas razões:

A primeira é que, enquanto o `UPDATE` requer objectos de bloqueio para evitar concorrência, o `INSERT` é uma operação segura que não precisa deles para nada. Ora, já vi as duas situações: há os `MODIFY` sem objectos de bloqueio, que é na base do "oxalá não dê asneira" e há os `MODIFY` com objectos de bloqueio que não estão lá a fazer nada, que é na base do "tanto faz". Tanto uma como a outra são exemplos de má programação.

A segunda é que te deves esforçar para que o teu código seja fácil de entender por quem vier a seguir. Quando alguém se depara com um `MODIFY` em código que não conhece, é bom que tenha lá perto um comentário a deixar claro se aquilo é para inserir ou para alterar pois, caso contrário, acabaste de lhe causar um problema complicado: agora ele vai ter um trabalhão para tentar descobrir o que raio estás tu para ali a fazer. Trabalhão que tu lhe podias ter evitado. Já passei por isso várias vezes.

O `MODIFY` é como o `CATCH cx_root`. Ambos pragas a erradicar.

Não vou ao ponto de dizer que o `MODIFY` nunca deva ser usado. Talvez em casos em que a performance é importante e se tem de processar montes de linhas que não se sabe se são novas ou se já existem. Mas de resto não estou a ver a necessidade. Estás?

Mesmo havendo cenários em que o `MODIFY` possa fazer sentido, serão excepcionais e muito específicos. Não é o caso da maior parte dos `MODIFY` com que me cruzei e continuo a cruzar.

E são muitos. Já estive num projecto em que eram tantos e tão problemáticos que se estava a considerar fazer um projecto só com o objectivo de os eliminar, substituíndo-os por `INSERT` ou `UPDATE`, _comme il fault_.

O Abapinho saúda-vos.
