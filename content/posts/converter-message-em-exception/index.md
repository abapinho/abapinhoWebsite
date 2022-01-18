---
title: 'É tão simples converter uma MESSAGE numa EXCEPTION'
slug: converter-message-em-exception
date: 2019-11-04 10:30:44
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4304
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
description: 'Até à v7.40 era complicado converter uma mensagem numa excepção. Mas agora não podia ser mais simples. Aqui vais aprender como.'
---
Há alguns anos atrás [mostrei como se podia converter uma MESSAGE normal numa excepção tipificada][1]. Entretanto o ABAP evoluiu um bocadinho e agora, na versão 7.40, aquela solução complexa já não é necessária.

<!--more-->

Agora o comando EXCEPTION permite criar uma excepção a partir de uma MESSAGE.

Cenário mais óbvio: depois de, num método, chamar um módulo de função standard esta devolve uma mensagem mas o método devolve uma excepção e por isso há que converter uma na outra. Agora não podia ser mais simples.

Imaginemos a seguinte função que gera uma MESSAGE no caso de devolver um erro:

{{< highlight ABAP >}}
    CALL FUNCTION 'CONVERT_OTF'
      EXPORTING
        format                = 'PDF'
      IMPORTING
        bin_file              = r_pdf
      TABLES
        otf                   = it_otf
        lines                 = t_lines
      EXCEPTIONS
        err_max_linewidth     = 1
        err_format            = 2
        err_conv_not_possible = 3
        err_bad_otf           = 4
        OTHERS                = 5.
    IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
{{< /highlight >}}

Acreditem ou não basta acrescentar uma linha para transformar a MESSAGE numa EXCEPTION:

{{< highlight ABAP >}}
    CALL FUNCTION 'CONVERT_OTF'
      EXPORTING
        format                = 'PDF'
      IMPORTING
        bin_file              = r_pdf
      TABLES
        otf                   = it_otf
        lines                 = t_lines
      EXCEPTIONS
        err_max_linewidth     = 1
        err_format            = 2
        err_conv_not_possible = 3
        err_bad_otf           = 4
        OTHERS                = 5.
    IF sy-subrc <> 0.
        <b>RAISE EXCEPTION TYPE zcx_proj1</b>
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
{{< /highlight >}}

Isto funciona porque o RAISE EXCEPTION TYPE agora aceita o MESSAGE como parâmetro exactamente com sintaxe exactamente igual à do comando MESSAGE.

O Abapinho saúda-vos.

   [1]: {{< ref "converter-excepcao-em-classe-de-excepcao" >}}
