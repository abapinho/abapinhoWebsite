---
title: 'Pasta física vs pasta lógica'
slug: pasta-fisica-vs-pasta-logica
date: 2017-03-20 09:00:30
tags: []
categories: [dicas]
wordpressId: 3773
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Se num relatório chamado APP1 precisares de gravar um ficheiro numa determinada pasta do servidor (ex.: /export/app1/) e não quiseres que esta pasta seja um parâmetro, como fazes?

<!--more-->

O mais simples é criar uma constante com o nome físico da pasta: /export/app1.

Mas... e se amanhã este muda?

Para evitares ter de alterar o programa caso isso aconteça o ideal é:

  1. criares uma pasta lógica na AL11 (ex.: DIR_APP1) que aponte para a tua pasta física (se não tiveres permissões pede aos administradores de sistema);

  2. guardares o nome da pasta lógica numa variável do programa;

  3. usares o código abaixo para converter a pasta lógica na pasta física.


{{< highlight ABAP >}}
DATA: physical_dir TYPE DIRNAME_AL11.

CALL 'C_SAPGPARAM' ID 'NAME' FIELD gc_logical_dir_app1
        ID 'VALUE' FIELD physical_dir.
{{< /highlight >}}

Obrigado Nuno Morais pela dica.

O Abapinho saúda-vos.
