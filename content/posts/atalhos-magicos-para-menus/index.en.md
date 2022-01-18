---
title: 'Magical shortcuts to menus'
slug: atalhos-magicos-para-menus
date: 2019-09-10 09:00:02
tags: [gui, segredo]
categories: [dicas]
wordpressId: 4268
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['comando atalhos menu']
---
If you, who are reading this, believe that everything written in Abapinho is literally true, what I'm about to tell you will be a disappointment: when I said magical I didn't mean that it was supernatural. It is just a nicer way of saying it is surprising and unexpected. I took this liberty just as you'd say "I could kill for a glass of water" knowing that you would never do it. Having made this clear, let's continue.

<!--more-->

It is known that we can access SAP GUI menus with the keyboard using the ALT key. But there is another less known way which uses the transaction box: write a period (this: .) followed by the shortcut letters (the ones underlined) of each menu option.

So, for example, if you want to see the Glossary which is under Help you just have to write:

{{< highlight ABAP >}}
.hg
{{< /highlight >}}
And then press ENTER like with any other command.

Bear in mind, though, that this assumes your GUI is in English. If it were in Portuguese, the Glossário option would be under the menu Ajuda and the command would then be:

{{< highlight ABAP >}}
.ag
{{< /highlight >}}

Of course the command can get more complex. [In a previous post][1] I explained that command %pc allows you to save the output list in a local file. But the same effect could be obtained using the following command (in an English GUI):

{{< highlight ABAP >}}
.ytai
{{< /highlight >}}
These are the shortcut letters for menu System/List/Save/Local file.

Magical, right?

And why would you use this? Well, besides using it to impress your friends and improve your status quo, you can also put these comments in a _BATCH-INPUT_ or _CALL TRANSACTION.

Greetings from Abapinho.

   [1]: {{< ref "atalho-para-gravar-lista-em-ficheiro-local" >}}
