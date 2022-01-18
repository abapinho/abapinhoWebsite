---
title: 'Programa a programação dos programas'
slug: programa-a-programacao-dos-programas
date: 2016-01-18 09:00:47
tags: [segredo]
categories: [dicas]
wordpressId: 3369
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Uma das coisas que distingue o homem dos restantes animais é o facto de ser capaz de pensar o pensamento.

Um pardal pode pensar "estou assustado, vou dizer piu piu piu" e, como consequência, quem estiver ao pé dele ouve "piu piu piu".

<!--more-->

Mas que se saiba nunca um pardal pensou "porque é que eu pensei em dizer piu piu piu por estar assustado?". O que é uma limitação do caraças. Limitação que os seres humanos, para o bem e para o mal, não têm. Os seres humanos pensam sobre o pensamento. Pensam demais provavelmente (mas isso é conversa para outro blog). O ser humano pensa "olha um pardal" e logo a seguir pensa "olha eu a pensar em olhar um pardal" e logo a seguir pensa "olha eu a pensar que estou a pensar em pensar em olhar um pardal" e assim por adiante. Alguns até ficam eternamente presos neste ciclo (mas isso também é conversa para outro blog).

O SAP não é um ser humano mas também sabe fazer uns truques de introspecção.

Um deles usa a função `RS_TOOL_ACCESS` que permite aceder programaticamente a todas as ferramentas do ABAP Development Workbench. Por exemplo isto mostra uma classe em modo de visualização:


{{< highlight ABAP >}}
CALL FUNCTION 'RS_TOOL_ACCESS'
  EXPORTING
    operation           = 'SHOW'
    object_name         = 'CL_GUI_FRONTEND_SERVICES'
    object_type         = 'CLAS'
    position            = 0
  EXCEPTIONS
    not_executed        = 01
    invalid_object_type = 02.
{{< /highlight >}}

Se isto não é pensar o pensamento é o quê?

E há montes de operações disponíveis que não vou explicar aqui até porque nem todas são óbvias. Mas podes explorar o código da função, em particular o CASE operation a partir da linha 384.

Portanto, pelo menos teoricamente, juntando uns algoritmos genéticos mais uns de redes neuronais com mais uns pozinhos é capaz de se conseguir fazer o programa ZABAPER, que recebe como parâmetros de entrada uma especificação funcional e um prazo e gera sozinho todo o código necessário.

Obrigado Nuno Morais pela dica.

Foto: [brewbooks][1] via [Visualhunt.com][2] / [CC BY-SA][3]

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/brewbooks/7780990192/
   [2]: http://visualhunt.com/
   [3]: http://creativecommons.org/licenses/by-sa/2.0/
