---
title: 'Decimais para alfa-numéricos sem depender do utilizador'
slug: decimais-para-alfa-numericos-sem-depender-do-utilizador
date: 2013-04-08 09:00:46
tags: [estilo, i18n]
categories: [dicas]
wordpressId: 2221
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Ao ler um ficheiro com valores numéricos para uma tabela interna ou vice-versa, o sucesso da conversão destes depende de o utilizador tem definido o ponto ou a vírgula como separador decimal. É costume ir então ler a configuração do utilizador e depois, adaptar os valores vindos do ficheiro com ponto ou vírgula conforme.

Mas isto é lamentável e pouco elegante. Devia haver uma forma de não fazer a coisa depender do utilizador.

E há.

<!--more-->

É assim:


{{< highlight ABAP >}}
* Forçamos o formato padrão dos Estados Unidos da América do Norte
SET COUNTRY 'US'.

* Agora fazemos o que temos a fazer
WRITE wrbtr TO value CURRENCY 'USD'.

* E no fim tornamos ao formato definido para o corrente utilizador
SET COUNTRY space.
{{< /highlight >}}

Mais simples do que andar a ler a configuração do utilizador, não?

Obrigado Pierre Ameye pela dica.

E obrigado a a Alexis Tejeda pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/alexonrails/4759137435/
