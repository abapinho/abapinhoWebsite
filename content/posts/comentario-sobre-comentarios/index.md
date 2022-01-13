---
title: 'Comentário sobre comentários'
slug: comentario-sobre-comentarios
date: 2018-11-26 09:00:19
tags: [estilo]
categories: [dicas]
wordpressId: 4120
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Na escola aprende-se que o código deve ter sempre comentários. Depois, na vida real, descobrimos que nem toda a gente prestou atenção na escola.

Sempre tive o cuidado de comentar os vários passos do meu código, especialmente as partes mais obscuras ou que não são auto-explicativas.

Mas depois de ler o livro _[Clean Code][1]_ do [Uncle Bob][2], a minha opinião mudou. Hoje acredito que quanto menos comentários melhor. E no entanto não acho que esta mudança seja contraditória.

<!--more-->

A lógica que agora adopto é: sempre que sinto que algo precisa de ser comentado então é porque esse algo precisa de ser encapsulado dentro deu um método. Exemplifico.

Antes eu faria isto:

{{< highlight ABAP >}}
METHOD processa_clientes.
  DATA: t_kna1 TYPE STANDARD TABLE OF kna1.
  FIELD-SYMBOLS: <s_kna1> LIKE LINE OF t_kna1.

* Selecciona clientes
  SELECT kunnr name1 
    INTO CORRESPONDING FIELDS OF TABLE t_kna1 
    FROM kna1 
    WHERE kunnr IN r_kunnr.

* Escreve clientes no ecrã
  LOOP AT t_kna1 ASSIGNING <s_kna1>.
    WRITE \ <s_kna1>-name.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

Agora faço isto:

{{< highlight ABAP >}}
METHOD processa_clientes.
  escreve_clientes_no_ecra( selecciona_clientes( r_kunnr ) ).
ENDMETHOD.
{{< /highlight >}}

E depois crio os seguintes métodos:

{{< highlight ABAP >}}
METHOD selecciona_clientes.
  SELECT kunnr name1 
    INTO CORRESPONDING FIELDS OF TABLE rt_kna1 
    FROM kna1
    WHERE kunnr IN r_kunnr.
ENDMETHOD.

METHOD escreve_clientes_no_ecra.
  FIELD-SYMBOLS: <s_kna1> LIKE LINE OF it_kna1.
  LOOP AT it_kna1 ASSIGNING <s_kna1>.
    WRITE \ <s_kna1>-name.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

Como podem ver, o código dos 3 métodos é agora auto-explicativo e os comentários deixam de ser necessários.

Graças a esta abordagem, hoje o meu código tem muito menos comentários e, no entanto, é muito mais legível. Claro que continuo a usar comentários. Mas apenas quando tenho de explicar como um algoritmo funciona, porque adoptei determinada abordagem ou para dar algum context extra que me pareça relevante.

Ainda oiço muita gente dizer que só faz sentido criar um método quando este vai ser reutilizado. Disparate. E ainda oiço muita gente dizer que não vale a pena criar um método quando este só vai ter uma linha de código. Outro disparate.

O Abapinho saúda-vos.

   [1]: https://www.goodreads.com/book/show/3735293-clean-code
   [2]: https://en.wikipedia.org/wiki/Robert_C._Martin
