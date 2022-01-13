---
title: "In ABAP's name, I baptize you"
slug: eu-te-baptizo-em-nome-do-abap
date: 2015-10-26 09:00:05
tags: [estilo]
categories: [artigos]
wordpressId: 3218
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When we learn ABAP, we are taught a series of rules on how to name variables. Not everyone uses the same rules but, still, some strict rules are shared between many people:

  * Local variables must start with L: L_BUKRS;

  * Global variables must start with G: G_MODE;

  * Internal tables must have T_: LT_MARA;

  * Structures must have S_: LS_MARA;

  * Object references must have R_: R_CUSTOMER;

  * _input_ parameters must start with I, _output_ with O, _changing_ with C and _returning_ with R.

  * And the most stupid of all, _field-symbols_ must start with FS_: <FS_MARA>.

In the early XXI century those rules made some sense (except for the _field-symbols_ on, which was, and still is, as stupid as writing 'pencil' in all our pencils). Today they don't make much sense anymore. Let me explain.

<!--more-->

My own naming rules have changed over time. For instance, if global variables start with G_, there is no considerable advantage in using L_ to identify local variables: if they don't start with G_, they must be local. There goes one rule.

Things get trickier when we start to program in ABAP OO because, technically, global variables of a class are not really global variables but rather class attributes. There goes another rule.

Class references and _deep structures_ can encapsulate distinct complex data that involve tables, structures, other class references and so on. Does it make sense to name all those variables R_ prefix when, potentially they all represent internal tables? If we follow this logic, the great majority of the other rules also falls apart.

In the end, the only rule that still makes sense is the one that allows us to distinguish input, ouput and changing parameters.

Recently, Sérgio Fraga showed me [this article][1] that takes these ideas even further, and suggests some interesting alternatives.

Shortly, that article proposes that the name should no longer:

  * distinguishe global from local;

  * expose that data type (struture, internal table, etc.);

  * expose technical names (LT_MARA);

And should instead stay limited to:

  * describe its function (CUSTOMER);

  * distinguish singular from plural (LOOP AT CUSTOMERS INTO CUSTOMER);

  * distinguish parameter variables with I_, O_, C_ e R_.

And I think he is absolutely right.

It's hard to change something that rooted. And this specific matter will never gather consensus. For the community's benefit, though, it would be important if we all stop for a while to think about the damn names we are giving our variables. The world has evolved. Let us leave ITBL and WA_KNA1 behind...

Thank you Diogo Simões for the translation.

Thank you Stephen Lock for the [photo][2].

Greetings from Abapinho.

   [1]: http://scn.sap.com/community/abap/blog/2015/09/22/hungarian-beginners-course--a-polemic-scripture-against-hungarian-notation
   [2]: https://www.flickr.com/photos/stephendl/2212818035
