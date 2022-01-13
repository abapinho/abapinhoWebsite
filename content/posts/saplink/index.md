---
title: 'O SAPlink'
slug: saplink
date: 2012-12-03 09:00:00
tags: [sysadmin]
categories: [artigos]
wordpressId: 2091
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
O SAPlink é um programa Z que se instala no ambiente de desenvolvimento e que permite importar e exportar os mais variados tipos de objectos do Workbench.

Olha aqui exemplos de como o SAPlink pode ser usado:

  * Transferir uma tabela de um sistema SAP para outro

  * Partilhar uma classe na Internet

  * Fazer um backup local de segurança de um conjunto de programas antes de fazer uma alteração perigosa

  * Guardar um desenvolvimento no nosso repositório pessoal (no [Evernote][1], claro) para o caso de vir a precisar dele mais tarde noutro projecto

  * Etc.

<!--more-->

O SAPlink funciona com plugins. Tem um plugin para cada tipo de objecto. Há plugins para montes de coisas: classes, grupos de função, smartforms, tabelas, conteúdo de tabelas, etc. Ainda assim, há montes de coisas sem plugins. E há alguns plugins com limitações. Por exemplo, embora exista um plugin para classes, há uns tempos precisei de exportar classes abstractas e deu asneira. Aqui tens a [lista dos plugins][2] disponíveis que vai sendo actualizada à medida que estes são desenvolvidos.

Se no início o SAPlink é pouco intuitivo, uma vez compreendido é muito fácil de usar. Tem, como seria previsível, dois modos de funcionamento, um de exportação e outro de importação de objectos. Além disso tem duas formas de armazenar os objectos, os nuggets e os slinkees. Fiquemo-nos pelos Nuggets que são os mais comuns.

Para saberes se o SAPlink já existe no teu sistema SAP procura o programa ZSAPLINK na SE38. Se não existir terás de [instalá-lo][3].

Agora a aula prática.

Imagina então que queres exportar uma objeto de um SAP para outro. Uma tabela ou um programa ou o que te apetecer. Deverás fazer o seguinte:

  1. Cria um nugget escolhendo a opção "Create new nugget" e escolhe um nome para ele. Quando fizeres F8 o SAPGui pede-te uma localização onde criará um ficheiro com o nugget no teu disco, ainda vazio, pronto a receber objectos;

  2. Em seguida escolhe a opção "Add object to nugget". Em baixo escolhes o tipo de objecto (a lista está limitada aos plugins instalados), o nome do objecto e o nome do ficheiro nugget que criaste anteriormente. Quando fizeres F8 o SAPlink exportará o objecto para o teu ficheiro. Repararás pelas opções que podes também exportar de uma só vez todos os objectos de um pacote ou de um transporte.

Se abrires o ficheiro vais ver que é um XML com o teu objecto lá guardado num formato reconhecido pelo plugin do SAPlink. Agora vai ao SAP onde queres meter a tabela que acabaste de exportar e faz o contrário, ou seja:

  1. Escolhe a opção "Import nugget" e escolhe o nugget que queres importar. Podes ainda decidir se queres escrever por cima dos objectos já existentes;

  2. Quando fizeres F8 o SAPlink tentará importar os objectos que existirem no nugget que escolheste;

  3. Vai à SE80, escolhe "objectos inactivos" e o teu utilizador e lá, agrupados nos "objectos locais" encontrarás os objectos criados pelo SAPlink

  4. Agora podes não só activá-los como escolher um pacote os os queiras colocar

Um boneco ilustrativo:

![][4]

Se ainda tens dúvidas, vai ler o manual.

E se precisares de algum tipo de objecto que o SAPlink ainda não suporte, faz-te homenzinho ou mulherzinha e considera contribuir desenvolvendo o plugin para ele.

Como se diz em inglês, o SAPlink é muito peixe!

[http://www.saplink.org][5]

Nota: No passado [falei de outro programinha][6] destes que permitia a mesma coisa. Pois fica sabendo que não tem nada a ver porque este é mil vezes melhor.

O Abapinho saúda-vos.

   [1]: {{< ref "evernote" >}}
   [2]: https://cw.sdn.sap.com/cw/docs/DOC-145448
   [3]: https://cw.sdn.sap.com/cw/docs/DOC-144115
   [4]: images/saplink_ecra.png (Ecrã do SAPlink)
   [5]: http://www.saplink.org/
   [6]: {{< ref "downloadupload" >}}
