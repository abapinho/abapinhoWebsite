---
title: 'Parâmetros complexos em funções remotas'
slug: parametros-complexos-por-rfc
date: 2012-07-16 09:00:01
tags: [interfaces, segredo]
categories: [dicas]
wordpressId: 1836
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
As chamadas a funções remotas (por RFC) não suportam parâmetros com estruturas complexas ( _deep structures_ ). Por outras palavras, se algum dos parâmetros tiver uma estrutura em que um dos seus campos seja outra estrutura ou uma tabela interna, azar, não dá.

Desistes? Não desistas. O Abapinho dá-te a solução: serialização.

<!--more-->

Funciona assim: serializas a estrutura transformando-a numa XSTRING, envias a XSTRING por RFC e do lado de lá, vice-versa.

Vamos a um exemplo. Imagina que um dos parâmetros tem a estrutura de dados SHLP_DESCR. Na SE11 podes confirmar que esta estrutura é tudo menos simples. É só usar o comando EXPORT a TO DATA BUFFER b:


{{< highlight ABAP >}}
DATA: shlp TYPE shlp_descr,
          shlp_serialized TYPE xstring.

* aqui preenches o shlp conforme te for necessário

EXPORT shlp TO DATA BUFFER shlp_serialized.

CALL FUNCTION 'ZF4_EXIT'
  DESTINATION 'LONGE'
  EXPORTING
    shlp_serialized     = shlp_serialized.
{{< /highlight >}}

E depois, na função ZF4_EXIT fazes o contrário:


{{< highlight ABAP >}}
FUNCTION zf4_exit.

  IMPORT shlp FROM DATA BUFFER shlp_serialized.

*  e pronto, aqui tens o shlp outra vez para fazeres com ele o que te der na telha

ENDFUNCTION.
{{< /highlight >}}

Presta só atenção ao facto bizarro de o nome da variável a serializar (neste caso "shlp") ter de ser absolutamente igual dos dois lados.

Obrigado a [myrtlewood54][1] pela foto, sejas lá tu quem fores.

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/myrtlewoodfactoryoutlet/2547022024/
