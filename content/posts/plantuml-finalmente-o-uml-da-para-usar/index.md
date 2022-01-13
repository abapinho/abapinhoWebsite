---
title: 'PlantUML - Finalmente o UML dá para usar'
slug: plantuml-finalmente-o-uml-da-para-usar
date: 2017-09-05 09:00:59
tags: [documentacao, estilo]
categories: [artigos]
wordpressId: 3842
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
**Prólogo**

Quando digo que gosto de usar diagramas de classes UML para documentar o meu código as pessoas acham que sou maluco.

**Introdução**

O UML ganhou má fama porque as pessoas pensam que primeiro se faz o diagrama de classes todo em UML e só depois o programa. Mas isso era em 1996, quando se achava que a primeira coisa a fazer era o desenho técnico todo, mesmo que na práctica ninguém nunca o fizesse.

Hoje em dia felizmente já não temos vergonha de dizer que o próprio acto de programar é já em si uma forma de desenhar.

<!--more-->

E o que é o desenho senão uma forma háptica de pensar? A própria etimologia da palavra desenho é rica em significados que associam esta actividade a uma forma práctica (por oposição a teórica) de pensar: desenho, desígnio, de-signo. Os que sabem que é no próprio acto de desenhar que se vai construindo o pensamento usam, além do lápis, uma borracha, para ir reajustando o desenho à medida que vão evoluindo os pensamentos que este tenta descrever.

**Desenvolvimento**

Voltando às classes e à sua programação. Esta necessidade de ajustar o desenho acontece sempre que há choques com a realidade. Esses choques dificilmente acontecerão durante o exercício abstracto de tentar antecipar que classes e relações serão necessárias para resolver determinado problema. Choca-se muito mais depressa com a realidade quando já se está a tentar programar algo concreto. Por isto não acredito em fazer especificações técnicas nem desenhar diagramas de classes UML antes de criar o programa.

Mas depois sim. E os diagramas de classes UML são uma excelente forma de documentação. O problema está nas ferramentas de que disponho para desenhar estes diagramas: Visio, draw.io, LucidChat, etc. Até são decentes para fazer a primeira versão. Mas todas têm um formato proprietário, e acabamos por exportar para PDF ou PNG para juntar o desenho à documentação oficial. Ora um dia no futuro, quando começarem a pedir alterações ao programa, quem vier a fazer a alteração, das duas uma: ou nem se preocupa em actualizar o diagrama de classes ou não consegue fazê-lo porque já não tem acesso ao documento original.

**Conclusão**

E é aqui, na conclusão, que começa o que realmente interessa, e que me fez escrever este artigo.

Existe uma linguagem descritiva que permite usar apenas texto para criar todo o tipo de diagramas UML. Chama-se [PlantUML][1].

Exemplo:

{{< highlight ABAP >}}
@startuml
class Car

Driver - Car : drives >
Car *- Wheel : have 4 >
Car -- Person : < owns

@enduml
{{< /highlight >}}

Para juntar o útil ao agradável, há uma [ferramenta grátis][2] que permite converter PlantUML em bonitos desenhos:

O resultado do código acima é este:

[![Diagrama de classes UML][3]][3]

Bonito, não é?

Na página dos [diagramas de classes][4] há uma série de exemplos simples para ajudar a começar.

Agora basta juntares o texto PlantUML e a imagem gerada à especificação técnica para que no futuro qualquer um a possa manter actualizada sem ter de depender de nenhum programa externo. Extraordinário.

**Epílogo**

Para tornar a coisa ainda mais interessante, um senhor chamado Jacques Nomssi desenvolveu um programa ABAP que permite gerar automaticamente o diagrama de classes em PlantUML a partir do nosso código ABAP. Assim nem sequer temos de nos chatear a aprender PlantUML. O programa encontra-se no final [deste artigo][5].

E se ainda o teu sistema ainda não tem a versão 7.4 então podes usar uma versão mais antiga do programa que o autor deixou [num comentário][6].

Obrigado Sérgio Fraga por me dares a conhecer esta maravilha.

   [1]: http://plantuml.com
   [2]: http://www.plantuml.com/plantuml
   [3]: images/plantuml_class_diagram.png
   [4]: http://plantuml.com/class-diagram
   [5]: https://blogs.sap.com/2017/04/27/plantuml-diagrams/
   [6]: https://blogs.sap.com/2017/04/27/plantuml-diagrams/#comment-381746
