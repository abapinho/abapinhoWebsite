---
title: 'INNER JOIN vs FOR ALL ENTRIES vs artificial RANGES'
slug: inner-join-vs-for-all-entries-vs-ranges-artificiais
date: 2014-11-25 09:00:13
tags: [performance, sql]
categories: [boaspracticas]
wordpressId: 2749
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Since data operations are much more optimized in the database server than in ABAP, it is always better to use the first as much as possible. FOR ALL ENTRIES should only be used when INNER JOIN doesn’t give us what we need or is not possible (like with BSEG for example). Artificial ranges are also a possible alternative to FOR ALL ENTRIES but be careful not to reach the SQL parser limit. It depends on the database server but as a rule of thumb avoid ranges with more than 1000 lines.
When using FOR ALL ENTRIES always make sure the internal table is not empty or else all lines of the database table will be fetched.
