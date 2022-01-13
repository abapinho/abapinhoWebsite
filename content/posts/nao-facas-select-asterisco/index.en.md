---
title: 'Thou shalt not SELECT *'
slug: nao-facas-select-asterisco
date: 2014-09-04 11:25:03
tags: [performance, sql]
categories: [boaspracticas]
wordpressId: 2731
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Always try to select only the fields you’ll need. Selecting others is a waste of resources.
Exception made for the use of FM *_SINGLE_READ because, even though these do select all fields, since they cache the data, they are still faster when used multiple times for the same key.
If you just want to check if a record exists, select just one field, if possible the one you’re using as criteria to avoid declaring an extra variable. Example: SELECT KUNNR INTO V_KUNNR FROM KNA1 WHERE KUNNR = V_KUNNR.
{{< ref "select-todos-os-campos" >}} (portuguese)
