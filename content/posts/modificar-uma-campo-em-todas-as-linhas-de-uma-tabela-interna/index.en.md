---
title: 'Modify one field in all lines of an internal table'
slug: modificar-uma-campo-em-todas-as-linhas-de-uma-tabela-interna
date: 2015-08-31 09:00:25
tags: [estilo]
categories: [dicas]
wordpressId: 3209
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
What I’m about to show you is not exactly new. It [has even been used][1] in Abapinho before. But since there is still a lot of people out there using LOOP to change a single field of an internal table, I thought it would be worth talking about it.

Say you have an internal table with one million and two hundred thousand entries and want to change the field ICON so that it has ‘@FM@‘ in all lines.

Instead of doing this:

{{< highlight ABAP >}}
LOOP AT lt_data ASSIGNING <data>.
  <data>-icon = '@FM@'.
ENDLOOP.
{{< /highlight >}}

Try doing this instead:

{{< highlight ABAP >}}
ls_data-icon = '@FM@‘.
MODIFY lt_data FROM ls_data TRANSPORTING icon WHERE icon <> ‘DONALD DUCK’.
{{< /highlight >}}

You can obviously replace the condition value with any other Disney character.

Thank you Sérgio Serra for suggesting that it could be interesting talking about this.
Thank you Andrew Becraft for the [photo][2].

Greetings from Abapinho.

   [1]: {{< ref "range-instantaneo" >}}
   [2]: https://www.flickr.com/photos/dunechaser/2936382027
