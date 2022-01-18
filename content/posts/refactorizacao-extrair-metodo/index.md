---
title: 'Refactorizarás: Extrair método'
slug: refactorizacao-extrair-metodo
date: 2019-01-02 09:00:23
tags: [estilo, qc, qualidade]
categories: [artigos]
wordpressId: 4093
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'extrair método'
description: 'Primeiro de uma série de artigos sobre refactorização. Este aborda a técnica "Extrair método" que premite modularizar uma rotina complexa demais.'
---
No mundo do SAP, o código ABAP onde cai é onde fica.

Num dia o Manel faz uma coisa mal porque está com pressa ou não sabe fazer melhor. Um ano depois pedem ao António para fazer uma pequena alteração. O António vê a asneira do Manel mas não a melhora porque, por alguma razão, no mundo do SAP, alterar código que está a funcionar, por muito mau que seja, é tabu. Em vez disso, acrescenta o seu código ao já existente de forma geralmente acrítica.

Esta atitude, quando adoptada por todos, contribui para uma inevitável erosão do código de um sistema que, após alguns anos, se tornará ingerível.

No meu entender, isso está errado e vai contra os interesses do cliente. Aliás, mesmo se o cliente não quiser que se mexa no código antigo... eu mexo. Quem é ele para me dizer como é que se programa?

<!--more-->

Vou tentar fazer uma série de artigos em que descrevo situações de mau código que costumo encontrar e explicar as técnicas de refactorização que tento adoptar para o melhorar.

Estas técnicas de refactorização, umas mais simples e intuitivas, outras mais complexas e rebuscadas, foram já todas catalogadas, identificadas e nomeadas pelo mestre Martin Fowler (y sus amigos) no incontornável livro ["Refactoring - Improving the design of existing code"][1] e estão também disponíveis online para consulta [no seu site][2].

Hoje explicarei a técnica [Extrair método][3].

Pedem-me para adicionar uma determinada funcionalidade a uma rotina de uma classe antiga. Esta rotina já tem 150 linhas com uma série de SELECTs e de LOOP ATs e um monte de variáveis locais. Se apenas tiver de mudar um pormenor numa linha sou capaz de não tocar em mais nada. Mas se a intervenção implicar acrescentar novo código ou fazer alterações substanciais ao código existente, faço os possíveis para garantir que, no final da minha intervenção, a rotina saia melhorada e tenha menos linhas do que as que tinha quando a encontrei.

Exemplo (imagina que esta rotina tinha mais de 150 linhas):


{{< highlight ABAP >}}
METHOD select_data.
  DATA: t_bkpf TYPE ty_t_bkpf.
  FIELD-SYMBOLS: <s_bkpf> LIKE LINE OF t_bkpf.

  SELECT * FROM bkpf
    INTO CORRESPONDING FIELDS OF TABLE t_bkpf
    WHERE belnr IN me->r_belnr.

  LOOP AT t_bkpf ASSIGNING <s_bkpf>.
    SELECT SINGLE name1
      INTO <s_bkpf>-name1
      FROM kna1
      WHERE kunnr = <s_bkpf>-kunnr.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

Nota: eu sei que a rotina acima está errada e simplificada demais, mas serve apenas para exemplificar.

A primeira coisa que faço é identificar partes que sejam passíveis de serem modularizadas e a seguir encapsulo-as. Assim:


{{< highlight ABAP >}}
METHOD select_data.
  DATA: t_bkpf TYPE ty_t_bkpf.
  t_bkpf = select_bkpf( ).
  update_bkpf_with_customer_name( CHANGING ct_bkpf = t_bkpf ).
ENDMETHOD.

METHOD select_bkpf.
  SELECT * FROM bkpf
    INTO CORRESPONDING FIELDS OF TABLE rt_bkpf
    WHERE belnr IN me->r_belnr.
ENDMETHOD.

METHOD update_bkpf_with_customer_name.
  DATA: t_kna1 TYPE ty_t_kna1,
        s_kna1 LIKE LINE OF t_kna1.
  FIELD-SYMBOLS: <s_bkpf> LIKE LINE OF t_bkpf.

  IF ct_bkpf[] IS INITIAL.
    RETURN.
  ENDIF.

  SELECT kunnr name1
    FROM kna1
    INTO CORRESPONDING FIELDS OF t_kna1
    FOR ALL ENTRIES IN ct_bkpf
    WHERE kunnr = ct_bkpf-kunnr.

  LOOP AT ct_bkpf ASSIGNING <s_bkpf>.
    READ TABLE t_kna1 INTO s_kna1 WHERE kunnr = <s_bkpf>-kunnr.
    IF SY-SUBRC = 0.
      <s_bkpf>-name1 = s_kna1-name1.
    ENDIF.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

E pronto. Utilizei a técnica Extrair Método duas vezes para encapsular as duas coisas que a rotina fazia. Esta, que antes tinha mais de 150 linhas, tem agora muito menos. Já estou em condições de acrescentar o meu código que ficará, claro, também encapsulado num novo método qualquer.

Após ser refactorizado, o total de linhas do programa aumentou. Mas isso é irrelevante. O importante é que cada rotina seja pequena e se concentre em fazer apenas uma coisa. Algo que não acontecia na balbúrdia inicial.

Outra melhoria que aconteceu foi que antes a rotina estava a fazer um LOOP com um SELECT SINGLE lá dentro, algo que é muito pouco eficaz pois obriga a inúmeros acessos à base de dados. Ao refactorizar essa parte aproveitei para alterar para uma abordagem que faz um só SELECT que pede logo todos os registos de uma só vez. Certamente mais rápido.

Ainda que o que fiz seja simples, não deixa de haver um risco de regressão. Dependendo da criticidade do programa em questão, testes mais ou menos exaustivos deverão ser feitos para garantir que tudo continua a funcionar como antes. Mas a necessidade de fazer estes testes não deverá ser desculpa para não tocar no código antigo (a não ser que o código seja tão obscuro que torne demasiado difícil extrair os métodos de forma simples e segura). Ainda para mais quando a introdução da nova funcionalidade já obrigará necessariamente a que testes sejam feitos.

No final, a rotina que eu tinha de alterar passou de algo com 150 linhas para algo deste género:

{{< highlight ABAP >}}
METHOD select_data.
  DATA: t_bkpf TYPE ty_t_bkpf.
  t_bkpf = select_bkpf( ).
  update_bkpf_with_customer_name( CHANGING ct_bkpf = t_bkpf ).
  new_functionality_with_a_proper_name( CHANGING ct_bkpf = t_bkpf ).
ENDMETHOD.
{{< /highlight >}}

Muito mais legível não? E a partir de agora muito mais fácil de manter e muito mais resistente a regressões.

A próxima pessoa que tiver de alterar esta rotina terá muito mais facilidade em compreender o que esta faz e onde deverá fazer a sua intervenção. Se a sua intervenção consistir em acrescentar uma nova funcionalidade, esperemos que tenha o mínimo de brio profissional e crie um novo método em vez de espetar o seu código à bruta directamente ali, contribuindo assim para tornar a aumentar em vez de diminuir a entropia do código.

Foto: [Nicholas Erwin][4].

O Abapinho saúda-vos.

   [1]: https://martinfowler.com/books/refactoring.html
   [2]: https://refactoring.com/catalog/
   [3]: https://refactoring.com/catalog/extractMethod.html
   [4]: https://visualhunt.com/author2/7de346
