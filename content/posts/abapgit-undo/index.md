---
slug: undo-with-abapgit
title: Undo com abapGit
description: Usa o abapGit para desfazer as tuas alterações
date: 2023-03-06T09:00:00Z
tags: []
categories: [artigos]
keywords: [abapGit undo]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Sabias que podes finalmente fazer alterações radicais num desenvolvimento sem medos
porque há  uma forma simples de desfazer todas essas alterações?

<!--more-->

Até há pouco tempo não havia nenhuma forma decente de automatizar alterações em múltiplos objectos SAP. Todas as alterações tinham de ser feitas à mão ou de forma semi-automática, quanto muito recorrendo ao [SAPlink][1] que só suportava alguns tipos de objecto.

Como tal, se eu quisesse fazer uma experiência mais violenta no código que envolvesse modificar múltiplos objectos, pensava muito bem antes de a fazer pois, caso optasse por voltar para trás, teria de reverter tudo à mão. Era trabalhoso, desagradável e perigoso.

O [abapGit][2] veio mudar isso. Obrigado Lars Hvam! O [git][3] é um gestor de versões distribuído. E o abapGit é um projecto que tenta implementá-lo (dentro do possível) na realidade SAP.

O abapGit serve para muito mais do que o que vou ensinar aqui. Serve para gerir e distribuir versões de projectos, tanto internamente como na Internet. Mas lembrei-me de partilhar que também pode ser usado para esta tarefa específica: desfazer várias alterações num pacote.

Usei-o recentemente para isso mesmo porque estou a dar formação de ABAP e esta foi a melhor forma que encontrei para poder fazer e desfazer repetidamente uma série de alterações a um conjunto de objectos.

Para o conseguir pode recorrer-se a uma funcionalidade excelente do abapGit: repositórios _offline_. Funciona assim:

1. No abapGit crias um repositório _offline_ de um pacote que queiras alterar;
2. Exportas o pacote para um ficheiro ZIP no teu computador local. Este será o teu código original, aquele para o qual poderás querer regressar;
3. Fazes todas as alterações necessárias nos vários objectos desse pacote : cria, apaga e modifica objectos, sejam eles programas, objectos do DDIC ou outros;
4. Arrepende-te e deseja voltar para trás;
5. Volta ao abapGit, ao repositório que criaste. Importa o ZIP que guardaste anteriormente;
6. Agora o abapGit deverá salientar todos os objectos que foram alterados e poderás analisar as diferenças entre o que tens no sistema (_local_) e o que importaste do ficheiro ZIP (_remote_);
7. Faz _Pull_ e diz que sim a tudo. O abapGit vai reverter todas as alterações. Todos os objectos do pacote voltaram a estar exactamente como estavam no momento em que criaste o ZIP. O que entretanto criaste será apagado, o que modificaste será revertido e o que apagaste será recriado.

Nota: claro que o mesmo pode ser conseguido utilizando repositórios _online_ que são, aliás, a forma melhor de trabalhar com o abapGit. Mas para isso precisas de um servidor git que podes não ter à mão ou então podes estar impedido de usar por políticas de privacidade da empresa. E é aí que os repositórios _offline_ te podem ajudar.

O Abapinho saúda-vos.

[1]: <https://wiki.scn.sap.com/wiki/display/ABAP/SAPlink>
[2]: <https://abapgit.org/>
[3]: <https://git-scm.com/>
