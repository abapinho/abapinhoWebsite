---
slug: atc-baseline
title: Set a baseline for your ATC
description: Set a baseline for your ATC
date: 2025-10-20T09:00:00+01:00
tags: [atc]
categories: [artigos]
keywords: [ATC baseline]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Did you know that you can set a starting point for ATC and, thanks to that, be able to run ATC in legacy code?

<!--more-->

For years, I have been advocating that ABAP Test Cockpit should always be run on all developed code. This is easy to do with new code. But what about changes made to old, inherited code with thousands of lines full of errors?

In this case, you can use an ATC feature called [Baseline][1]. This feature allows you to add results from an ‘ATC run’ to the baseline so that, in future ATC runs, these results will be ignored, considered excluded, or set to low priority, as desired.

Run ATC on your legacy code and then add its billions of problems to the ATC Baseline. Once that is done, you can run ATC at will on legacy code and it will only report new problems that do not already exist in the baseline you have defined.

Greetings from Abapinho.

[1]: <https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_752/ba879a6e2ea04d9bb94c7ccd7cdac446/21f52fff7cef458b88e49c6087895162.html>
