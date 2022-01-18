---
title: 'Escrever dinheiro sem preocupações decimais'
slug: escrever-dinheiro-sem-preocupacoes-decimais
date: 2013-05-13 09:00:50
tags: [estilo]
categories: [dicas]
wordpressId: 2272
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Há quem leia a TCURX para descobrir o número de casas decimais de uma MOEDA quando precisa de escrever um campo endinheirado para uma variável ALFANUMERICA.

És assim? Não sejas.

<!--more-->

Claro que não podes pura e simplesmente assumir que todas as moedas têm duas casas decimais. Olha o caso do Japão, que não usa nenhuma. Ou o defunto Escudo que também não. Então, se és assim, como aqueles ali em cima, vais à TCURX ver se lá está a tua MOEDA. E se estiver guardas o número de casas decimais na variável CASAS_DECIMAIS. E se não estiver, assumes que são duas. E depois fazes:


{{< highlight ABAP >}}
WRITE dinheiro TO alfanumerica DECIMALS casa_decimais.
{{< /highlight >}}

E safas-te da coisa.

Mas é muito feio. E trabalhoso.

Faz antes assim:


{{< highlight ABAP >}}
WRITE dinheiro TO alfanumerica CURRENCY moeda.
{{< /highlight >}}

É mais bonito, mais limpinho, e sai sempre bem. Porque o SAP faz o trabalho por ti.

Obrigado Pierre Ameye pela dica.
