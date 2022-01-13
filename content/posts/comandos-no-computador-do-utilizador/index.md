---
title: 'Executa comandos no computador do utilizador'
slug: comandos-no-computador-do-utilizador
date: 2012-12-10 09:00:41
tags: [sapgui, sysadmin]
categories: [dicas]
wordpressId: 2084
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Já há uns tempos que o Abapinho não mexia com o fogo. Hoje mexerá.

Porque hoje mostrará como executar comandos DOS na máquina local do utilizador. Quando tiveres terminado de ler este artigo estarás apto a formatar o disco rígido de todos os teus utilizadores. Lidar com o perigo ajuda-nos a tomar consciência do poder que temos e da responsabilidade que vem junto com ele. Querido leitor, segue a tua consciência.

Não tentes isto em casa! Tenta no escritório ;)


{{< highlight ABAP >}}
DATA: i_returncode TYPE i.

CALL FUNCTION 'GUI_EXEC'
  EXPORTING
    command = 'FORMAT'     " É pá, isto assim não é um HELLO WORLD!
*    parameter = 'T:'
  IMPORTING
        returncode = i_returncode.
{{< /highlight >}}

Vá, vá, estava a brincar. Nada de brincar com o fogo. Queimas-te.

Obrigado [alifaan][1] pela foto.

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/alifaan/2608045107/
