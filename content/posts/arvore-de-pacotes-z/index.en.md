---
title: 'Tree of Z packages - A modest proposal'
slug: arvore-de-pacotes-z
date: 2019-10-23 09:00:46
tags: [estilo]
categories: [artigos]
wordpressId: 4291
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
If you regularly read Abapinho you probably know by now that I can't live without [ABAP Package Concept][1]. Nowadays the first thing I do when starting a new development is creating an encapsulated package to hold all its objects (in the most complex scenarios, I create it as a main package and then create multiple child sub-packages).

I lay here a modest proposal (unlike [the original one][2], mine is not sarcastic) to help organize thing a bit at system level.

<!--more-->

Packages have, until now, been mostly disregarded by ABAP programmers. And yet, they deserve to be treated as first class citizens. Good programmers shouldn't focus solely on IFs and SELECTs. They should be able to think and design their developments at a higher level. To look at their system and see blocks and interactions between them. Boxes inside boxes inside boxes. Like матрешки but without having to learn cyrillic. They should adopt [Domain-driven design][3], which is very well laid out in [this book][4] by the way.

But it's not enough that one or two developers adopt this paradigm. It is crucial for the system itself to be a reflection of that approach. And a good way to start making it happen is to have the bigger boxes already laid out, well defined and visible in the system. And that is my modest proposal.

Picture a system in which the 2 higher levels of packages have already been created centrally. All new developments (and ideally older ones which need to be modified) should be able to fit under one of the 2nd level packages.

**Level 0**
I know I said 2 levels but, in order to be able to group all 1st level together, we need to have a common parent package. Let's call it level 0. So, if our company is called ACME SA, I suggest calling the package ZACME. In an ideal system all custom code should be somewhere under this package.

**Level 1**
Of course there are multiple ways to do this, but we have to choose one and my suggestion is to follow the existing SAP concept of Application components which, conveniently, is already one of the configurable parameters of a package. So, I propose the following packages:

{{< highlight ABAP >}}
ZACME
  ZFI_ROOT
  ZMM_ROOT
  ZSD_ROOT
  etc...
{{< /highlight >}}

I add _ROOT to all of them because it's highly probable that you'll already have a legacy package called ZMM or ZFI serving as a big bucket for a lot of legacy code which you don't want to mess with. All the _ROOT packages relevant for this system should be created in advance so that they are readily available to all developers.

**Level 2**
It is tempting to group this level by kind of program (report, enhancements, interface, etc.). But my experience tells me that this is a bad idea because... it is very common for a single development to mix reports, enhancements, interfaces, etc. So I propose to use the same logic already applied to level 1 mirroring the second level of the same standard Application components tree from SAP:

{{< highlight ABAP >}}
ZACME
  ZFI_ROOT
    ZFI_GL (General ledger)
    ZFI_AP (Accounts payable)
    ZFI_AR (Accounts receivable)
    etc...
  ZMM_ROOT
    ZMM_PUR (Purchasing)
    ZMM_IM (Inventory management)
    etc...
{{< /highlight >}}

I suggest that all 2nd level packages already known to be necessary should be created beforehand. Others that come to be necessary should be created as needed arises.

Packages for level 0, 1 and 2 MUST be created as "Structure packages". This is extremely important. If they were to be created as "Main packages" they'd have to declare all of the package interfaces that are both needed and exported by all of their sub-packages. This would required them to be constantly modified. While our goal is to never having to touch them again.

Once this 2-level tree is created, all new developments should be created in packages placed underneath one of the 2nd level packages. For example, report XYZ belonging to Accounts payable should be placed in a package which (depending on the naming conventions, of course) could be called ZFI_XYZ and placed under ZFI_AP. So:

{{< highlight ABAP >}}
ZACME
  ZFI_AP
    ZFI_XYZ
{{< /highlight >}}

Third level packages should be "Main" if they are to be subdivided further or normal ones in the simpler cases. Furthermore, they should almost always be flagged as encapsulated (except when there is a good reason not to).

It is not well known that, if for some reason you change your mind on how a development is classified, the 3rd level packages can be safely moved to another place in the tree without any risk or consequence.

And this is my modest proposal. I've been trying to apply it for a while and I'm enjoying it. Of course it will never fit every scenario (what to do with developments which have both FI and MM stuff? I still don't know!) but it seems to be working fine. Please share your thoughts on this and do let me know if you try something similar.

Greetings from Abapinho.

   [1]: http://abapinho.com/en/2016/11/pacotes-locais/
   [2]: https://en.wikipedia.org/wiki/A_Modest_Proposal
   [3]: https://en.wikipedia.org/wiki/Domain-driven_design
   [4]: https://dddcommunity.org/book/evans_2003/
