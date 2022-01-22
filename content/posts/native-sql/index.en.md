---
title: 'Native SQL'
slug: native-sql
date: 2016-03-28 09:00:01
tags: [sql]
categories: [dicas]
wordpressId: 3502
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['native sql']
---
Sometimes ABAP SQL doesn't allow you to do something you'd be able to do using the database's native SQL. It can still be done.


{{< highlight ABAP >}}
* Converte para maiúsculas e acrescenta wildcard
  TRANSLATE l_name1 TO UPPER CASE.
  CONCATENATE l_name1 '%' INTO l_name1.

* Executa SQL nativo para fazer
* uma pesquisa "case insensitive" pelo nome
  EXEC sql performing SAVE_ROW.
    SELECT kunnr
           INTO :l_kuune
           FROM kna1
           WHERE kna1.mandt        =    :sy-mandt
           AND   UPPER(kna1.name1) LIKE :l_name1
  ENDEXEC.
{{< /highlight >}}

But pay attention because, unlike the generic ABAP SQL, this SQL will have to be specifically written for the existing database. As a consequence, the code will be less flexible and more complex. So make sure you use this only if you really have no alternativa.

Photo: [Photodesaster][1] via [VisualHunt.com][2] / [CC BY-NC][3]

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/photodesaster/14417565779/
   [2]: https://visualhunt.com
   [3]: https://creativecommons.org/licenses/by-nc/2.0/
