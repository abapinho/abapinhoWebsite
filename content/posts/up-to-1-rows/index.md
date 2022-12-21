---
slug: up-to-1-rows
title: SELECT de registo único com chave incompleta
description: Qual a forma correcta de selecionar um único registo com a chave incompleta?
date: 2022-11-28T09:00:00Z
tags: [sql]
categories: [dicas]
keywords: [up to 1 rows]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Durante anos explicaram-me que se deve usar `UP TO 1 ROWS` quando a chave não é completa. A minha professora primária disse que devemos sempre perguntar porquê: porquê? Ninguém explica.

<!--more-->

Há uns dias fui tentar descobrir e encontrei uma explicação [neste post][1] do Horst Keller. Segundo o Horst este é o porquê: o `SELECT SINGLE` não permite usar `ORDER BY` que é importante visto que, por a chave estar incompleta, não se consegue determinar inequivocamente qual a linha a devolver. Por isso o `ORDER BY` é, diz ele, _altamente recomendado_.

Ok. Faz sentido e sempre fiz isso.

Mas, e quando sabemos que a ordem é totalmente indiferente? Provavelmente aí devemos à mesma usar o `UP TO 1 ROWS` em vez do `SELECT SINGLE` para não vir alguém a seguir dizer mal de nós.

Actualização: por coincidência, [andam a discutir este assunto][2] no Clean ABAP e há bastante discórdia.

O Abapinho saúda-vos.

[1]: <https://blogs.sap.com/2016/06/11/select-single-vs-select-up-to-1-rows/>
[2]: <https://github.com/SAP/styleguides/issues/179>
