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
  src: 'images/thumbnail.jpg'
---
I recently found a program which was generating an SQL statement by concatenating several variables with fixed SQL parts. But, either by not paying attention or simple ignorance, the person who did it, thought it would make sense to associate a text-symbol to each of these variables with. Something like this:

<!--more-->


{{< highlight ABAP >}}
l_where = 'WHERE a = 3'(001).
{{< /highlight >}}

Needless to say, this is a serious security flaw. Mr. Robot could take advantage of the situation and, by using the translation tool, [inject malicious SQL][1] in the program. You can learn more and find examples about SQL injection at [Guru99][2].

It is always important to keep security in mind when working with dynamic code.

Class CL_ABAP_DYN_PRG can help you do this (and much more). The class is full of small utility methods which you should know about because they can be useful when you least expect:

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

Most of the methods names are self-explanatory but, if you have questions, the class is reasonably well documented.

None of these methods would solve the above example. But in the case in which you expect a value like:


{{< highlight ABAP >}}"'Maria'"{{< /highlight >}}

...to add it to an SQL statement, you must be sure that what you get is not something like:


{{< highlight ABAP >}}"'Maria'. DELETE MARA WHERE MATNR <> 'John'"{{< /highlight >}}

And to make sure that doesn't happen, you can use method CL_ABAP_DYN_PRG=>ESCAPE_QUOTES(), for example.

Greetings from Abapinho.

   [1]: https://www.w3schools.com/sql/sql_injection.asp
   [2]: https://www.guru99.com/learn-sql-injection-with-practical-example.html
