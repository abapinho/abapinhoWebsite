---
title: 'Pacotes 2.0'
slug: pacotes-2-0
date: 2014-07-21 09:00:12
tags: [estilo, oo]
categories: [artigos]
wordpressId: 2853
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
O repositório do R/3 é uma coisa maravilhosa. Um vasto armazém de elementos de dados, estruturas, tabelas e muito mais, prontamente disponíveis a todos. Como programadores, é fácil e conveniente escolher estes objectos e puxa-los para os nossos programas à medida das necessidades sem que a preciosa linha de pensamento seja interrompida.
Mas nem tudo é sol e flores. Se não tiveres cuidado com os cogumelos que apanhas podes dar por ti com um envenenado entre mãos.

<!--more-->

Imagina o cenário em que encontras o elemento de dados perfeito para um cliente. Contente, apressas-te a adiciona-lo à tua declaração de variáveis e não pensas mais no assunto. A única coisa que te escapou é que este pequeno elemento de dados pertence a uma aplicação de um dos teus colegas e, conceptualmente, nunca deveria ser referenciado na tua aplicação, porque são duas aplicações completamente independentes e sem qualquer relação. Mas agora partilham um laço envenenado: tornaram-se interdependentes.

O esparguete aplicacional é um cenário comum que assombra as equipas técnicas de SAP e, por vezes, evolui para situações de interdependência complicadas. Por exemplo:

  * Se o teu colega decide alterar o seu elemento de dados; a tua aplicação vai sofrer os impactos desta alteração;

  * Se precisares de instalar a tua aplicação noutro sistema terás de incluir este elemento de dados alienígena bem como a definição do pacote onde este se insere;

  * Se estiveres a trabalhar num ambiente de equipa vais ter de garantir que o teu colega já transportou todos os objectos que precisas antes de poder avançar com a tua solução em segurança.

Este tipo de problemas pode ser facilmente evitado através da utilização do _SAP Package Concept_ que passa por um desenho de Pacotes cuidado e da utilização da ferramenta de _Package Check_ em todos os teus desenvolvimentos.

O _SAP Package Concept_ é ainda pouco utilizado. Talvez não saibas mas hoje em dia a natureza dos pacotes SAP vai muito além do mero repositório de objectos (antes chamavam-se de classe de desenvolvimento). Usando uma combinação de _Structure Packages_ , _Main Packages_ e _Development Packages_ interconectados por _Package Interfaces_ e _Use Accesses_ , podes salvaguardar as tuas aplicações de usos e referências indesejadas, ao mesmo tempo que tornas explícitas as dependências entre pacotes.

Algumas dicas prácticas para começar:

  1. Sê independente. Tenta sempre ver a tua aplicação como uma componente de software isolada e encapsula-a em conformidade através de hierarquias de pacotes;

  2. Cuidado com as dependências. Prefere criar um novo objecto a usar um objecto de uma aplicação que em nada deve estar relacionada com a tua. Determina e supervisiona as tuas dependências indispensáveis através de use accesses a outras aplicações;

  3. Cria pontos de acesso. Através das interfaces de Pacotes, cria API’s para as tuas próprias aplicações. Garante que só cedes visibilidade pública a objectos estáveis e que acreditas poderem trazer valor a outros;

  4. Activa os Package Checks. Se não o fizeste ainda, vai em frente e faz. Os Package Checks estão integrados com o ATC e podem rapidamente dar-te uma visão sobre os teus problemas de dependência. Atenção que esta é uma definição global de sistema. Garante que entendes as consequências de o fazer e que todos os membros da equipa estão ocorrentes desta mudança para que não se assustem muito quando as mensagens de violação de pacotes começarem a aparecer;

  5. Explora. Cria uma hierarquia de pacotes de teste, adiciona alguns objectos e define algumas interfaces de pacote. Implementa um programa de teste e brinca com as opções de visibilidade objectos.

E agora umas referências douradas para te ajudarem a começar:

  * [SAP Help Package Builder][1] – Um guia detalhado para te ajudar a configurar um ambiente consciente de dependências entre pacotes;

  * [ABAP Package Concept][2] – Blog com uma visão detalhada sobre o conceito de pacotes directamente de um dos Gurus da SAP.

O Abapinho agradece a Miguel Jorge por ter escrito este artigo.

Agradece também a HatM pela [foto][3].

E saúda-vos.

   [1]: http://help.sap.com/saphelp_erp60_sp/helpdata/en/af/40bd38652c8c42e10000009b38f8cf/content.htm?frameset=/en/09/6eb8c3f98011d3964300a0c94260a5/frameset.htm¤t_toc=/en/d1/802cfc454211d189710000e8322d00/plain.htm&node_id=606&show_children=false
   [2]: http://scn.sap.com/blogs/ttrapp/2011/12/04/abap-package-concept-part-1-the-basics
   [3]: https://www.flickr.com/photos/hatm/3448832284/in/photostream/?rb=1
