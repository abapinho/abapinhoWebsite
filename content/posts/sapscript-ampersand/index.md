---
slug: sapscript-ampersand
title: Usar & em textos de SAPScript
description: Há um truque para conseguir mostrar & em textos SAPScript
date: 2022-11-14T09:00:00Z
tags: [sapscript]
categories: [dicas]
keywords: [sapscript escape]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Imagina que queres mostrar um _url_ num formulário. Colocas o _url_ no texto do formulário e partes do princípio que tudo correrá bem. Porque, de facto, geralmente tudo corre bem. Só que às vezes...

<!--more-->

## Doença

Se experimentares usar este _url_:

```text
https://era.uma.vez?ums=mulher&com=cara&de=bolacha
```

No formulário vai aparecer isto:

```text
https://era.uma.vez?ums=mulherde=bolacha
```

Estranho, não é? Pois.

## Diagnóstico

Não é nada óbvio mas o problema é que as variáveis em _SAPScript_ estão balizadas por &:

```text
O meu nome é &SY-UNAME&.
```

O _SAPScript_ olha para aquele _url_  e vê lá a variável `&com=cara&` no meio e substitui-a pelo seu conteúdo. Mas como esta variável não é variável nenhuma, o seu conteúdo não é coisa nenhuma também. E o resultado é que a falsa variável e os dois & desaparecem sem deixar rasto.

## Tratamento

A solução é garantir que o _SAPScript_ sabe que aqueles & são mesmo &. E para isso é preciso usar esta sequência de escape:

```text
<(>&<)>
```

É estranho? É. Funciona? Funciona. Não pentes mais nisso. Toma nota e segue viagem.

Portanto, o _url_ lá de cima deverá ficar assim:

```text
https://era.uma.vez?ums=mulher<(>&<)>com=cara<(>&<)>de=bolacha
```

Problema resolvido.

O Abapinho saúda-vos.
