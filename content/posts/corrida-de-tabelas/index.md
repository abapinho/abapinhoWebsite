---
title: 'Partida... lagarta... fugida!'
slug: corrida-de-tabelas
date: 2011-05-24 09:00:41
tags: [performance]
categories: [artigos]
wordpressId: 759
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Senhoras e senhores, meninos e meninas, a corrida está prestes a começar.

**Introdução**

Apresento-vos as 4 participantes. São 4 tabelas internas, de diferentes raças e credos, que se vão pelejar pelo título atlético do LOOP em velocidade. Aqui estão elas:

Concorrente 1: DATA: LT_ITEM TYPE TABLE
Concorrente 2: DATA: LT_ITEM_HASHED TYPE HASHED TABLE
Concorrente 3: DATA: LT_ITEM_SORTED TYPE SORTED TABLE
Concorrente 4: DATA: LT_ITEM TYPE TABLE + INTO INDEX

<!--more-->

A pista de corridas é um programa ABAP cuja primeira parte, comum aos 4, aqui vos deixo:


{{< highlight ABAP >}}

REPORT  YYYTEST_ABAPINHO.

TYPES:  BEGIN OF TY_BKPF,
          BUKRS   TYPE BUKRS,
          BELNR   TYPE BELNR_D,
          GJAHR   TYPE GJAHR,
        END OF TY_BKPF.

TYPES:  BEGIN OF TY_BSEG,
          BUKRS   TYPE BUKRS,
          BELNR   TYPE BELNR_D,
          GJAHR   TYPE GJAHR,
          BUZEI   TYPE BUZEI,
        END OF TY_BSEG.

  DATA: LT_HEADER TYPE TABLE OF TY_BKPF.
  DATA: LS_HEADER TYPE TY_BKPF.
  DATA: LS_ITEM TYPE TY_BSEG.
  DATA: LV_COUNTER  TYPE I.

START-OF-SELECTION.

  SELECT BUKRS BELNR GJAHR
    FROM BKPF
    INTO TABLE LT_HEADER
    UP TO 25000 ROWS.
  CHECK LT_HEADER IS NOT INITIAL.

  (a partir daqui vem a parte específica de cada um dos concorrentes)
{{< /highlight >}}

Como vêem, nada de mais. Começa por declarar uns tipos, umas variáveis auxiliares, depois selecciona 25 mil linhas da BKPF para a tabela de cabeçalhos LT_HEADER que é também partilhada pelas 4 concorrentes.

Atenção a todos! Se quiserem fazer apostas, é agora o momento. Porque a prova está prestes a começar.

Aos vossos lugares...
Partida...
Lagarta...
Fugida!

**Concorrente número 1**

A primeira concorrente é a banal tabela interna de sempre, usada e abusada, como veio de fábrica em meados do século XX. Aqui fica:


{{< highlight ABAP >}}

  DATA: LT_ITEM TYPE TABLE OF TY_BSEG.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
    INTO TABLE LT_ITEM
     FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.
    LOOP AT LT_ITEM INTO LS_ITEM
      WHERE BUKRS = LS_HEADER-BUKRS
      AND   BELNR = LS_HEADER-BELNR
      AND   GJAHR = LS_HEADER-GJAHR.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.
  ENDLOOP.
{{< /highlight >}}

Mais convencional é impossível. E os resultados também não são muito animadores. A ver se à luz disto os nossos leitores começam a pensar duas vezes antes de a usar em tudo o que mexe:

![image][1]

**Concorrente número 2**

É a vez da concorrente número 2, pintura metalizada, jantes de liga leve e equipado com uma HASH de rendimento que lhe dá um roncar de Ferrari. Ei-la:


{{< highlight ABAP >}}

  DATA: LT_ITEM_HASHED  TYPE HASHED TABLE OF TY_BSEG
                        WITH UNIQUE KEY BUKRS BELNR GJAHR BUZEI.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
    INTO TABLE LT_ITEM_HASHED
    FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.
    LOOP AT LT_ITEM_HASHED INTO LS_ITEM
      WHERE BUKRS = LS_HEADER-BUKRS
      AND   BELNR = LS_HEADER-BELNR
      AND   GJAHR = LS_HEADER-GJAHR.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.
  ENDLOOP.
{{< /highlight >}}

Esta concorrente tem uma chave única definida com 4 campos. Embora as HASH TABLEs sejam o supra-sumo da barbatana quando invocadas com a chave completa, aqui, por se tratar de um LOOP, tal não é naturalmente possível. Por isso, ela arrasta-se vergonhosamente até à meta. Uma vergonha como podem comprovar pelos resultados seguintes:

![image][2]

**Concorrente número 3**

Segue-se a concorrente número 3, uma bela tabela que já vem ordenada para maior rendimento aerodinâmico. Rápida e silenciosa como se quer. Aqui está:


{{< highlight ABAP >}}

  DATA: LT_ITEM_SORTED  TYPE SORTED TABLE OF TY_BSEG
                        WITH UNIQUE KEY BUKRS BELNR GJAHR BUZEI.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
     INTO TABLE LT_ITEM_SORTED
    FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.
    LOOP AT LT_ITEM_SORTED INTO LS_ITEM
      WHERE BUKRS = LS_HEADER-BUKRS
      AND   BELNR = LS_HEADER-BELNR
      AND   GJAHR = LS_HEADER-GJAHR.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.
  ENDLOOP.
{{< /highlight >}}

Incrível, Senhoras e senhores! A concorrente número 3 foi muito rápida. Cerca de 2000x mais rápida a fazer os LOOPs do que as duas concorrentes anteriores! Eis sua pontuação:

![image][3]

**Concorrente número 4**

Por último mas não em último, apresento-vos a concorrente número 4. A mais maluca e rebuscada delas todas. É uma espécie de modelo antigo recauchutado, como fazem àqueles Renault 5 Turbo do tempo da avozinha, que parecem uma porcaria pegada e depois voam baixinho:


{{< highlight ABAP >}}

  DATA: LT_ITEM TYPE TABLE OF TY_BSEG.
  DATA: LV_INDEX    TYPE SYTABIX.

  SELECT BUKRS BELNR GJAHR BUZEI
    FROM BSEG
    INTO TABLE LT_ITEM
    FOR ALL ENTRIES IN LT_HEADER
    WHERE BUKRS = LT_HEADER-BUKRS
    AND   BELNR = LT_HEADER-BELNR
    AND   GJAHR = LT_HEADER-GJAHR.
  SORT LT_ITEM BY BUKRS BELNR GJAHR.

  LOOP AT LT_HEADER INTO LS_HEADER.

    READ TABLE LT_ITEM
      TRANSPORTING NO FIELDS
      BINARY SEARCH
      WITH KEY  BUKRS = LS_HEADER-BUKRS
                BELNR = LS_HEADER-BELNR
                GJAHR = LS_HEADER-GJAHR.
    CHECK SY-SUBRC = 0.
    LV_INDEX = SY-TABIX.

    LOOP AT LT_ITEM INTO LS_ITEM FROM LV_INDEX.
      IF  LS_ITEM-BUKRS <> LS_HEADER-BUKRS OR
          LS_ITEM-BELNR <> LS_HEADER-BELNR OR
          LS_ITEM-GJAHR <> LS_HEADER-GJAHR.
        EXIT.
      ENDIF.
      ADD 1 TO LV_COUNTER.
    ENDLOOP.

  ENDLOOP.
{{< /highlight >}}

Que resultado impressionante também. Trata-se de uma tabela convencional mas que, graças a umas manobras curiosas, ganha enorme velocidade. No fundo ela faz uns truques para fingir que é mais do que realmente é. Começa por fazer um SORT. Depois, em vez de fazer o segundo LOOP logo de seguida, primeiro faz um READ TABLE BINARY SEARCH e depois faz um LOOP FROM INDEX ([um truque de magia já aqui discutido][4]). E os resultados não poderiam ser mais impressionantes pois, embora seja uma tabela da plebe, comporta-se como se sangue azul tivesse:

![image][5]

**O Vencedor**

E a grande vencedora, senhoras e senhores, é a concorrente número 3, a SORTED TABLE. Logo a seguir, a concorrente número 4, com o seu LOOP FROM INDEX. Como podem comprovar, a diferença entre a SORTED TABLE e esta última das artimanhas é muito pequena. Claro que, podendo escolher, será sempre preferível recorrer a uma SORTED TABLE. Mas caso se esteja a mexer em código existente que tenha já uma tabela das banais e que não possa ser alterada, a concorrente 4 é uma muito boa solução de compromisso. As duas outras tiveram resultados tão maus que mais vale nem falar mais delas.

É interessante comparar os gráficos e observar que o tempo despendido na base de dados é praticamente idêntico nos 4 casos apresentados. As grandes diferenças são ao nível do processamento ABAP.

E assim chega ao fim a corrida de hoje. Felizmente não houve acidentes. Espero que tenha sido tão emocionante para si como foi para nós. Até uma próxima corrida.

(Obrigado Bruno Filipa!)

O Abapinho saúda-vos.

   [1]: images/corrida_concorrente1_normal.png (corrida_concorrente1_normal)
   [2]: images/corrida_concorrente3_hash.png (corrida_concorrente3_hash)
   [3]: images/corrida_concorrente2_sorted.png (corrida_concorrente2_sorted)
   [4]: {{< ref "loop-from-index" >}}
   [5]: images/corrida_concorrente4_loopintoindex.png (corrida_concorrente4_loopintoindex)
