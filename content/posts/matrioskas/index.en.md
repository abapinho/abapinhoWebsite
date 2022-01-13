---
title: '<!--:pt-->A técnica das Matrioskas<!--:-->'
slug: matrioskas
date: 2009-10-09 13:00:55
tags: []
categories: [dicas]
wordpressId: 197
draft: false
---
É sabido que quando é necessário fazer uma pequena alteração a uma função standard para a qual não há nenhum tipo de user-exit, o mais normal é fazer uma cópia dela para uma função Z e lá proceder à alteração necessária.

No entanto, quando esta alteração pode ser feita no início ou no final do programa, há uma forma mais elegante de conseguir o mesmo resultado: a técnica das Matrioskas. Criar uma função Z com os mesmos parâmetros que lá dentro invoca a função _standard_ e que, além disso, antes ou depois de a invocar, tem o código para implementar a alteração necessária. Assim evita-se repetir o código que não muda. Menos lixo logo mais ecológico.

Nota 1: Embora nas funções esta solução seja óbvia, não só com elas se pode aplicar a técnica das Matrioskas: aplica-se também a programas, métodos, _includes_ , etc.

Nota 2: Claro que nas últimas versões esta dica é já de utilidade relativa graças ao último grito da moda, os _enhancements_. Mas mesmo assim pode fazer sentido puxar de uma Matrioska em vez de um _enhancement_ quando, por exemplo, se quer que o programa _standard_ continue a funcionar da forma original.

O Abapinho saúda-vos.
