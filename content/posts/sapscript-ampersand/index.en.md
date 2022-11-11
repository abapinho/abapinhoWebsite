---
slug: sapscript-ampersand
title: Use & in SAPSript texts
description: The trick to correctly show & in SAPScript
date: 2022-11-14T09:00:00Z
tags: [sapscript]
categories: [dicas]
keywords: [sapscript escape]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Let's say you want to show an url in a SAPScript layout. You place the url in a SAPSCript text and assume everything will work fine. Because most times everything does work fine. It's just that sometimes...

<!--more-->

## Disease

If you try to use this _url_:

```text
https://era.uma.vez?ums=mulher&com=cara&de=bolacha
```

This will be printed:

```text
https://era.uma.vez?ums=mulherde=bolacha
```

Strange, right?

## Diagnostic

It's not immediately obvious but the problem is that SAPScript variables are limited by &:

```text
My name is &SY-UNAME&.
```

So, SAPScript looks at that url and sees variable `&com=cara&`, replacing it by its content. But since this is not really a variable, its content is empty. As a result both &s and whatever is between them mysteriously disappear.

## Treatment

The solution is to let SAPScript know that those & are really &. E for that you need to escape them:

```text
<(>&<)>
```

Why did they come up with such a far fetched escape sequence? Because it's SAP. Anyway, just note it down and move on.

So, in order for the url to be correctly printed, this is what you must put in the SAPScript text:

```text
https://era.uma.vez?ums=mulher<(>&<)>com=cara<(>&<)>de=bolacha
```

Problema solved.

Greetings from Abapinho.
