---
title: 'PlantUML - Finally UML became simple to use'
slug: plantuml-finalmente-o-uml-da-para-usar
date: 2017-09-05 09:00:59
tags: [documentacao, estilo]
categories: [artigos]
wordpressId: 3842
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'plantuml'
description: 'PlantUML é uma linguagem descritiva que permite documentar diagramas de classe UML de forma simples sem depender de ferramentas externas'
---
**Foreword**

When I say that I like to use UML class diagrams to document my code, people think I'm crazy.

**Introduction**

The UML has gained a bad reputation because people think that, first you make the classes diagram in UML and only then write the program. But that was in 1996, when you the good practices said the first thing to do was the whole technical spec, even if no one really did it.

Nowadays, fortunately, we are no longer ashamed to say that the very act of programming is already in itself a way of drawing.

<!--more-->

And what is drawing is but a haptic way of thinking? The very etymology of the Portuguese word for drawing - desenho - is rich in meanings that associate this activity with a practical (as opposed to theoretical) way of thinking: desenho, design, de-sign. Those who know that it is in the very act of drawing that thoughts are created always use an eraser together with the pencil, so they can readjust the drawing to match the evolution of the thoughts that it tries to describe.

**Development**

Back to classes and their programming. The need to adjust the drawing happens whenever there are clashes with reality. Such clashes will hardly ever occur during the abstract exercise of trying to anticipate which classes and relationships will be needed to solve a given problem. But they'll occur much more frequently when you are already trying to program something. This is why I do not believe in making technical specifications or drawing diagrams of UML classes before creating the program.

But once it's created, yes, documentation is a must. And UML class diagrams are a great form of documentation. But the available tools are the problem: Visio, draw.io, LucidChat, etc. They are decent enough to make the first version. But they all have a proprietary format, and we end up exporting it to PDF or PNG to add it to the official documentation. So, one day in the future, when the program needs to be changed, whoever makes the change either does not bother to update the class diagram or he can not do it because he no longer has access to the original document.

**Conclusion**

And it is here, in the conclusion, that what really matters begins, the reason I'm writing this article.

There is a descriptive language that allows you to use only text to create all kinds of UML diagrams. It's called [PlantUML][1].

Example:

{{< highlight ABAP >}}
@startuml
class Car

Driver - Car: drives >
Car * - Wheel: have 4 >
Car - Person: < owns

@enduml
{{< /highlight >}}

And guess what!, there is a [free tool][2] that allows you to convert PlantUML into beautiful drawings. This is the result of the above code:

[![UML Class diagram][3]][4]

Pretty, isn't it?

On the [class diagrams][5] page there are a number of simple examples to help you get started.

So now, just make sure you keep both the plain text PlantUML and the generated image together with the technical specification and you will always be able to update it without depending on external programs. Extraordinary.

**Epilogue**

To make things even more interesting, a gentleman named Jacques Nomssi developed a nice ABAP program that allows you to automatically generate the class diagram in PlantUML directly from ABAP code. So we do not even have to bother to learn PlantUML. The program is at the end of [this article][6].

And if your system still does not have version 7.4 then you can use an older version of the program that the author left [ in a comment ][7].

Thank you, Sérgio Fraga, for letting me know this marvel existed.

   [1]: http://plantuml.com
   [2]: http://www.plantuml.com/plantuml
   [3]: images/plantuml_class_diagram.png
   [4]: images/plantuml_class_diagram.png
   [5]: http://plantuml.com/class-diagram
   [6]: https://blogs.sap.com/2017/04/27/plantuml-diagrams/
   [7]: https://blogs.sap.com/2017/04/27/plantuml-diagrams/#comment-381746
