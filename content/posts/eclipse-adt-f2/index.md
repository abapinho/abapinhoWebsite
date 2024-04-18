---
slug: eclipse-adt-f2
title: A magia do F2 no Eclipse ADT
description: Com o F2 podes ver detalhes sobre variáveis, classes e métodos sem saíres de onde estás
date: 2024-04-22T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT F2]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

O Eclipse ADT chama-lhe _Code element information_.

<!--more-->

E é uma dádiva.

Imagina o seguinte cenário: estás a alterar um método de uma classe. Nesse método há uma variável e tu precisas de saber quais os valores declarados no domínio dessa variable's domain.

## No SAPGUI

1. Fazes duplo clique em cima da variável. Se essa variável estiver declarada, o editor salta para outra zona do ecrã e passa a mostrar a declaração dessa variável. Se variável tiver sido criada _in-line_ então salta para onde ela foi criada, o que é mais confuso porque continuas sem poder saber qual o tipo da variável. Mas vamos assumir que foi declarada.
2. Agora tens de fazer duplo clique em cima do elemento de dados com que ela foi declarada.
3. Aparece-te um popup a perguntar se queres gravar o código porque tens de saltar para outro contexto. Logo aqui é lixado porque tu ainda não irias gravar pois estás a meio de uma alteração e aquilo nem sequer está a compilar. Mas não tens hipótese, tens de gravar senão não sais dali.
4. Gravas. E lá vais tu para o terceiro contexto: o ecrã da `SE11` com os detalhes do elemento de dados.
5. Tornas a fazer duplo clique, desta vez em cima do domínio. Vais para o quarto contexto: o ecrã da `SE11` com os detalhes do domínio.
6. Carregas no separador _Value range_, que te leva ao quinto e último contexto: a lista de valores associados ao domínio. Vês o que tens a ver para tirar a tua dúvida e estás pronto para voltar ao código. Mas... estás tão longe dele.
7. Para lá chegares tens de fazer `F3`,
8. `F3`,
9. `F3`,
10. `F3`,
11. `F3`.

Achas isto razoável? Eu não.

## No Eclipse ADT

1. Colocas o cursor em cima da variável e carregas em `F2`. Aparece um pequeno popup contextual que te dá um link para o elemento de dados bem como a documentação a ele associada. O código, esse continua no mesmo sítio.
2. Clicas no link e na mesma janelinha agora vês os detalhes do elmenento de dados, com todas as suas descrições e um link para o domínio.
3. Clicas no domínio e agora tens os detalhes do domínio, incluíndo os valores a ele associados. Já está. Como fazes agora para voltar ao código? Na verdade tu continuas no código. Nunca de lá saíste.
4. Clicas algures fora da janela e ela desaparece. Pronto. Podes continuar o que estavas a fazer sem teres sido interrompido por 5 contextos diferentes. E podes fazer isto constantemente, que é o que eu faço.

Que tranquilidade.

## Conclusão

Portanto, se ainda estás a usar o SAPGUI e poderias estar a usar o Eclipse ADT, és granda totó.

O Abapinho saúda-vos.
