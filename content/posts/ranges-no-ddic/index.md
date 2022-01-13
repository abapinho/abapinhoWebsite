---
title: 'Criar RANGEs no DDIC sem ficar com os dentes a ranger'
slug: ranges-no-ddic
date: 2013-03-04 18:26:40
tags: [ddic, estilo]
categories: [dicas]
wordpressId: 2164
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Cada vez uso mais RANGEs. Uso-os ao pequeno-almoço, ao almoço, ao jantar e fora das refeições. É como o molho de soja. Umas colheradas daquilo e fica logo tudo mais saboroso.

<!--more-->

Mas a declaração dos tipos sempre me deu algum trabalho. Por exemplo, se eu quiser usar um range de um campo ZABC, preciso de uma estrutura ZS_RANGE_ABC (com os campos OPTION, SIGN, LOW, HIGH) e depois preciso de uma categoria de tabela (table type) ZT_RANGE_ABC que tenha ZS_ABC como "categoria de linha". E fazer isto tudo à mão é chato.

Mas recentemente fiquei a saber que o DDIC tem uma funcionalidade que simplifica este processo. Esta simplificação consiste na manutenção automática da "categoria de linha". Funciona assim:

  1. Partamos do princípio de que tens o elemento de dados ZABC;

  2. Na SE11, em "Categoria de dados" introduz o nome do tipo de dados do RANGE: ZT_RANGE_ABC;

  3. Carrega em F5 para o criar e escolhe a opção "Categoria de tabela";

  4. Dá-lhe uma descrição senão, não consegues avançar;

  5. (agora é que vem o truque!!)

  6. No menu "Processar" escolhe a opção "Definir como categoria de table range";

  7. (pimbas! o ecrã mudou!)

  8. Mete ZABC como "elemento de dados";

  9. Mete ZS_RANGE_ABC como "tipo linha estruturado" (não carregues em "criar" ainda);

  10. Grava;

  11. Já gravaste? Então agora carrega em "criar";

  12. (o DDIC cria automaticamente uma estrutura já com o SIGN, OPTION, LOW e HIGH!)

  13. Grava e activa a estrutura como farias com qualquer outra estrutura e volta para trás;

  14. Activas a categoria de tabela e pronto: agora tens uma categoria de tabela ZT_RANGE_ABC que é um RANGE do tipo ZABC.

Muito aprazível, não dirias?

Obrigado José Faria por me mostrares esta funcionalidade tão conveniente.

O Abapinho saúda-vos.
