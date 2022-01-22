---
title: 'Partial Analyses in SE30'
slug: se30-parciais
date: 2011-11-28 11:37:25
tags: [debug, performance]
categories: [dicas]
wordpressId: 1153
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Obviously you already know the SE30 transaction (run time analysis) and obviously you use it often to analyse standard programs and to discover tables, functions, BADIs and similar contained within them.

But if you are like me, then you have a love-hate relationship with this transaction – on the one hand you love it because it enables you to see the guts of a program without having to debug it, yet on the other hand you hate it because normally the list of guts tends to have thousands of lines and becomes unmanageable.

But I am not myself any more because since I discovered that SE30 enables you to do partial analyses, my relationship with it has transformed into one of pure love. And from now on you'll also be able to love it in its entirety because I'm going to teach you this little secret.

  1. Transaction SE30;

  2. In the block "Measurement Restrictions" create a variant with a name different from the DEFAULT;

  3. In the variant, activate "Specific Units";

  4. Insert the transaction or program or function module to be analysed;

  5. Load in "Run" (normally now the analysis would start, but as we have selected "Specific Units", it starts as deactivated and it has to be activated explicitly);

  6. Navigate inside the program that you are analysing until you arrive at the point that you wish to analyse;

  7. Activate the analysis by writing **/ron** in the top of the command field;

  8. Do what you have to do;

  9. Deactivate the analysis by writing **/roff** at the top;

  10. Exit the program and return to the SE30 screen.

You have just done a partial analysis, so instead of the typical thousands of lines, there are only tens or hundreds of lines which occur between the commands **/ron** and **/roff**. More useful. don't you think?

Leverage the feature and explore other possibilities made available by "Measurement Restrictions" variants.

Thanks to Michael Opoczynski for this lesson.

And thanks to [* Cati Kaoe *][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/catikaoe/3234711319/in/photostream/
