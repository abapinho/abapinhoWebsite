---
title: 'Global macros'
slug: macros-globais
date: 2011-05-19 18:02:41
tags: [estilo, segredo]
categories: [dicas]
wordpressId: 752
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
[In a previous article][1] we talked about macros, a relatively obscure and little used feature that can be both useful as well as create a huge mess. But these aren’t the only ABAP macros. There are others that are even more obscure and with even greater potential to mix up a system: the global macros.

I don’t know if I should tell you this, as it’s so strange…
But, I don’t think it’s a good idea to hide it…
Therefore, I’ll tell all.

Macros can be defined for the entire system and can then be used in any ABAP program. The TRMAC table exists for this purpose:

[![image][2]][3]

Its use is obvious: NAME is the name of the macro, NUMM is the line number and LINE represents one line of code. A macro with 3 lines should have three entries in the TRMAC table.

Now that you know these macros exist, please forget about them. If the danger of using these macros is not obvious to you then you too are also a danger. Why then do I make the effort to talk about these freaks? Mainly because it shows that the famous "BREAK user" command is nothing more than a global macro, as you can see from the image in the table. Very strange.

_(Thanks to Bruno Filipa for the tip)_

Greetings from Abapinho.

   [1]: {{< ref "macros-velocidade-de-ponta" >}}
   [2]: images/tabela_trmac.png (Tabela TRMAC)
   [3]: images/tabela_trmac.png
