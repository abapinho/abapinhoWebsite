---
slug: desmamar-a-se24
title: Desmamar a SE24
description: Tira as rodinhas da bicicleta
date: 2022-10-03T09:00:00+01:00
tags: [se24]
categories: [artigos]
keywords: [se24]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A transacção SE24 esconde parcialmente o código atrás de um GUI. Supostamente é para nosso benefício. Mas o que aparenta ser conveniente torna-se na realidade muito limitativo.

<!--more-->

## Porquê

- 🍼 Impede o programador de conhecer verdadeiramente a sintaxe completa de uma classe em ABAP;
- 🚢 Exige constante navegação entre as várias partes da classe, o que acaba por ser lento e confuso;
- 🌎 Torna muito difícil olhar para a classe como um todo.

E depois há a vergonha, claro:

```text
- Olá, sabes ABAP?
- Sim, sei.
- Escreve lá, aqui e agora, uma classe "Hello World" em ABAP.
- Não consigo sem a SE24.
- Ah, pensei que soubesses ABAP. Adeus.
```

Ao abandonar a amigável mas condescendente SE24 ganhamos controlo sobre todos os aspectos acima mencionados.

## Como

Primeiro lembra-te que _o que não mata engorda_. Ah, não, espera, enganei-me no provérbio. Eu queria dizer aquele em estrangeiro: _no pain no gain_ 😓:

- 🤔 Compreende que, depois de anos a andar de bicicleta com rodinhas, se tirares as rodinhas no início vais desequilibrar-te. Primeiro vais sentir falta da navegação fofinha;
- 🧘‍♂️ Compreende e acredita que _primeiro estranha-se, depois entranha-se. Passado algum tempo vais odiar cada vez que te obrigarem a voltar à navegação pateta da `SE24`.

### Começa como um _Padawan_

- Continua a trabalhar na `SE24` mas...
- Muda para o modo _source-code based_ e...
- Lentamente aprender a sintaxe necessária para implementar uma classe, os seus métodos e atributos...
- Mudando de volta para o modo _form-based_ sempre que tiveres dúvidas.

### Depois torna-te um _Jedi_

- Instala o Eclipe e o ADT (ABAP Development Tools);
- Conecta o Eclipse aos teus ambientes de desenvolvimento;
- Adiciona os pacotes com que precisas de trabalhar;
- Disfruta o IDE moderno: código fonte + navegação + introspecção + funcionalidades extra:
  - Refactoring (renomeia sem parar!);
  - Todos os erros identificados automaticamente no código sem teres de compilar;
  - Abre dúzias de janelas que não desaparecem se a ligação ao SAP for abaixo;
  - Vê _in loco_ os detalhes técnicos de qualquer variável ou tipo de dados sem teres de navegar para longe do código;
  - Etc.

O Abapinho saúda-vos.
