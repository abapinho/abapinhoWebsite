---
slug: atributos-variaveis-globais
title: Atributos que são variáveis globais disfarçadas
description: Muitos atributos de classe são na realidade variáveis globais
date: 2026-06-08T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Não há coisa pior do que ver código a abusar das variáveis. São tão delicadas e no entanto tão mal tratadas, coitadas. E a quem as tem de ler. A pior forma de tratar uma variável é fazê-la global. Parece mentira mas em 2025 este crime continua a flagelar os nossos sistemas. Ora aqui está uma forma de lhes mostrar amor.

<!--more-->

Claro que agora, como quase toda a gente já usa classes, essas variáveis globais estão disfarçadas de atributos de classe. Mas a dura realidade é que quase todos os atributos de classe que se encontram hoje nos sistemas SAP por esse mundo fora são, na verdade, variáveis globais.

Porquê? Porque são variáveis auxiliares e não realmente atributos que definam o objecto que a classe representa nem componentes que a complementem.

Se tens uma classe chamada, sei lá, `cl_customer`, faz sentido que ela tenha um atributo `customer_number` do tipo `KUNNR`. OK, esse é realmente parte da identidade do `customer` e por isso faz todo o sentido estar lá.

O problema é quando lá começam a meter atributos que na verdade são variáveis auxiliares. E como é que se topa logo isso? Quando estas começam a ser usadas em vários métodos sem serem passadas por parâmetro. As variáveis globais são basicamente uma forma preguiçosa de comunicação entre diferentes métodos sem ter de as passar por parâmetro. Exemplo:

```abap
METHOD load_data.
  SELECT SINGLE name1 FROM kna1
    WHERE kunnr = @me->customer_number
    INTO @customer_name.
ENDMETHOD.

METHOD write_name.
  WRITE customer_name.
ENDMETHOD.
```

Topas? Isto é brincar com o fogo porque se calha alguém que não está familiarizado com o código chamar primeiro o método `write_name` sem chamar o `load_data` está o caldo entornado.

O correcto será sempre:

```abap
METHOD write_name.
  FINAL(customer_name) = get_name( ).
  WRITE customer_name.
ENDMETHOD.
```

Claro que se levanta já aos gritos a dizer: ah e a performance? Agora cada vez que chamas o `write_name` ele vai fazer um `SELECT`. É verdade. Mas se isso te preocupa então podes fazer uma cache. E aí sim faz sentido usares um atributo privado da classe, desde que lhe dês um nome que deixe explicito que se trata de uma cache:


```abap
PRIVATE SECTION.
  DATA cached_customer_name TYPE name1.

METHOD get_name.
  IF cached_customer_name IS INITIAL.
    SELECT SINGLE name1 FROM kna1
      WHERE kunnr = @me->customer_number
      INTO @cached_customer_name.
  ENDIF.
  RETURN cached_customer_name.
ENDMETHOD.
```

Assim já só faz o `SELECT` na primeira chamada e não corres o risco de dar asneira porque o `write_name` não depende de outros métodos.

Portanto: tenta sempre que as tuas variáveis sejam locais e pensa muito bem antes de decidires declarar um atributo numa classe: faz parte da identidade da classe? É um componente da sua composição? É uma cache? Se sim, muito bem, declara-a e usa-a em conformidade. Caso contrário, usa mas é variáveis locais e passa-as por parâmetro.

O Abapinho saúda-vos.
