---
title: 'O circunlóquio do VALUE CHECK'
slug: value-check
date: 2011-10-24 10:00:24
tags: [estilo]
categories: [dicas]
wordpressId: 1048
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Nunca te aconteceu esbarrares com uma coisa no ABAP que parece que é mas não é? A documentação diz que é, tudo indica que assim seja, e depois afinal não é.

Provavelmente já precisaste de, ao definir um parâmetro no ecrã de selecção de um relatório, limitar as possibilidades do que o utilizador pode introduzir aos valores disponíveis no tipo de dados desse parâmetro, certo? Para isto existe o _VALUE CHECK_. Parece simples. Por exemplo, presumia-se que isto funcionasse:


{{< highlight ABAP >}}
PARAMETERS: P_BUKRS LIKE T001-BUKRS OBLIGATORY VALUE CHECK.
{{< /highlight >}}

Vais a ver e não funciona.

O campo _T001-BUKRS_ é do tipo _BUKRS_ que é do domínio _BUKRS_ que por sua vez tem definida a tabela de valores _T001_ para a qual _BUKRS_ é a única chave primária. Mesmo assim, pateticamente, isto não funciona. Não funciona porque, por alguma razão lamentável, ao contrário do que faria sentido e se subentende na documentação, o _VALUE CHECK_ não tem em conta o domínio do campo que valida. Pelo contrário, para este funcionar é preciso que o campo referido tenha uma chave externa para a tabela de valores.

Portanto, no nosso caso, embora a tabela que contém a lista de valores possíveis do _BUKRS_ seja a _T001_ , para o _VALUE CHECK_ funcionar temos antes de fazer referência a uma outra tabela qualquer que tenha a _T001_ definida como chave externa. Como por exemplo, a _T001K_ :


{{< highlight ABAP >}}
PARAMETERS: P_BUKRS LIKE <strong>T001K</strong>-BUKRS OBLIGATORY VALUE CHECK.
{{< /highlight >}}

E assim já funciona.

Em resumo: conhecendo já tu a tabela com os valores possíveis, em vez de a poderes usar, tens de ir procurar outra que a defina como chave externa. É complicar o simples com rodeios. Um retórico chamar-lhe-ia circunlóquio. Eu chamo-lhe estupidez. Aposto que é um bug que a SAP decidiu orgulhosamente ignorar para sempre.

Obrigado Luís Rocha pela dica.

O Abapinho saúda-vos.
