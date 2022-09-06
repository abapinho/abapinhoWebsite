---
slug: prefixos
title: Livrei-me finalmente dos prefixos
description: prefixos
date: 2022-09-12T09:09:00+01:00
tags: [estilo]
categories: [artigos]
keywords: [prefixos]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Demorei muitos anos mas finalmente livrei-me do raio dos prefixos.

<!--more-->

Durante 20 anos escrevia as variáveis assim:

```text
GT_T001 = tabela interna, global da T001
LS_T001 = estrutura local da T001
IV_BUKRS = parâmetro de entrada, empresa
RV_MATNR = parâmetro de retorno com código de material
GO_CONSTS = referência para instância de classe de constantes
```

Depois deixei de usar o `L` de _local_ e o `V` de _value_. Os que não têm `L` são implicitamente locais e os que não têm `V` são implicitamente valores:

```text
GT_T001
S_T001
I_BUKRS
R_MATNR
GO_CONSTS
```

Há alguns anos atrás decidi experimentar seguir o [conselho do Clean ABAP][1] e abandonar os prefixos todos. Isto só foi possível porque as minhas classes e métodos são tão pequenos e as variáveis têm nomes tão intuitivos que não preciso dos prefixos para entender o que fazem:

```text
T001_LIST
T001
COMPANY
R_MATERIAL
CONSTANTS
```

Finalmente há coisa de um ano decidi seguir o [conselho do Clean ABAP][2] para chamar sempre `RESULT` ao parâmetro de retorno de um método. Passou a ser muito mais claro qual a variável a preencher com o resultado. E como o nome do método descreve o que faz fica sempre claro o que é que cada `RESULT` representa:

```text
T001_LIST
T001
COMPANY
RESULT
CONSTANTS
```

Portanto, como naqueles anúncios de produtos para emagrecer, aqui fica o antes e o depois:

```text
GT_T001 => T001_LIST
LS_T001 => T001
IV_BUKRS => COMPANY
RV_MATNR => RESULT
GO_CONSTS => CONSTANTS
```

E tu, ainda usas prefixos? Se sim, reflecte sobre isto: quando programas em Python ou em C++ não usas prefixos. Porquê? Porque o ABAP é provavelmente a única linguagem de programação em que se considera normal e desejável usar tantos prefixos. Mas [não tem de ser assim][3].

Obrigado Frank Kehren pela [foto][4].

O Abapinho saúda-vos.

  [1]: <https://github.com/SAP/styleguides/blob/master/clean-abap/CleanABAP.md#avoid-encodings-esp-hungarian-notation-and-prefixes>
  [2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#consider-calling-the-returning-parameter-result>
  [3]: <https://www.youtube.com/watch?v=y_ra8X_8waA>
  [4]: <https://visualhunt.com/re10/230d9bf8>
