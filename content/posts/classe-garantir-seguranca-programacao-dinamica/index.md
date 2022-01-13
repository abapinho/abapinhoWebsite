---
title: 'Classe para garantir segurança em programação dinâmica'
slug: classe-garantir-seguranca-programacao-dinamica
date: 2017-07-26 09:00:33
tags: [dinamico, seguranca, sql]
categories: [dicas]
wordpressId: 3830
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
No outro dia encontrei um programa que gerava um comando SQL com base em várias variáveis fixadas no código. Mas, por distracção ou ignorância, a alminha que fez aquilo achou que fazia sentido associar essas variáveis a símbolos de texto. Algo assim:

<!--more-->


{{< highlight ABAP >}}
l_where = 'WHERE a = 3'(001).
{{< /highlight >}}

Escusado será dizer que esta é uma grave falha de segurança porque qualquer Mr. Robot se poderá aproveitar da situação e, recorrendo à ferramenta de tradução, [injectar SQL malicioso][1] no programa. Podes aprender e ver mais exemplos de _SQL injection_ no [Guru99][2].

É importante ter sempre presente a segurança quando se trabalha com código dinâmico.

A classe CL_ABAP_DYN_PRG que pode ajudar nisso (e em muito mais). É uma classe cheia de pequenos métodos utilitários que convém conhecer pois podem dar muito jeito quando menos se espera:

  * CHECK_INT_VALUE

  * ESCAPE_QUOTES

  * ESCAPE_QUOTES_STR

  * QUOTE

  * QUOTE_STR

  * CHECK_COLUMN_NAME

  * CHECK_VARIABLE_NAME

  * CHECK_TABLE_NAME_STR

  * CHECK_TABLE_NAME_TAB

  * CHECK_TABLE_OR_VIEW_NAME_STR

  * CHECK_WHITELIST_STR

  * CHECK_WHITELIST_TAB

  * CHECK_TABLE_OR_VIEW_NAME_TAB

  * ESCAPE_XSS_XML_HTML

  * ESCAPE_XSS_JAVASCRIPT

  * ESCAPE_XSS_CSS

  * ESCAPE_XSS_URL

  * CHECK_CHAR_LITERAL

  * CHECK_STRING_LITERAL

A maior parte dos nomes dos métodos são auto-explicativos mas, se tiveres dúvidas, a classe está razoavelmente bem documentada.

No caso acima referido nenhum destes métodos por si só resolveria o problema. Mas no caso em que se espera um valor tipo:


{{< highlight ABAP >}}
"'Maria'"
{{< /highlight >}}

...para juntar a um comando SQL, convém garantir que o que lá vem não é algo tipo:


{{< highlight ABAP >}}
"'Maria'. DELETE MARA WHERE MATNR <> 'João'"
{{< /highlight >}}

E para garantir isso podes usar o método CL_ABAP_DYN_PRG=>ESCAPE_QUOTES(), por exemplo.

O Abapinho saúda-vos.

   [1]: https://www.w3schools.com/sql/sql_injection.asp
   [2]: https://www.guru99.com/learn-sql-injection-with-practical-example.html
