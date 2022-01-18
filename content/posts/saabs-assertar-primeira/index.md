---
title: 'SAABs ASSERTar à primeira?'
slug: saabs-assertar-primeira
date: 2016-03-07 09:00:13
tags: [debug]
categories: [artigos]
wordpressId: 3454
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'checkpoint groups'
---
_Checkpoints_ é uma _framework_ muito poderosa do ABAP que no entanto quase ninguém a usa. Porquê? Provavelmente pela mesma razão que quase ninguém ouve [Sun Ra][1] e que quase ninguém sabe que o [Frank Zappa][2] tem 102 álbuns. Porque embora seja bom, é obscuro e pouco comercial. Os _checkpoints_ são, de facto bons e pouco comerciais. Mas deviam ser mais como o Mozart, que é bom e comercial.

<!--more-->

Um bom programador, ao programar, antecipa os potenciais problemas do seu código. E, por antecipá-los, pode melhorar o seu código de duas formas: desenhá-lo por forma a evitar esses problemas ou, caso não sejam evitáveis, incorporar no próprio programa formas de ajudar a detectar e analisar os problemas, caso ocorram.

E é exactamente para isso que os Checkpoints foram criados. Para ajudar a detectar e analisar problemas.

Há 3 tipos de _checkpoints_ : BREAK-POINT, LOG-POINT e ASSERT. E estão sempre sempre sempre associados a um _checkpoint group_ , que é o objecto SAP que permite dar-lhes uso.

  * O BREAK-POINT permite fixar pontos onde se pode fazer, adivinha lá... exacto: break-points;

  * O LOG-POINT permite registar valores em sítios específicos do código;

  * O ASSERT é uma espécie de mistura dos outros dois com mais uns poderes porque podes configurar o seu comportamentoe e ainda associar-lhe uma condição.

Os _checkpoint groups_ e seus 3 amiguinhos são geridos através da transacção SAAB.

Esta _framework_

(constituida pelos checkpoint groups, e pelos 3 tipos de checkpoints) serve para complementar os nossos programas com código auxiliar para depuração. Ou seja, não deverá servir nenhum propósito funcional no programa, não tem nada a ver com logs nem mensagens de erro **nem substitui as excepções**. Antes, serve apenas para depuração. E é nisso que reside a sua maior virtude: está lá, sentada no programa, adormecida, sem gastar recursos, até ao dia em que alguém decida activá-la para fazer uma qualquer análise do programa.

E para que é que eu preciso disto?, dizes tu.

Vou dar-te 3 cenários em que isto pode ser útil:

## Cenário 1 - Analisar um bug esquivo

Há uma situação rara num programa chamado ZAPPA em que, numa determinada conta de dividir, o divisor é 0. Mas isto só acontece em produtivo. E tu não percebes porquê. E gostavas de perceber. Mas é tão rara que fazer _debug_ à mão seria muito difícil. Então vais à SAAB criar um _checkpoint group_ chamado ZAPPA e depois, mesmo antes da conta de dividir inseres um ASSERT:

{{< highlight ABAP >}}
ASSERT ID zappa
  FIELDS kna1 divisor aux1
  CONDITION divisor eq 0.
{{< /highlight >}}
Além disso noutros sítios chave do programa crias alguns break-points:

{{< highlight ABAP >}}
BREAK-POINT ID zappa 'ponto 1'.

(...)

BREAK-POINT ID zappa 'ponto 2'.
{{< /highlight >}}
O comando acima define um ASSERT do _checkpoint group_ ZAPPA que guardará as variáveis KNA1 (sim, dá para guardar estruturas), DIVISOR e AUX1 mas que só o fará se a condição DIVISOR=0 for verdadeira. Presumamos que estes campos que estás a guardar serão suficientes para te ajudar a descobrir o que está a causar o problema.

E mandas isto para produtivo. Confirmando previamente na SAAB que o ZAPPA tem todas as opções inactivas. Depois vais à SAAB e crias uma "activação" para o utilizador que corre o programa configurando o ASSERT para fazer apenas _log_ , definindo até quando queres que dure a activação (um dia? uma semana?). E vais à vidinha. Como só fará log, nada mudará para o utilizador.

Passado algum tempo vais à SAAB espreitar que peixe veio à rede. Por cada vez que a condição se tiver verificado terás uma entrada associada ao ASSERT onde poderás ver o conteúdo de todas as variáveis que listaste no ASSERT. Com base na sua análise descobres o problema.

Agora imagina que durante a análise desconfiaste de uma coisa que queres experimentar. Voltas à SAAB e reconfiguras a activação do _checkpoint group_ do ZAPPA para activar os BREAK-POINTs (e podes também reconfigurar o ASSERT para fazer break-point em vez de apenas log). Avisas o utilizador e pedes-lhe que te avise assim que entrar em debug. Assumes o controlo da sessão dele e lá estará, paradinho à tua espera, o programa no sítio onde queres fazer a experiência.

## Cenário 2 - Encontrar pontos fracos no código do sistema

Um exemplo do comando CASE:

{{< highlight ABAP >}}
CASE var.
  WHEN '1'.
    WRITE 'um'.
  WHEN '2'.
    WRITE 'dois'.
  WHEN OTHERS.
*   Não sei o que fazer
ENDCASE.
{{< /highlight >}}
Há imensos comandos CASE espalhados pelo teu sistema SAP que não sabem o que fazer no caso do OTHERS. E isto não é muito bom e pode ter resultados inesperados.

Então decides dar início a uma investigação.

Na SAAB crias um _checkpoint group_ chamado ZCASEOTHERS. Depois procuras todos os comandos CASEs onde tenhas CASE OTHERS não tratados (ou onde se tenham esquecido de meter o CASE OTHERS) e acrescentas-lhe o seguinte comando:

{{< highlight ABAP >}}
  CASE var.
(...)
  CASE OTHERS.
    LOG- POINT ID zcaseothers
      SUBKEY sy- repid
      FIELDS var.
ENDCASE.
{{< /highlight >}}
Em produtivo, na SAAB, crias uma activação para servidor (em vez de para utilizador) em que activas apenas os LOG-POINTs e dizes para ficar activo durante uma semana. E vais à vidinha.

Passada essa semana vais à SAAB ver onde é que ocorreram os CASE OTHER e descobres que valores vieram à rede. E ficas assim com dados suficientes para decidir quais deles precisam de ser melhorados.

## Cenário 3 - Programar pensando no porvir

Para mim esta é a forma ideal de usar a framework: incluí-la no desenho da aplicação.
Ao desenvolveres uma determinada aplicação ZAPP, em vez de pensares que para esta vais desenvolver código escorreito, antecipas que, pela sua complexidade, ela irá inevitavelmente ter vários pontos fracos. Então crias logo um _checkpoint group_ ZAPP e no teu desenho incluis ASSERTs e LOG-POINTs em vários pontos críticos para que a qualquer momento os possas activar e assim mais facilmente analisar a aplicação enquanto esta corre. Tipo biópsia em vez de autópsia, tópsias?

## Conclusão

A principal conclusão é que os _checkpoints_ são um espectáculo e, se leste até aqui e não os começares a usar, então já não é por não os conheceres nem por não os entenderes e a partir de agora vais constantemente sentir um enorme peso na consciência e a murmurar para ti mesmo "é pá eu devia mesmo usar aquilo".

O Abapinho saúda-vos.

   [1]: https://pt.wikipedia.org/wiki/Sun_Ra
   [2]: https://pt.wikipedia.org/wiki/Frank_Zappa
