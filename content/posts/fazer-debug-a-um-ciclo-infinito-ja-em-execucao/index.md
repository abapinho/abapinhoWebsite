---
title: 'Fazer debug a um ciclo infinito já em execução'
slug: fazer-debug-a-um-ciclo-infinito-ja-em-execucao
date: 2015-03-02 09:00:22
tags: [debug]
categories: [dicas]
wordpressId: 3008
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Imagina que tens um programa a executar um ciclo infinito ou, pelo menos, um ciclo com 70x7 iterações. Nunca mais acaba e tu queres saber o que lá se passa.

No passado tinhas de ir à SM50, seleccionar o processo e escolher no menu "Administração | Programa | Depuração".

Mas agora há uma forma muito mais simples.

<!--more-->

Primeiro tens de configurar a depuração de forma a que os _break-points_ fiquem imediatamente activos:

![depuracao_configuracao][1]

E depois é só ires à SE38/SE24, ao código do programa que está a correr, e meter um _break-point_ no meio do ciclo. O programa que está a correr parará imediatamente em depuração na próxima vez que por lá passar.

Tão simples que até parece Java.

Obrigado Vítor Pinheiro pela dica.

O Abapinho saúda-vos.

   [1]: images/depuracao_configuracao.png
