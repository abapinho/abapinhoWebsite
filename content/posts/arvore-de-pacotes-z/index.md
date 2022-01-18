---
title: 'A árvore dos pacotes Z - Uma proposta modesta'
slug: arvore-de-pacotes-z
date: 2019-10-23 09:00:46
tags: [estilo]
categories: [artigos]
wordpressId: 4291
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Quem lê o Abapinho sabe que eu defendo o uso e abuso do [ABAP Package Concept][1]. Hoje em dia a primeira coisa que eu faço quando começo um desenvolvimento novo é criar-lhe um pacote encapsulado que guardará todos os seus objectos que, nos casos mais complexos, será um pacote "Main" ainda subdividido em vários sub-pacotes.

Fica aqui a minha modesta proposta para criar uma árvore de pacotes Z que ajude a organizar aquilo que é normalmente uma confusão danada.

<!--more-->

Os pacotes, ainda que até aqui largamente menosprezados pela maioria, deveriam ser tratados como cidadões de primeira classe no universo SAP. Os bons programadores não devem focar-se apenas nos IFs e nos SELECTs. Deviam conseguir pensar e desenhar os seus desenvolvimentos a um nível mais alto. Pensar no que vão fazer em termos de blocos e interações entre estes. Caixas dentro de caixas dentro de caixas. Como as матрешки mas sem ter de aprender cirílico. Deveriam adoptar Domain-driven design (https://en.wikipedia.org/wiki/Domain-driven_design), que está muito bem explicada no livro https://dddcommunity.org/book/evans_2003/.

Mas para isso acontecer com sucesso não basta que um ou dois programadores adoptem este paradigma. É fundamental que o próprio sistema seja reflexo dessa abordagem. E um bom princípio para que isso aconteça é ter as grandes caixas bem definidas e já criadas no sistema. É essa a minha proposta.

Imaginem um sistema que já tem criados os 2 primeiros níveis de pacotes. Todos os desenvolvimentos feitos a partir de agora (e idealmente os antigos que sejam revistos) deverão encaixar por debaixo de um dos pacotes do segundo nível.

**Nível 0**
Eu disse 2 níveis, mas para todos os pacotes do nível 1 estarem agrupados, precisamos que estes tenham todos o mesmo pai. Ora se a nossa empresa se chama ACME SA, eu sugiro que o pai de todos os pacotes Z se chame ZACME. Num sistema ideal todo o código Z deveria estar debaixo deste pacote.

**Nível 1**
Claro que não há uma única forma de organizar isto mas tem de se escolher uma e a minha sugestão é seguir a divisão que o SAP já faz dos componentes aplicacionais, que é um dos parâmetros de configuração do próprio pacote. Assim, no primeiro nível proponho os seguintes pacotes:

{{< highlight ABAP >}}
ZACME
  ZFI_ROOT
  ZMM_ROOT
  ZSD_ROOT
  etc...
{{< /highlight >}}

A única razão para acrescentar o _ROOT prende-se com o facto de já ser provável que exista um ZMM ou um ZFI com um monte de objectos nos quais não quereremos mexer. Todos os pacotes _ROOT relevantes para o sistema em questão deverão ser criados antecipadamente.

**Nível 2**
Aqui é tentador agrupar por tipo de programa (report, user-exit, interface, etc.) mas a minha experiência diz-me que isso é má ideia porque... o que fazer quando um único desenvolvimento necessitar de reports, user-exists e interfaces? Então proponho continuar a lógica do nível 1 e usar o segundo nível da árvore de componentes aplicacionais da SAP:

{{< highlight ABAP >}}
ZACME
  ZFI_ROOT
    ZFI_GL (General ledger)
    ZFI_AP (Accounts payable)
    ZFI_AR (Accounts receivable)
    etc...
  ZMM_ROOT
    ZMM_PUR (Purchasing)
    ZMM_IM (Inventory management)
    etc...
{{< /highlight >}}

Sugiro que se criem antecipadamente todos os pacotes de 2º nível que já se sabe virem a ser necessários. Outros que venham a faltar deverão ser criados à medida que sejam necessários.

Os pacotes dos níveis 0, 1 e 2 TÊM de ser criados como "Structure package". Isto porque se fossem criados como "Main package" teriam de declarar todos os interfaces de pacote que os seus sub-pacotes necessitariam, o que obrigaria a que estes fossem frequentemente editados. O objectivo é que, uma vez criados, nunca mais se tenha de os alterar.

Uma vez criada esta árvore, todos os desenvolvimentos deverão ser criados em pacotes que ficarão por debaixo de um dos pacotes do seu segundo nível. Serão todos portanto pacotes de 3º nível. Por exemplo, um report XYZ de accounts payable ficaria dentro de um pacote que (dependendo da convenção de nomes) se poderia, por exemplo, chamar ZFI_XYZ e ficaria por debaixo de ZFI_AP. Ficará assim:

{{< highlight ABAP >}}
ZACME
  ZFI_AP
    ZFI_XYZ
{{< /highlight >}}

Os pacotes de 3º nível devem ser "Main" no caso de desenvolvimentos mais complexos que mereçam ser ainda subdivididos em vários sub-pacotes ou normais nos casos mais simples. Devem ser sempre marcados como encapsulados excepto quando exista uma boa razão para o não serem.

Há quem não saiba mas, se por alguma razão se mudar de ideias em relação a um desenvolvimento, os pacotes de 3º nível podem ser movidos para outro ponto da árvore sem qualquer risco ou consequência.

E é esta a minha proposta modesta. Tenho estado a pô-la em práctica. Claro que não resolve todos os cenários (há desenvolvimentos que são de FI e MM ao mesmo tempo, e agora? sei lá!) mas parece fazer sentido e está a funcionar. Todas as opiniões, críticas e sugestões são bem-vindas e desejadas.

Num próximo artigo explico melhor a importância de encapsular os pacotes e utilizar interfaces de pacote.

O Abapinho saúda-vos.

   [1]: {{< ref "pacotes-2-0" >}}
