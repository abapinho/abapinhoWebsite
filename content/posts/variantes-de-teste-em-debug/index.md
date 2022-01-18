---
title: 'Cria variantes de teste em funções a partir do debugger'
slug: variantes-de-teste-em-debug
date: 2012-02-20 10:00:42
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1447
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Imagina que estás a fazer debug de uma transacção e entras numa função e encontras algo interessante. Tão interessante que tens de lhe fazer debug várias vezes. A via convencional é tornar a iniciar o debug da transacção desde o início. Que seca.

Mas há uma via mais directa. Quando estás a fazer debug de uma função podes, directamente a partir do debugger, criar dados de teste para essa função com os valores com que a função tiver sido chamada nessa instância. É assim:

<!--more-->

1\. Faz debug e entra dentro de uma função. Neste caso entrámos na DD_SHLP_CALL_FROM_DYNP:

![][1]

2\. Depois carregas no ícone das ferramentas assinalado a vermelho na imagem anterior. Aparece-te uma árvore de opções:

![][2]

3\. Escolhe "Gravar parâmetros como dados de teste(SE37). Aparece-te a caixa de diálogo seguinte pedindo o nome da variante de dados de teste:

![][3]

Agora é só ires à SE37, fazeres F8 para testar a função, carregares lá em cima no botão "Diretório de dados de teste" e constatares com alegria que a nova variante que acabaste de criar no debugger está lá à tua espera.

Já podes fazer debug à função directamente sem teres de fazer debug à transacção toda. Muito mais prático, não te parece?

Nota que isto não funcionará com funções que dependam de estado, ou seja, que dependam de dados criados por outras funções do mesmo grupo de funções. Um exemplo disto é a função WRITE_FORM que só pode ser invocada depois da função OPEN_FORM.

Obrigado Sérgio Fraga pela valiosa dica.

O Abapinho saúda-vos.

   [1]: images/debugger_grava_variante_fm.png (Grava variante de módulo de função 1)
   [2]: images/debugger_grava_variante_fm2.png (Grava variante de módulo de função 2)
   [3]: images/debugger_grava_variante_fm3.png (Grava variante de módulo de função 3)
