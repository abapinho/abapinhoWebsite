---
title: 'Se amas o próximo, evita o CLEAR'
slug: evita-o-clear
date: 2021-12-13 09:00:59
tags: [estilo]
categories: [artigos]
wordpressId: 4771
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Demasiadas regressões acontecem porque alguém se esquece de fazer CLEAR ou de não fazer CLEAR a uma variável.

<!--more-->

Estes são os cenários em que já vi o CLEAR ser usado:

  1. Antes de atribuir o valor a uma variável;

  2. Antes, durante ou depois de um ciclo (LOOP, DO ou outro), para fazer reset a uma variável auxiliar;

  3. No início de uma rotina para iniciar os seus parâmetros;

  4. Quando uma tabela interna grande já não é precisa, para libertar memória;

  5. Porque é PRECISO fazer CLEAR a uma variável.

Vamos analisar cada um dos cenários:

1\. Antes de atribuir o valor a uma variável

Custa a acreditar mas já vi isto várias vezes:

{{< highlight ABAP >}}
DATA sum TYPE i.
CLEAR sum.
sum = a + b.
{{< /highlight >}}

É redundante. É inútil. É pateta.

Ou isto:

{{< highlight ABAP >}}
LOOP AT itbl INTO wa.
  calc = wa-a + wa-b.
  (...)
  CLEAR calc.
ENDLOOP.
{{< /highlight >}}

Não parece tão pateta como o primeiro exemplo, mas é.

Conclusão: é sempre inútil. Pára de fazer isto.

2\. Antes, durante ou depois de um ciclo

Isto é inútil, claro:

{{< highlight ABAP >}}
LOOP AT itbl INTO wa.
  (...)
  CLEAR wa.
ENDLOOP.
{{< /highlight >}}

Livra-te desse CLEAR.

Isto já não é inútil:

{{< highlight ABAP >}}
METHOD report_itbl_a.
  DATA sum TYPE i.
  LOOP AT itbl_a INTO wa.
    CLEAR sum.
    LOOP AT itbl_b INTO wb WHERE a = wa-a.
      sum = sum + wb-value.
    ENDLOOP.
    WRITE: / wa-a, sum.
  ENDLOOP.
ENDMETHOD.
{{< /highlight >}}

No entanto, este CLEAR também pode ser evitado se [encapsularmos][1] o conteúdo do LOOP exterior:

{{< highlight ABAP >}}
METHOD report_itbl_a.
  LOOP AT itbl_a INTO wa.
    sum = sum_itbl_b( wa-a ).
    WRITE: / wa-a, sum.
  ENDLOOP:
ENDMETHOD.

METHOD sum_itbl_b.
  result = REDUCE #(
    INIT sum = 0
    FOR wa in itbl_b WHERE ( a = a )
    NEXT sum = sum + wa-value ).
ENDMETHOD.
{{< /highlight >}}

Assim o CLEAR já não é necessário porque a variável auxiliar é local ao método SUM_ITBL_B.

A maior parte dos CLEARs podem ser evitados se o _scope_ das variáveis auxiliares for o menor possível.

3\. Para inicializar os parâmetros de uma rotina

Reumindo:

  * IMPORTING: Não podes nem deves fazer-lhes CLEAR;

  * CHANGING: Se a lógica de negócio o exigir, pode fazer sentido usar o CLEAR;

  * RETURNING: Isto é sempre passado por valor por isso começa já limpo, não há por que o limpar mais ainda;

  * EXPORTING: Como estes são passados por referência, foi sempre boa práctica usar CLEAR para limpar estes parâmetros logo no início da rotina. Mas o Clean ABAP sugere uma alternativa melhor: [passá-los valor][2].

Conclusão: O único cenário em que o CLEAR pode ser usado é para limpar um parâmetro CHANGING.

4\. Quando uma tabela interna grande já não é necessária

Se a RAM for escassa, é boa ideia tentar libertar memória pro-activamente o mais cedo possível. Mas nesse caso o CLEAR não é a melhor opção porque não liberta a memória imediatamente. Em vez disso, deverias usar o FREE.

5\. Porque é PRECISO fazer CLEAR a uma variável

Pronto. Este é o único cenário em que usar CLEAR faz todo o sentido: a lógica de negócio precisar de limpar uma variável.

A conclusão é: evita ao máximo usar CLEARs. São das maiores causas de regressões. Principalmente naquele tipo de código horrível com rotinas de milhares de linhas seguidas e dúzias de variáveis globais. Curiosamente, usei um CLEAR há uns dias por esta razão já depois de ter escrito este artigo. E reparei nisso exactamente porque uso o CLEAR mesmo muito raramente (até há uns dias também o usava para limpar parâmetros EXPORTING mas vou deixar de o fazer agora que sei que podem ser passados por valor.

O Abapinho saúda-vos.

   [1]: https://refactoring.com/catalog/extractFunction.html
   [2]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#dont-clear-value-parameters
