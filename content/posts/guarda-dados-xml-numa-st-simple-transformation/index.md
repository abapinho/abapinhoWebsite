---
title: 'Guarda dados XML numa ST (Simple Transformation)'
slug: guarda-dados-xml-numa-st-simple-transformation
date: 2019-04-01 09:00:59
tags: [segredo]
categories: [artigos]
wordpressId: 4182
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'xml simple transformation'
description: 'Como guardar dados XML numa Simple Transformation. Uma alternativa interessante para guardar dados estáticos que não recorre à base de dados.'
---
No outro dia estava a aprender sobre ST (Simple Transformations) e lembrei-me que, ainda que tenha sido desenvolvida para transformar dados, é uma forma práctica de guardar dados XML.

Temos o seguinte XML:

{{< highlight ABAP >}}
  <cocktails>
    <cocktail id=&quot;gt&quot; nome=&quot;Gin Tonic&quot;/>
    <cocktail id=&quot;ws&quot; nome=&quot;Whiskey Sour&quot;/>
    <cocktail id=&quot;cl&quot; nome=&quot;Campari Laranja&quot;/>
  </cocktails>{{< /highlight >}}

<!--more-->

A forma de o guardar numa ST é envolvê-la da seguinte forma:

{{< highlight ABAP >}}
<xsl:transform version=&quot;1.0&quot;
  xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;
  xmlns:sap=&quot;http://www.sap.com/sapxsl&quot;>
  <xsl:strip-space elements=&quot;*&quot;/>
  <xsl:template match=&quot;/&quot;>
    <cocktails>
      <cocktail id=&quot;gt&quot; name=&quot;Gin Tónico&quot;/>
      <cocktail id=&quot;ws&quot; name=&quot;Whiskey Sour&quot;/>
      <cocktail id=&quot;cl&quot; name=&quot;Campari Laranja&quot;/>
    </cocktails>
  </xsl:template>
</xsl:transform>
{{< /highlight >}}

E depois lê-la para uma STRING assim:

{{< highlight ABAP >}}
DATA: xml_str TYPE string.
xml_str = |<x/>|.
CALL TRANSFORMATION zcocktail_data
  SOURCE XML xml_str
  RESULT XML xml_str.
{{< /highlight >}}

E agora temos o XML numa variável do tipo STRING.
Nota: é apenas importante que o XML_STR de entrada seja um XML válido ainda que vá ser ignorado.

Se quisermos converter o XML numa tabela interna basta usar outra ST simples:

{{< highlight ABAP >}}
<?sap.transform simple?>
<tt:transform
  xmlns:tt=&quot;http://www.sap.com/transformation-templates&quot;
  xmlns:ddic=&quot;http://www.sap.com/abapxml/types/dictionary&quot;
  xmlns:def=&quot;http://www.sap.com/abapxml/types/defined&quot;>
  <tt:root name=&quot;T_COCKTAIL&quot; type=&quot;ddic:ZCOCKTAIL_T&quot;/>
  <tt:template>
    <cocktails>
      <tt:loop ref=&quot;.T_COCKTAIL&quot;>
        <cocktail>
          <tt:attribute name=&quot;id&quot; value-ref=&quot;ID&quot;/>
          <tt:attribute name=&quot;name&quot; value-ref=&quot;NAME&quot;/>
        </cocktail>
      </tt:loop>
    </cocktails>
  </tt:template>
</tt:transform>
{{< /highlight >}}

E depois chamar o seguinte comando para converter o XML na tabela intena:

{{< highlight ABAP >}}
DATA: t_cocktail TYPE zcocktail_t.
CALL TRANSFORMATION zcocktail_itbl
  SOURCE XML xml_str
  RESULT constants = t_cocktail.
{{< /highlight >}}

E aqui está uma forma pouco ortodoxa mas práctica e simples de guardar dados sem ter de recorrer à base de dados.

O Abapinho saúda-vos.
