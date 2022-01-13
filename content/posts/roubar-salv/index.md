---
title: 'Roubar o conteúdo de uma SALV'
slug: roubar-salv
date: 2013-10-14 10:04:02
tags: [salv, segredo]
categories: [artigos]
wordpressId: 2444
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Um amigo de um amigo de um amigo disse que um amigo dele conhecia um amigo que, num bar de alterne ali nas docas, lhe explicou como roubar os dados a uma SALV.

<!--more-->

Presume que já existe um programa que mostra os seus resultados numa SALV e que te pedem para fazeres algo adicional a esses dados. Tipo guardá-los numa ficheiro ou seja lá o que for. Até há pouco tempo eu pensava que teria de alterar esse programa e acrescentar-lhe código para, antes de ele apresentar a ALV, pegar nos dados e fazer então o que com eles quiser. Mas imagina que é um programa standard que não pode ser alterado. O que fazer? Uma cópia do standard? Isso é sempre de evitar.

O truque é manipulares o ambiente que rodeia a ALV de forma a que ela não chegue a ser apresentada e depois, sem sequer a SALV reparar, ires buscar os resultados à memória. É rebuscado mas nada complicado. Passo a ensinar como se faz:

A primeira manha é executar um comando muito especial que faz com que os dados da SALV não sejam apresentados:


{{< highlight ABAP >}}
cl_salv_bs_runtime_info=> set(
      display  = abap_false
      metadata = abap_false
      data     = abap_true ).
{{< /highlight >}}

Manhoso. Muiiito manhoso.

Agora que o ambiente está controlado, podes mandar correr qualquer programa que mostre uma SALV. Só que ela já não vai ser mostrada. Portanto, podes fazer algo tipo isto:


{{< highlight ABAP >}}
SELECT-OPTIONS: so_budat FOR mkpf-budat.
SUBMIT rm07mlbd WITH datum IN so_budat AND RETURN.
{{< /highlight >}}

Normalmente este relatório termina com uma SALV. Mas desta vez não. Desta vez termina em silêncio.

Finalmente, para obteres os dados da SALV precisas da segunda manha, um autêntico golpe de prestidigitação:


{{< highlight ABAP >}}
DATA: ls_data TYPE REF TO data.

cl_salv_bs_runtime_info=>get_data_ref(
  IMPORTING r_data = ls_data ).
ENDTRY.
{{< /highlight >}}

E zás!, os dados da SALV estão em teu poder. Agora podes usá-los como bem te aprouver:


{{< highlight ABAP >}}
FIELD-SYMBOLS: <lt_data> TYPE table,
               <l_data> TYPE data.
DATA: s_belege TYPE stab_belege.

ASSIGN ls_data->* TO <lt_data>.
LOOP AT <lt_data> ASSIGNING <l_data>.
  MOVE-CORRESPONDING <l_data> TO s_belege.
  WRITE: / s_belege-mblnr.
ENDLOOP.
{{< /highlight >}}

Nota que o método GET_DATA_REF() lança a excepção CX_SALV_BS_SC_RUNTIME_INFO se algo falhar por isso convém envolveres a sua invocação num bloco TRY CATCH.

Obrigado Luís Rocha por teres partilhado a informação do amigo do amigo do amigo do teu amigo.

O Abapinho saúda-vos.
