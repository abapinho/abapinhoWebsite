---
title: 'Fecha a janela encalhada'
slug: fecha-a-janela-encalhada
date: 2014-03-03 17:30:56
tags: [debug, sapgui]
categories: [dicas]
wordpressId: 2610
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quantas vezes te aconteceu ficar com uma janela "pendurada" quando terminas um debug?

<!--more-->

Ou seja, lançaste o teu programa em modo de depuração, analisaste o que tinhas para analisar e, quando o programa termina, a janela (sessão 1) original apresenta os resultados; mas a janela do debug (sessão 2) continua ali, pendurada, e só a consegues aniquilar se saíres da transacção em que estiveres na sessão 1.

Desagradável.

Mas há uma solução: para matares a sessão do depurador basta escreveres "/hx" na janela inicial. E pronto, fechas a janela encalhada e evitas um resfriado!

Podes ainda ser mais astuto e pré-configurar esta opção na configuração do depurador: Quando estiveres em modo de depuração, no menu, activa a seguinte opção:

Settings > Change Debugger Profile/Settings > Close Debugger After 'Continue'(F8) and Roll Area End

Já agora, isto acontece devido à arquitectura de 2 processos do novo depurador de ABAP. Vê este e mais detalhes do novo debugger [aqui][1].

O Sérgio Fraga saúda-vos.

O Abapinho agradece a Sérgio Fraga.

   [1]: http://sap4u.org/media/userfiles/articles/pdf/26.pdf
