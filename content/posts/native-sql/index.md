---
title: 'SQL nativo'
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
Por vezes o SQL do ABAP não te permite fazer coisas que conseguirias fazer usando SQL nativo da base de dados. É possível fazê-lo.


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

Mas atenção pois, ao contrário do SQL do ABAP que é genérico, este SQL terá de ser escrito especificamente para a base de dados existente. Por consequência o código fica menos flexível e mais complexo. Como tal, faz isto só mesmo se não tiveres alternativa.

Foto: [Photodesaster][1] via [VisualHunt.com][2] / [CC BY-NC][3]

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/photodesaster/14417565779/
   [2]: https://visualhunt.com
   [3]: http://creativecommons.org/licenses/by-nc/2.0/
