---
title: '<!--:pt-->Constantes inconstantes<!--:-->'
slug: constantes
date: 2009-06-02 15:24:07
tags: []
categories: [artigos]
wordpressId: 84
draft: false
---
As constantes não o são. Toda a gente sabe. Quando se define uma constante, é certo como a morte que mais cedo ou mais tarde alguém vem e muda-a. Quando isto acontece, quem usa os valores directamente no código ABAP está feito ao bife; Quem define constantes no código só tem de alterar o valor num sítio mas vê-se ainda assim obrigado a editar o programa e a transportá-lo, coisa que, dependendo do grau de burocracia do ambiente em que se está, se pode revelar complicada. Este artigo apresenta uma solução simples mas sofisticada para gerir de forma centralizada todas as constantes de um sistema SAP através do uso de uma tabela de utilizador central onde se manterá todos os valores constantes e de uma classe com alguns métodos estáticos que serão usados para os obter.

<!--more-->

**A Tabela**

Para definir a tabela seguiremos os sequintes requisitos:

  1. Num sistema existem vários desenvolvimentos independentes (a que chamaremos RICEF)

  2. Num mesmo desenvolvimento poderemos necessitar de definir constantes para vários campos diferentes (a que chamaremos FIELDNAME)

  3. Para um mesmo campo podemos ter de ocorrer mais que uma constante (a que chamaremos OCCURENCE) (Ex. tipo de movimento no caso A e tipo de movimento no caso B)

  4. Uma única constante pode ser constituída por vários valores e usaremos um contador (a que chamaremos COUNTER) para os distinguir.

  5. Cada valor pode ser um número ou um intervalo de valores (um RANGE por isso usaremos SIGN, OPTION, LOW, HIGH).

A nossa tabela fica então assim:.


{{< highlight ABAP >}}
<table border="0" cellspacing="5" cellpadding="5">
<tr>
	<th>Nome</th>
	<th>Chave</th>
	<th>Elemento</th>
	<th>Descrição</th>
</tr>
	<tr><td>MANDT</td><td>X</td><td>MANDT</td><td>Client</td></tr>
	<tr><td>RICEF</td><td>X</td><td>CHAR6</td><td>RICEF ID</td></tr>
	<tr><td>FIELDNAME</td><td>X</td><td>NAME_FELD</td><td>Field name</td></tr>
	<tr><td>OCCURRENCE</td><td>X</td><td>CHAR6</td><td>Occurrence of RICEF</td></tr>
	<tr><td>COUNTER</td><td>X</td><td>NUMC3</td><td>Counter of RICEF</td></tr>
	<tr><td>UE_SIGN</td><td>&nbsp;</td><td>TVARV_SIGN</td><td>ABAP: ID: I/E (include/exclude values)</td></tr>
	<tr><td>UE_OPTION</td><td>&nbsp;</td><td>TVARV_OPTI</td><td>ABAP: Selection option (EQ/BT/CP/...)</td></tr>
	<tr><td>UE_LOW</td><td>&nbsp;</td><td>CHAR45</td><td>Low Value</td></tr>
	<tr><td>UE_HIGH</td><td>&nbsp;</td><td>CHAR45</td><td>High Value</td></tr>
</table>
{{< /highlight >}}

Por ser muito utilizada, pouco alterada e ter relativamente poucos registos esta tabela deverá ser definida como "fully buffered". Por os seus dados serem bastante críticos, deve ser também definida como uma tabela de "customizing" de forma a que as alterações tenham de ser efectuadas no ambiente de desenvolvimento e depois transportadas para produtivo.

**As operações**

Para evitar confusão evitaremos aceder directamente à tabela e aceder-lhe-emos sempre através de métodos. Identificámos 3 operações necessárias:

  1. Obter um valor constante
Quando sabemos que uma constante está definida apenas como um valor fixo, podemos querer obtê-lo e colocá-lo numa variável.

  2. Obter um conjunto de valores
Muitas vezes uma constante é representada não por um valor mas sim por muitos. Neste caso, podemos obter um _RANGE_ de valores.

  3. Verificar um valor
Verificar se o valor que temos é igual ao que está definido. Por exemplo, um user-exit só deve ser executado para um determinado tipo de movimento.

Optámos por definir um único método privado genérico que acede à tabela que é depois chamados pelos outros 3. Embora a tabela seja "fully buffered", optámos também por manter uma cache local que permite um acesso ainda mais rápido. Em seguida apresentamos o código da classe com os seus métodos.

Primeiro a definição da classe:


{{< highlight ABAP >}}
class YIDV02_CL_HARDCODED definition
public
final
create public .

*"* public components of class YIDV02_CL_HARDCODED
*"* do not include other source files here!!!
public section.

constants C_BYPASS_CACHE_YES type XFELD value 'X'. "#EC NOTEXT
constants C_BYPASS_CACHE_NO type XFELD value ' '. "#EC NOTEXT

class-methods GET_VALUE
	importing
		value(RICEF) type YIDV02_RICEF
		value(FIELDNAME) type NAME_FELD optional
		value(OCCURRENCE) type YIDV02_OCCUR optional
		value(COUNTER) type YIDV02_CNT optional
	exporting
		value(FIELDVALUE) type CHAR45 .

class-methods GET_RANGE
	importing
		value(RICEF) type YIDV02_RICEF
		value(FIELDNAME) type NAME_FELD optional
		value(OCCURRENCE) type YIDV02_OCCUR optional
		value(COUNTER) type YIDV02_CNT optional
	exporting
		!IT_RANGE type YIDV02_T_RANGE .

class-methods CHECK_VALUE
	importing
		value(RICEF) type YIDV02_RICEF
		value(FIELDNAME) type NAME_FELD optional
		value(OCCURRENCE) type YIDV02_OCCUR optional
		value(COUNTER) type YIDV02_CNT optional
		value(FIELDVALUE) type CHAR45
		!IGNORE_NOT_DEFINED type XFELD optional
	exceptions
		NOT_FOUND
		NOT_DEFINED .
{{< /highlight >}}

Agora a secção privada:

{{< highlight ABAP >}}
*"* private components of class YIDV02_CL_HARDCODED
*"* do not include other source files here!!!
private section.

types:
BEGIN OF ty_cache,
	ricef TYPE yidv02_ricef,
	fieldname TYPE name_feld,
	occurrence TYPE yidv02_occur,
	counter TYPE yidv02_cnt,
	hardct TYPE yidv02_t_hardcoded,
END OF ty_cache .
types:
	ty_t_cache TYPE STANDARD TABLE OF ty_cache .

class-methods FETCH_DATA
	importing
		value(RICEF) type YIDV02_RICEF
		value(FIELDNAME) type NAME_FELD
		value(OCCURRENCE) type YIDV02_OCCUR optional
		value(COUNTER) type YIDV02_CNT optional
		!BYPASS_CACHE type XFELD optional
	exporting
		!ROW_COUNT type I
		!IT_HARDCODED type YIDV02_T_HARDCODED .
{{< /highlight >}}

O método privado FETCH_DATA:


{{< highlight ABAP >}}
METHOD fetch_data .
* 0. local data structures
	DATA: wa_yidv02_cache TYPE ty_cache.

	STATICS: lt_yidv02_cache TYPE ty_t_cache.

	DATA: lv_occurrence TYPE yidv02_occur,
			lv_counter TYPE yidv02_cnt.

* 0. Occurrence Internal Format
	CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
		EXPORTING
			input = occurrence
		IMPORTING
			output = occurrence.

* 1. Check cache
	IF bypass_cache IS INITIAL.
		READ TABLE lt_yidv02_cache INTO wa_yidv02_cache
		WITH KEY ricef = ricef
					fieldname = fieldname
					occurrence = occurrence
					counter = counter.
		IF sy-subrc = 0.
			it_hardcoded[] = wa_yidv02_cache-hardct.
			DESCRIBE TABLE it_hardcoded LINES row_count.
			EXIT.
		ENDIF.
	ENDIF.

* 2. Inicialize cache criteria
	CLEAR wa_yidv02_cache.
	wa_yidv02_cache-ricef = ricef.
	wa_yidv02_cache-fieldname = fieldname.
	wa_yidv02_cache-occurrence = occurrence.
	wa_yidv02_cache-counter = counter.

* 3. Select from database
	CLEAR: lv_occurrence,
	lv_counter.

	IF ricef EQ space.
		ricef = '%'.
	ENDIF.

	IF fieldname EQ space.
		fieldname = '%'.
	ENDIF.

	IF occurrence IS INITIAL.
		lv_occurrence = 'ZZZZZZ'.
	ELSE.
		lv_occurrence = occurrence.
	ENDIF.

	IF counter IS INITIAL.
		lv_counter = '999'.
	ELSE.
		lv_counter = counter.
	ENDIF.

	SELECT *
	INTO TABLE it_hardcoded
	FROM yidv02_hardcoded
	WHERE ricef EQ ricef
	AND fieldname LIKE fieldname
	AND occurrence BETWEEN occurrence AND lv_occurrence
	AND counter BETWEEN counter AND lv_counter.

	IF sy-subrc EQ 0.
		DESCRIBE TABLE it_hardcoded LINES row_count.
	ELSE.
		row_count = 0.
	ENDIF.

* 4. Save to cache
	IF bypass_cache IS INITIAL.
		wa_yidv02_cache-hardct[] = it_hardcoded[].
		APPEND wa_yidv02_cache TO lt_yidv02_cache.
	ENDIF.
	
ENDMETHOD.
{{< /highlight >}}

O método público GET_VALUE:


{{< highlight ABAP >}}
METHOD get_value .
* 0. local data
	DATA: it_yidv02_hardcoded TYPE TABLE OF yidv02_hardcoded,
	wa_yidv02 TYPE yidv02_hardcoded.

* 1. initialize structures
	REFRESH: it_yidv02_hardcoded.
	CLEAR: wa_yidv02.

* 2. Recover Hardcode
	CALL METHOD yidv02_cl_hardcoded=>fetch_data
		EXPORTING
			ricef = ricef
			fieldname = fieldname
			occurrence = occurrence
			counter = counter
			bypass_cache = c_bypass_cache_yes
		IMPORTING
			it_hardcoded = it_yidv02_hardcoded.

* 3. Get the first value
	IF sy-subrc = 0 AND NOT it_yidv02_hardcoded[] IS INITIAL.
		READ TABLE it_yidv02_hardcoded INTO wa_yidv02 INDEX 1.
		MOVE wa_yidv02-ue_low TO fieldvalue.
	ENDIF.

ENDMETHOD.
{{< /highlight >}}

O método público GET_RANGE:


{{< highlight ABAP >}}
METHOD get_range .
* 0. local structures
	DATA: it_yidv02_hardcoded TYPE TABLE OF yidv02_hardcoded,
	wa_yidv02_range TYPE rsdsselopt.

	FIELD-SYMBOLS: <yidv02_hardc> TYPE yidv02_hardcoded.

	REFRESH: it_yidv02_hardcoded, it_range.

* 1. Recover Hardcode
	CALL METHOD yidv02_cl_hardcoded=>fetch_data
		EXPORTING
			ricef = ricef
			fieldname = fieldname
			occurrence = occurrence
			counter = counter
	bypass_cache = c_bypass_cache_yes
	IMPORTING
	it_hardcoded = it_yidv02_hardcoded.

* 2. Fill the Range Table
	IF sy-subrc = 0.
		LOOP AT it_yidv02_hardcoded ASSIGNING <yidv02_hardc>.
			CLEAR wa_yidv02_range.
			wa_yidv02_range-sign = <yidv02_hardc>-ue_sign.
			wa_yidv02_range-option = <yidv02_hardc>-ue_option.
			wa_yidv02_range-low = <yidv02_hardc>-ue_low.
			wa_yidv02_range-high = <yidv02_hardc>-ue_high.
			APPEND wa_yidv02_range TO it_range.
		ENDLOOP.
	ENDIF.

ENDMETHOD.
{{< /highlight >}}

O método público CHECK_VALUE:


{{< highlight ABAP >}}
METHOD check_value .
* 0. local data
	DATA: it_yidv02range TYPE yidv02_t_range.

* 1. call method GET_RANGE
	CALL METHOD yidv02_cl_hardcoded=>get_range
		EXPORTING
			ricef = ricef
			fieldname = fieldname
			occurrence = occurrence
			counter = counter
		IMPORTING
			it_range = it_yidv02range.

* 1. check internal table contains any records
	IF it_yidv02range[] IS INITIAL AND ignore_not_defined IS INITIAL.
		RAISE not_defined.
	ENDIF.

* 2. check if value is in the internal table
	IF fieldvalue NOT IN it_yidv02range.
		RAISE not_found.
	ENDIF.

ENDMETHOD.
{{< /highlight >}}

Desenvolvido por Renato Oliveira e Nuno Godinho.

_Nota: RICEF é um acrónimo que significa Report, Interface, Conversion, Enhancement, Form.
_

Este mecanismo, quando bem utilizado, introduz uma forma eficaz e simples de permite fazer uma gestão unificada e controlada das constantes do sistema evitando a confusão que normalmente acontece.

Ainda assim, há muitas constantes que, pela sua natureza imutável, podem ficar codificadas directamente em ABAP. Coisas como por exemplo o código de uma transacção que sabemos não ir mudar. Há que ponderar cada situação para não ser mais papista que o Papa.

O Abapinho saúda-vos.
