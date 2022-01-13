---
title: 'Thou shalt not COMMIT in user-exits'
slug: nao-faras-commit-em-user-exits
date: 2014-09-29 09:00:25
tags: []
categories: [boaspracticas]
wordpressId: 2757
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Never do COMMITs inside user-exits. Also, make sure any external routine you call from there doesn't do any COMMIT either.
