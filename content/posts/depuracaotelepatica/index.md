---
title: 'Depuração telepática'
slug: depuracaotelepatica
date: 2010-11-26 10:55:58
tags: [debug]
categories: [dicas]
wordpressId: 505
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Imagine o seguinte cenário: um utilizador (ou utilizadora) está sentado no escritório dele, a correr uma transacção ou não sei o quê. Tem um problema e chama um programador (ou programadora) para o (ou a) ajudar a entender o que se passa. Normalmente o programador (ou programadora) teria de se deslocar lá, à sala do senhor utilizador (ou senhora utilizadora) e das duas uma: fazer debug no computador dele (ou dela) ou aprender como recriar o problema e depois fazer debug no seu computador.

Uma alternativa muito mais comodista é a seguinte:

  * Ir à transacção SE38;

  * Menu Utilitários -> Opções;

  * Escolher separadores "Editor ABAP" -> "Depuração";

  * No caixa "Depuração externa" introduzir o código de utilizador de quem se quer bisbilhotar;

  * Criar _breakpoints_ de sistema (não de sessão) no programa a depurar;

Agora é só dizer ao utilizador (ou utilizadora) para desatar a correr o programa lá longe no seu computador. No momento em que, na sessão alheia, for atingido um _breakpoint_ , aparece no ecrã do programador (ou programadora) uma janela de _debugger_ ligada a essa sessão alheia. E já está.

O Abapinho saúda-vos.
