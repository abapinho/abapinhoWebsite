---
title: 'Altera programas standard sem precisar de chave'
slug: editar-objectos-standard
date: 2018-02-12 09:00:22
tags: [segredo, standard]
categories: [dicas]
wordpressId: 3942
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'editar objectos standard'
description: 'Aprende como podes editar um objecto standard sem teres de pedir a chave de acesso. Ainda por cima é fácil de fazer. Espero que nunca apliques o que aqui vais aprender.'
---
Estamos perante mais um daquelas dilemas: esconder porque é perigoso e alguém pode fazer o mal usando esta informação ou ensinar porque não o fazer é paternalista porque presume que os leitores não são responsáveis. O regimes de ditadura costumam optar pela primeira: queimam livros e censuram. O Abapinho gosta de acreditar que os seus leitores são pessoas responsáveis que merecem ter acesso ao conhecimento.

E, por isso, aqui está. Não, não é um manual de como criar urânio enriquecido nem uma fórmula para nitroglicerina caseira. Mas anda perto: é um truque para conseguir alterar objectos standard sem precisar de chave.

<!--more-->

Reza assim:

  1. Vai à SHDB e cria uma nova gravação

  2. Escolhe a transacção do objecto que queres editar: SE38, SE24, SE37, SE11, etc.

  3. Liga a opção "Simular modo background"

  4. Iniciar registo

  5. Introduz o objecto que queres alterar

  6. Entra em modo de edição

É isto. Agora podes rebentar com a tabela KNA1, com a função T001_SINGLE_READ ou com seja qual for o programa standard que te estiver a incomodar.

Sentes-te mais poderoso, não sentes? Imagino que sim. Recorda-te só que, com mais poder vem sempre mais responsabilidade. Se dás cabo do teu sistema alguém poderá dar cabo de ti.

Obrigado MJ pela dica.

O Abapinho saúda-vos.
