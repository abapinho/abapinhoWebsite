---
title: 'Desbloquear objectos numa ordem de transporte'
slug: desbloquear-objectos-numa-ordem-de-transporte
date: 2014-08-25 09:00:26
tags: [sysadmin]
categories: [dicas]
wordpressId: 2877
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando alteras um objecto e o guardas numa ordem de transporte ele normalmente fica bloqueado. Dentro da ordem de transporte é podes bloquear objectos que não estejam já bloqueados que não estão já bloqueados noutra ordem. Mas, uma vez bloqueados, como é que se desbloqueiam?

<!--more-->

É na transacção SE03.

Escolhes a opção “Desbloquear objectos” e depois introduzes a ordem ou a tarefa cujos objectos pretendes desbloquear. E zás, F8!

Nota que se introduzires uma ordem de transporte esta ferramenta não desbloqueará os objectos das suas tarefas, só mesmo os que se encontram ao nível da ordem.

Quando fores à SE01 espreitar constatarás que os objectos da ordem ou da tarefa estão desbloqueados e podem agora, por exemplo, ser bloqueados noutra ordem.

Obrigado Nuno Morais pela dica que em boa hora chegou.

O Abapinho saúda-vos.
