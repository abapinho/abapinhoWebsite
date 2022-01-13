---
title: 'Complex parameters in remote functions'
slug: parametros-complexos-por-rfc
date: 2012-07-16 09:00:01
tags: [interfaces, segredo]
categories: [dicas]
wordpressId: 1836
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Remote function calls (by RFC) do not support parameters with complex structures (deep structures). In other words, if any of the parameters has a structure in which one of the fields is another structure or an internal table then, hard luck, it won’t work.

Do you give up? No, you don’t. Abapinho provides the solution: serialization.

<!--more-->

It works like this: transform the structure into an XSTRING, send this XSTRING by RFC and then do vice versa from that side.

Here’s an example. Imagine that one of the parameters has the SHLP_DESCR data structure. In SE11 you can confirm that this structure is anything but simple. Just use the command EXPORT a TO DATA BUFFER b:


{{< highlight ABAP >}}
DATA: shlp TYPE shlp_descr,
          shlp_serialized TYPE xstring.

* fill in the shlp here as necessary

EXPORT shlp TO DATA BUFFER shlp_serialized.

CALL FUNCTION 'ZF4_EXIT'
  DESTINATION 'LONGE'
  EXPORTING
    shlp_serialized     = shlp_serialized.
{{< /highlight >}}

Then do the opposite at function ZF4_EXIT:


{{< highlight ABAP >}}
FUNCTION zf4_exit.

  IMPORT shlp FROM DATA BUFFER shlp_serialized.
  
*  and that’s it, you have the shlp here again to do with it as you please 

ENDFUNCTION.
{{< /highlight >}}

Just pay attention to the bizarre fact that the name of a variable to serialize ("shlp" in this case) has to be absolutely identical on both sides.

Thanks to [myrtlewood54][1] for the photo, whoever you are.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/myrtlewoodfactoryoutlet/2547022024/
