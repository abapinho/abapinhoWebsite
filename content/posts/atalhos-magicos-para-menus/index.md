---
title: 'Atalhos mágicos para menus'
slug: atalhos-magicos-para-menus
date: 2019-09-10 09:00:02
tags: [gui, segredo]
categories: [dicas]
wordpressId: 4268
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Se tu que estás a ler isto achares que tudo o que está escrito no Abapinho é literalmente verdade, o que te vou dizer a seguir vai desiludir: quando disse mágico não quis dizer que era sobrenatural. É só uma forma mais abrilhantada de dizer que é surpreendente e inesperado. Tomei esta liberdade um bocado como quando dizes "estou morto de sede" e no entanto ainda estás vivo. Tendo clarificado isto, podemos continuar.

<!--more-->

É sabido que podemos aceder aos menus do SAP GUI com o teclado usando a tecla ALT. Mas há outra forma menos conhecida: escrevendo na caixa de transacção um ponto (este: .) seguido das letras de atalho (que estão sublinhadas) de cada opção do menu.

Assim, por exemplo, se quiseres ir ver o Glossário que está debaixo do menu Ajuda só tens de escrever:

{{< highlight ABAP >}}
.ag
{{< /highlight >}}
E depois... ENTER com em qualquer outro comando.

Claro que isto presume que estás a usar o GUI em português. Se estiver em inglês o menu é Help e a opção é Glossary e aí o comando já é:

{{< highlight ABAP >}}
.hg
{{< /highlight >}}

E o comando pode ser mais complicado. [Num artigo anterior][1] expliquei que o comando %pc permite gravar a lista num ficheiro local. Mas isso também poderia ser feito com o seguinte comando (num GUI em inglês):

{{< highlight ABAP >}}
.ytai
{{< /highlight >}}

Que são as letras da opção de menu System/List/Save/Local file.

Mágico, não?

E para que serve? Bem, além de servir para impressionar os amigos e melhorar o teu estatuto profissional, pode servir para introduzir comandos de menu num _BATCH-INPUT_ ou _CALL TRANSACTION.

O Abapinho saúda-vos.

   [1]: {{< ref "atalho-para-gravar-lista-em-ficheiro-local" >}}
