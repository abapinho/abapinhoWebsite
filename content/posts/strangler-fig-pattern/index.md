---
slug: strangler-fig-pattern
title: Estrangula o código antigo e horrível
description: Aqui está uma técnica para ires substituíndo incrementalmente o código antigo por código novo
date: 2026-11-23T09:00:00Z
tags: []
categories: [artigos]
keywords: [strangler fig pattern]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quando ensino OOP e _Clean ABAP_, uma das preocupações mais frequentes é:

_Isto faz muito sentido, mas como é que o posso aplicar em código antigo com rotinas horríveis de milhares de linhas?_
<!--more-->
É verdade que, salvo raras excepções, é impensável reescrever reescrever aqueles milhares de linhas de forma a que sigam as boas prácticas actuais. Mas nem tudo está perdido.

A solução é usar a técnica da figueira-estranguladora ([Strangler Fig Pattern][1]): sempre que precisares de fazer uma alteração em alguma parte de uma rotina dessas faz o seguinte:

1. Identifica o excerto de código que está envolvido nessa alteração e que, por isso, terá de ser novamente testado (vê isso como uma oportunidade para o reescrever);
2. Extrai esse código para um método novo, idealmente numa classe à parte (usando uma existente ou criando uma nova caso não exista nenhuma adequada. Mas o importante é estar isolado num método);
3. Cria um parâmetro por cada variável (de entrada e de saída) envolvida nesse código, de forma a que o método se torne autónomo, não dependendo de nenhuma variável global, mantendo assim flexibilidade para, por exemplo, ser movido para outra classe. E também para ser mais fácil de testar;
4. Reescreve essa rotina, agora isolada e independente, para que fique actual e moderna e siga as boas prácticas actuais;
5. Agora a rotina gigante antiga, em vez deste bocado de código antigo, deverá ter apenas uma chamada ao novo método;
6. Testa e confirma que continua a funcionar como antes;
7. Finalmente, implementa as alterações que te levaram a mexer neste código;
8. Testa novamente, agora já com as novas alterações.

Cada necessidade de alteração desse código antigo é uma oportunidade para o estrangular mais um pouco, substituíndo parte do código antigo e difícil de gerir por pequenos módulos modernos, mais robustos e fáceis de manter.

Futuras modificações que aconteçam nas partes de código já modernizadas deverão ser mais fáceis e seguras de fazê-las.

Após algumas iterações, poderás chegar ao ponto em que boa parte desse código deixou já de ser ingerível e é agora um conjunto de chamas a pequenos módulos modernos. Nesse momento pode até revelar-se realista considerar o projecto de reescrever o código antigo que ainda sobra.

Acima de tudo, o importante é adoptar a disciplina de nunca deixar passar a oportunidade de isolar e modernizar as partes do código legado que têm de ser modificadas. A cada alteração deves sempre tentar que o código fique melhor do que estava antes.

Obrigado Peter Woodard pela [foto][2].

O Abapinho saúda-vos.

[1]: <https://en.wikipedia.org/wiki/Strangler_fig_pattern>
[2]: <https://commons.wikimedia.org/wiki/Special:Redirect/page/5920414>
