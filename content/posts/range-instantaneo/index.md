---
title: 'RANGE instantâneo - É só juntar água'
slug: range-instantaneo
date: 2011-07-11 11:07:07
tags: [estilo]
categories: [dicas]
wordpressId: 874
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Vou ensinar-te uma fórmula mágica para gerar um RANGE em que praticamente é só juntar água.

Imagina que queres fazer um RANGE a partir de uma seleção da base de dados para depois o utilizar num outro SELECT qualquer. Claro que o poderias fazer assim:


{{< highlight ABAP >}}
DATA: lt_kunnr TYPE STANDARD TABLE OF kunnr,
        lr_kunnr TYPE RANGE OF kunnr,
        wa_kunnr LIKE LINE OF lr_kunnr.
FIELD-SYMBOLS: <kunnr> LIKE LINE OF lt_kunnr.

SELECT kunnr
  INTO TABLE lt_kunnr
  FROM kna1.

wa_kunnr-sign = 'I'.
wa_kunnr-option = 'EQ'.
LOOP AT lt_kunnr ASSIGNING <kunnr>.
  wa_kunnr-low = <kunnr>.
  APPEND wa_kunnr TO lr_kunnr.
ENDLOOP.
{{< /highlight >}}

E assim usaste 15 linhas de código e 4 variáveis.
Mas vê lá agora esta alternativa:


{{< highlight ABAP >}}
DATA: r_kunnr TYPE RANGE OF kunnr,
      wa_kunnr LIKE LINE OF r_kunnr.

SELECT kunnr AS low
  INTO CORRESPONDING FIELDS OF TABLE r_kunnr
  FROM kna1.

wa_kunnr-sign = 'I'.
wa_kunnr-option = 'EQ'.
MODIFY r_kunnr FROM wa_kunnr TRANSPORTING sign option WHERE low <> ''.
{{< /highlight >}}

Repara como logo no SELECT renomeio logo o campo KUNNR para LOW por forma a poder metê-lo directamente no sítio certo do RANGE.
Repara também com o comando MODIFY actualiza de uma só vez todas as linhas do RANGE com apenas os campos que explicitamos.

E assim, usando apenas 10 linhas de código e 2 variáveis ficas com uma coisa que é mais sintética, mais bonita de se olhar e que manda muito mais sainete.

Granda pinta, não? É só vantagens.

Eu farto-me de usar isto.

Atenção que os RANGEs têm um limite de (não tenho a certeza mas acho serem) 2000 linhas.

O Abapinho saúda-vos.
