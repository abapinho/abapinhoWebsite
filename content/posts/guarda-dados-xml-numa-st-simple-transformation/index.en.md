---
title: 'Save XML data in an ST (Simple Transformation)'
slug: guarda-dados-xml-numa-st-simple-transformation
date: 2019-04-01 09:00:59
tags: [segredo]
categories: [artigos]
wordpressId: 4182
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Some days ago I was using an ST (Simple Transformation) and thought that, even though its job is to convert an input into an output, it is can be used to store XML data.

Let's asy we have the following XML:

{{< highlight ABAP >}}
  <cocktails>
    <cocktail id=&quot;gt&quot; nome=&quot;Gin Tonic&quot;/>
    <cocktail id=&quot;ws&quot; nome=&quot;Whiskey Sour&quot;/>
    <cocktail id=&quot;cl&quot; nome=&quot;Campari Laranja&quot;/>
  </cocktails>
{{< /highlight >}}

<!--more-->

The way to store it in an ST is to wrap it like this:

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

And the ABAP code to read it to a string is quite simple:

{{< highlight ABAP >}}
DATA: xml_str TYPE string.
xml_str = |<x/>|.
CALL TRANSFORMATION zcocktail_data
  SOURCE XML xml_str
  RESULT XML xml_str.
{{< /highlight >}}

Note that the input string must be a valid XML even though it will be ignored.
And so, now we have our XML in a string.

To convert this XML into an internal table we just have to use another simple ST:

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

And call it using the following code:

{{< highlight ABAP >}}
DATA: t_cocktail TYPE zcocktail_t.
CALL TRANSFORMATION zcocktail_itbl
  SOURCE XML xml_str
  RESULT constants = t_cocktail.
{{< /highlight >}}

And that's it. An unorthodox but practical and somewhat simple way to store static data in SAP without using the database.

Greetings from Abapinho.
