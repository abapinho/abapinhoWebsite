---
title: 'Chama dinamicamente classes e métodos'
slug: chamada-dinamicamente-classes-e-metodos
date: 2013-07-08 09:00:12
tags: [dinamico]
categories: [dicas]
wordpressId: 2387
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Ora aprende lá como invocar dinamicamente um método.

Vamos a isso.

<!--more-->

Como invocar um método de uma instância:

{{< highlight ABAP >}}
CALL METHOD ref->(f)
{{< /highlight >}}

Como invocar um método estático:

{{< highlight ABAP >}}
CALL METHOD classe=>(f) 
CALL METHOD (c)=>metodo
CALL METHOD (c)=>(f) 
{{< /highlight >}}

E como invocar um método da própria classe:

{{< highlight ABAP >}}
CALL METHOD (f)
CALL METHOD ME->(f) 
{{< /highlight >}}

A variável f é alfanumérica e contém o nome do método.
A variável c também é alfanumérica e contém o nome da classe.

O manual de instruções disto está [aqui][1].

Como se não bastasse, podes passar os parâmetros dinamicamente assim:

{{< highlight ABAP >}}
CALL METHOD (class)=>(meth) 
      PARAMETER-TABLE 
        t_param.
{{< /highlight >}}

em que _t_param_ é uma tabela interna do tipo _ABAP_PARMBIND_TAB_.

O manual de instruções disto está [aqui][2].

E encontras um exemplo da coisa [aqui][3].

Muito útil. Claro que, além de mais confuso, como o código não pode ser compilado será necessariamente mais lento do que as chamadas estáticas normais. Mas é bom saber porque pode dar jeito.

Nota adicional: O Bruno Esperança sugere, e com razão, que estas chamadas dinâmicas só devem ser feitas quando mesmo necessário, visto perder-se a funcionalidade "where-used".

Obrigado José Faria por me mostrares isto.

O Abapinho saúda-vos.

   [1]: http://help.sap.com/abapdocu_70/en/ABENNEWS-46-OBJECTS-DYNAMIC.htm
   [2]: http://help.sap.com/abapdocu_70/en/ABAPCALL_METHOD.htm
   [3]: http://help.sap.com/abapdocu_70/en/ABAPCALL_METHOD_DYNAMIC.htm
