---
slug: escape
title: Escape from hackers
date: 2022-03-28 09:00:00
tags: [estilo]
categories: [dicas]
keywords: [escape]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Data entered by the user is one of the main vulnerabilities of a programme.

<!--more-->

Never use that data as-is or it can easily turn against you in an [SQL injection][1] or some other form of exploit. Always make sure you escape it to make it safe.

SAP already has several function modules and classes to help out on this. Like class `CL_ABAP_DYN_PRG`. But it's probably more elegant to use string function [`escape`][2].

For example, this guarantees that an URL is safe to use:

```abap
data(unsafe_url) = 'http://abapinho.com/a b c'.
data(safe_url) = escape( val = unsafe_url format = cl_abap_format=>e_url ).
```

Try running programmes `DEMO_ESCAPE_*` to get an idea of what it can do. And also look at class `CL_ABAP_FORMAT` to get to know all possible formatting algorithms.

Thank you [Marcin Wichary][3] for the photo.

Greetings from Abapinho.

[1]: {{< ref "sql-injection" >}}
[2]: <https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenescape_functions.htm>
[3]: <https://www.flickr.com/people/8399025@N07>
