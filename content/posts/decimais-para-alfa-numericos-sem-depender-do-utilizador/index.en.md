---
title: 'Decimal to alphanumeric without depending on the user'
slug: decimais-para-alfa-numericos-sem-depender-do-utilizador
date: 2013-04-08 09:00:46
tags: [estilo, i18n]
categories: [dicas]
wordpressId: 2221
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When reading a file with numeric values to an internal table or vice versa, the success of the conversion depends on whether the user has defined the dot or comma as the decimal separator. It is customary to then go and read the user setting and then adjust the values from the file with a dot or a comma as required.

But this is unfortunate and rather inelegant. There should be a way of not making this depend on the user.

And there is.

<!--more-->

This is how:


{{< highlight ABAP >}}
* Let us force the USA default format
SET COUNTRY 'US'.

* Now we do what we have to do
WRITE wrbtr TO value CURRENCY 'USD'.

* And at the end we set it to the defined format for the current user
SET COUNTRY space.
{{< /highlight >}}

Much simpler than having to read the user setting, don't you think?

Thanks Pierre Ameye for the tip.

And thanks to Alexis Tejeda for the [photo][1].

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/alexonrails/4759137435/
