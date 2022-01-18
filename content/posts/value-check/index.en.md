---
title: 'The round-about routes of VALUE CHECK'
slug: value-check
date: 2011-10-24 10:00:24
tags: [estilo]
categories: [dicas]
wordpressId: 1048
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Have you ever come up against something in ABAP that seems to be one thing but is in fact another? The documentation says it is this and everything seems to indicate that it is, but after all it isn’t.

You've probably needed to, when setting a parameter in the report selection screen, check the possibilities of what the user can input to the available values in the data type of that parameter, right? _VALUE CHECK_ exists for this.
It seems simple. For example, it was assumed that the following might work:


{{< highlight ABAP >}}
PARAMETERS: P_BUKRS LIKE T001-BUKRS OBLIGATORY VALUE CHECK.
{{< /highlight >}}

When you check, it doesn’t work.

The _T001-BUKRS_ field is the _BUKRS_ type, which is of the _BUKRS_ domain which in turn has the _T001_ table of values defined, for which _BUKRS_ is the only primary key.
Even so this, lamentably, does not work. It does not work because, for some unfortunate reason, contrary to what would make sense and is understood from the documentation, _CHECK VALUE_ does not take into account the domain of the field it validates. For this to work, the referred field needs to have an external key for the table of values.

In our case, therefore, although the table containing the list of possible values of _BUKRS_ is _T001_ , for _VALUE CHECK_ to work we have to first refer to some other table that has _T001_ defined as the external key.
Such as _T001K_ , for example:


{{< highlight ABAP >}}
PARAMETERS: P_BUKRS LIKE <strong>T001K</strong>-BUKRS OBLIGATORY VALUE CHECK.
{{< /highlight >}}

Now it will work.

In summary: as you already know the table with possible values, instead of being able to use it you have to find another that defines it as the external key. This is complicating the simple with round-about routes. A rhetorician would call it circumlocution. I call it stupidity. I bet it’s a bug that SAP has proudly decided to ignore for ever.

Thank you Luís Rocha for the tip.

Greetings from Abapinho.
