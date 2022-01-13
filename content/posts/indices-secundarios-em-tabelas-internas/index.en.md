---
title: 'Internal table secondary indexes'
slug: indices-secundarios-em-tabelas-internas
date: 2016-01-25 09:00:47
tags: [performance]
categories: [artigos]
wordpressId: 3323
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
This is how internal tables used to be declared:


{{< highlight ABAP >}}
DATA: itbl TYPE TABLE OF bkpf.{{< /highlight >}}
<!--more-->

And then you'd SELECT, SORT and always try to use BINARY SEARCH with READ TABLE. Since LOOP doesn't support BINARY SEARCH... using LOOP WHERE was not fast at all.

Back then all internal tables were called ITBL.

Then SAP started supporting what it calls "fully specified internal table" which are internal tables with properly declared key and a specific internal organization and index access mode:


{{< highlight ABAP >}}
DATA: t_bkpf TYPE SORTED TABLE OF bkpf WITH UNIQUE KEY bukrs belnr gjahr.
{{< /highlight >}}

These tables no longer need to SORT nor BINARY SEARCH because the index is automatically used to access the data. And LOOPS also benefit from it.

Thus far, nothing new (although for some strange reason I keep running into new code still using tables not fully specified. Fortunately it's been a while since I last saw one called ITBL).

But what you may not yet know is that internal tables now supports secondary indexes:


{{< highlight ABAP >}}
DATA: t_bkpf TYPE SORTED TABLE OF bkpf
             WITH UNIQUE KEY bukrs belnr gjahr
             WITH NON-UNIQUE SORTED KEY key_budat COMPONENTS budat.
{{< /highlight >}}

This solves those situations in which the same program has to access an internal table in more than one way.

And to showcase the virtues of secondary indexes I wrote a program comparing the old BINARY SEARCH with a brand new table with secondary indexes.

[You can find it here in GitHub][1].

And here are the results (database data load time is not included in the final score):

![Image][2]

It's not hard to decide which is the best approach, right?

Thanks redspotted for the [photo][3].

Greetings from Abapinho.

   [1]: https://github.com/abapinho/codesnippets/blob/master/zqc_secondary_indexes.abap
   [2]: images/Image.png
   [3]: https://www.flickr.com/photos/redspotted/2707111941
