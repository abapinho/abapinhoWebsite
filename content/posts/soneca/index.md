---
title: 'Soneca'
slug: soneca
date: 2011-06-17 11:43:28
tags: [performance]
categories: [dicas]
wordpressId: 832
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Volta não volta é preciso meter um programa a dormir. E como em quase tudo, há várias formas de o fazer, e umas formas são melhores do que outras.

A forma mais _standard_ de conseguir isto em ABAP é a seguinte:


{{< highlight ABAP >}}
WAIT UP TO 10 SECONDS.
{{< /highlight >}}

A vantagem do WAIT UP TO N SECONDS é que o processo é libertado durante estes 10 segundos, ficando assim disponível para quem o quiser apanhar. A grande desvantagem é que faz um COMMIT implícito, o que nem sempre é bom. Se não te importares com o COMMIT, esta é a melhor forma de adormeceres o teu programa. Nota que não dá para o adormecer por 1.5 segundos pois o parâmetro só aceita números inteiros.

Se um COMMIT não der jeito, porque tens um cursor aberto para a base de dados ou porque estás a meio de uma transacção, podes sempre fazer isto:


{{< highlight ABAP >}}
DATA: ZTIME LIKE SY-UZEIT.

GET TIME.

ZTIME = SY-UZEIT + 10.

DO.
  GET TIME.
  IF SY-UZEIT >= ZTIME.
     EXIT.
   ENDIF.
ENDDO.
{{< /highlight >}}

Mas fazer isto é muito parvo. Chama-se espera activa e é a última coisa que queres fazer num programa porque é o mesmo que metê-lo a correr numa passadeira de ginásio: cansa-se e não chega a lado nenhum.

Felizmente há uma alternativa mais saudável que, embora não liberte o processo, evita o malfadado COMMIT:


{{< highlight ABAP >}}
CALL FUNCTION 'ENQUE_SLEEP'
    EXPORTING
        seconds    = 10.
{{< /highlight >}}

O Abapinho saúda-vos.

Obrigado Sweet-Rainb0w pela foto.
