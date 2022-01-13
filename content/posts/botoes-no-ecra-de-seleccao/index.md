---
title: 'Mete botões no ecrã de selecção'
slug: botoes-no-ecra-de-seleccao
date: 2012-04-16 10:00:45
tags: [ui]
categories: [dicas]
wordpressId: 1612
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando num relatório é preciso criar botões para os utilizadores carregarem, normalmente recorre-se ao Screen Painter para criar um ecrã que depois é invocado pelo report com CALL SCREEN. Mas, a não ser que o ecrã a desenhar tenha já alguma complexidade, não é preciso apanhar a valente seca de fazer um ecrã que depois fica para lá. Ecrãs sempre me irritaram.

Mostro aquí um exemplo de utilização de botões num normalíssimo ecrã de selecção recorrendo a um botão chamado PUSHBUTTON e a um truque muito esperto chamado ONLI.

<!--more-->

Vamos então por partes, como de costume. Primeiro a declaração do ecrã:


{{< highlight ABAP >}}
REPORT zbotoes.

TABLES: sscrfields.
DATA: g_ucomm TYPE syucomm.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-200.
SELECTION-SCREEN PUSHBUTTON /1(35) p_but1 USER-COMMAND but1.
SELECTION-SCREEN PUSHBUTTON /1(35) p_but2 USER-COMMAND but2.
SELECTION-SCREEN PUSHBUTTON /1(35) p_but3 USER-COMMAND but3.
SELECTION-SCREEN END OF BLOCK b1.
{{< /highlight >}}

Usamos os botões tipo PUSHBUTTON e definimos o USER-COMMAND por forma a que ao serem carregados invoquem imediatamente o PAI do ecrã (vulgo AT SELECTION-SCREEN) sem ter de se carregar em ENTER nem em F8.

Nota a declaração da tabela SSCRFIELDS. Esta será necessária mais tarde no PAI para obter o código do botão carregado.

Os nomes dos botões P_BUT1, P_BUT2 e P_BUT3 são na verdade variáveis que deverão conter o texto que aparece no botão. Isto é no mínimo bizarro e só revela que os gajos que inventaram o ABAP deviam estar bêbedos. Mas enfim, definamos então os textos:


{{< highlight ABAP >}}
INITIALIZATION.
  p_but1 = 'Carrega aqui'(001).
  p_but2 = 'Ou aqui'(002).
  p_but3 = 'Ou então aqui'(003).
{{< /highlight >}}

Assim definimos o texto dos botões de forma a que possa ser traduzido [conforme já se explicou aqui][1]. A seguir implementa-se o PAI:


{{< highlight ABAP >}}
AT SELECTION-SCREEN.
* Se se carregou num dos botões, guarda o seu código e continua  
  IF sscrfields-ucomm EQ 'BUT1' OR 
      sscrfields-ucomm EQ 'BUT2' OR 
      sscrfields-ucomm EQ 'BUT3'.    
    g_ucomm = sscrfields-ucomm.    
    sscrfields-ucomm = 'ONLI'. " Finge que carregou em F8. Belo truque ;)
  ENDIF.
{{< /highlight >}}

Ao redefinir o UCOMM com 'ONLI' fingimos que se carregou no F8 o que faz com que o programa avance para o START-OF-SELECTION. Aí continuamos a vidinha:


{{< highlight ABAP >}}
START-OF-SELECTION.  
  CASE g_ucomm.    
    WHEN 'BUT1'.      
      WRITE 'Carregaste no botão de cima'.
    WHEN 'BUT2'.
      WRITE 'Carregaste no botão do meio'.
    WHEN 'BUT3'.  
      WRITE 'Carregaste no botão de baixo'.
ENDCASE.
{{< /highlight >}}

E o resultado é este:

![][2]

Percebeste? É invulgar e requer uns truques meio manhosos, mas não é nada de especial. Faz bom proveito.

O Abapinho saúda-vos.

   [1]: {{< ref "programas-poliglotas" >}}
   [2]: images/botoes-ecra-seleccao.png (Botões no ecrã de selecção)
