---
title: 'Dynamically call classes and methods'
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
Now, learn how to dynamically invoke a method.

Let’s go for it.

<!--more-->

How to invoke an instance method:

{{< highlight ABAP >}}
CALL METHOD ref->(f)
{{< /highlight >}}

How to invoke a static method:

{{< highlight ABAP >}}
CALL METHOD class=>(f) 
CALL METHOD (c)=>method
CALL METHOD (c)=>(f) 
{{< /highlight >}}

And how to invoke a method of the same class:

{{< highlight ABAP >}}
CALL METHOD (f)
CALL METHOD ME->(f) 
{{< /highlight >}}

Variable f is alphanumeric and holds the name of the method.
Variable c is also alphanumeric and holds the name of the class.

The related instructions manual is [here][1].

As if it weren’t enough, you can also pass through parameters dynamically, as follows:

{{< highlight ABAP >}}
CALL METHOD (class)=>(meth) 
      PARAMETER-TABLE 
        t_param.
{{< /highlight >}}

where _t_param_ is an internal table of type _ABAP_PARMBIND_TAB_.

The related instructions manual is [here][2].

You’ll find an example of this [here][2].

Very useful. Obviously, besides more confusing, since the code cannot be compiled, it will be forcibly slower than normal static calls. But it’s still good to know, because this can come in hand.

Update: Bruno Esperança points out, and I agree, that these dynamic calls should only be done strictly when necessary, since they will not be found through the "where-used" functionality.

Thanks, José Faria for showing me this.

Greetings from Abapinho.

   [1]: http://help.sap.com/abapdocu_70/en/ABENNEWS-46-OBJECTS-DYNAMIC.htm
   [2]: http://help.sap.com/abapdocu_70/en/ABAPCALL_METHOD.htm
