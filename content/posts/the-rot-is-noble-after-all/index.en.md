---
title: 'The rot is noble after all'
slug: the-rot-is-noble-after-all
date: 2016-02-22 09:00:45
tags: [fiori, hana, sapui5]
categories: [artigos]
wordpressId: 3404
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'fiori'
---
For many years I've been complaining about how backward ABAP development ecosystem is and how long it takes to evolve. Every time he heard me saying it a good friend of mine would wisely advise me to never bite the hand that feeds you.

But how can a man not speak out?

<!--more-->

It's exasperating to work 8 hours per day on that archaic thing they call ABAP Workbench after having tried modern IDEs like XCode and Eclipse. And when SAP kindly decides to add a new functionality to it (like contextualized auto-complete) only someone who has never used XCode, Eclise or VisualStudio can, blissful ignorance, feel happy about it. Because all the others, who know damn well these things were already trivial in other IDEs when Kurt Kobain was still alive, those can only breath a small sigh of relief and carry on trying to ignore all the rest that's still not there.

The first prize, though, goes to the total lack of control on has when using the current ABAP version control. How can it be that today, version control is still file-oriented? Knowing that a class is always comprised of multiple files, it's almost impossible not to screw up things when trying to rollback to a previous version of the whole class, since the version of each individual file must be changed manually independently. Besides the fact that it takes forever. Outside SAP the versioning systems have evolved so much and so quickly that Subversion, a system which until recently everyone considered sophisticated, is now obsolete due to the appearance of decentralized versioning systems like GIT. I worship GIT. But I'd even smile with joy if SAP would make available something as outdated as Subversion. But they don't seem to think it's needed.

Whoever goes to the vineyard won't be able to avoid noticing the rapes are starting to get rotten.

And suddenly.... in 2015... SAP surprised me. Because I undertood that, after all, these last years it has been doing a (late but careful) harvest of its (rotten but sweet) grapes and is now releasing a series of great late harvest wines. And instead of continuing to try (and fail) to evolve the dying ABAP IDE, it decided to start from scratch.

I had been hearing about HANA, Fiori and SAPUI5 for a while but I still hadn't understood how they were going to be used. It was just in 2015, mostly thanks to OpenSAP courses, that I started seeing all the pieces connect.

[In-Memory Data Management In a Nutshell][1] give you a clear idea of the technological revolution that HANA is when compared to conventional relational databases.

[Developing Mobile Apps with SAP HANA Cloud Platform][2] allows you to get practical about the UI side of things and have a taste of what it will be to develop Fiori and SAPUI5 applications.

[SAP S/4HANA in a Nutshell][3] e [SAP S/4HANA – Use Cases][4] explain how HANA's superpowers are already being used to implement the new applicational infrastructure which is about to replace R/3.

After so long complaining, a compliment is due:
What a great puzzle. I'm looking forward to start putting it together.

SAP has been absent-minded and slowly decaying for many years. But it finally noticed it, reinvented itself and is now accelerating madly towards the future. My friend, if you've also been absent-minded and slowly decaying, follow my advice and pay attention to what's happening around you because tomorrow may be too late and you'll miss the train (or should I say the space rocket).

Greetings from Abapinho.

   [1]: https://open.sap.com/courses/hana-warmup
   [2]: https://open.sap.com/courses/mobile2/resume
   [3]: https://open.sap.com/courses/s4h1-1
   [4]: https://open.sap.com/courses/s4h3
