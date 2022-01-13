---
title: 'Melhorar os melhoramentos'
slug: melhorar-os-melhoramentos
date: 2009-03-20 10:17:37
tags: []
categories: [artigos]
wordpressId: 16
draft: false
---
No princípio era o INCLUDE.

    Depois vieram os CMODs,
      Seguiram-se logo as BADIs,
        Agora são os Enhancements.

            E no entanto, o caos continua.

**Crítica**
Na maior parte dos projectos SAP em que já trabalhei, a metodologia de utilização de todas estas modificações é a tudo-ao-molho-e-fé-em-SAP e é normal encontrar num único include - como o MV45AFZZ - extensões de código tão grandes que, se o SAP fosse a princesa Rapunzel, dava para lhe fazer umas tranças até cá abaixo para o príncipe subir à sua torre. Este código normalmente implementa várias funcionalidades diferentes e independentes que, ao longo do tempo, se vão emaranhando quase irreversivelmente umas nas outras (tipo trança mesmo). Como consequência, qualquer alteração ao código existente requer cuidados redobrados e é sempre vista como um risco para o funcionamento de tudo o que lá está.

Venho aqui propor uma solução simples e eficaz para este problema.

<!--more-->

**Clínica**
A solução para este problema é seguir uma das regras mais básicas da programação: encapsular. E a minha proposta para o conseguir é respeitar a seguinte regra de ouro: é proibido meter código directamente nos enhancements. Sejam eles includes de user-exits ou de CMODs ou métodos de BADIs ou enhancements.

E para o conseguir sugiro que, sempre que seja necessário adicionar lógica ao standard através de um destes mecanismos, o código seja sempre colocado dentro de uma função que será então invocada por eles.

Nota: abriremos excepção ao código de controlo ou comum a todas as tarefas a executar num determinado enhancement.

**Tratamento 1**
Imaginemos que é necessário fazer alterações ao IDOC de saída da ordem de compra (ORDERS05). Necessitamos de, não uma, mas duas alterações, independentes uma da outra:

a) alterar um campo no segmento E1EDKA1 para determinados parceiros;
b) adicionar o segmento extra Z1EDK01 apenas na extensão ORDERS05EX1.

Façamos assim:

1\. O enhancement é do tipo SMOD, chama-se MM06E001 e o componente que pretendemos é o módulo de função EXIT_SAPLEINM_002 (Customer Enhancements to Data Segments: Purchasing Document). Esta função disponibiliza o include ZXM06U02.

O normal seria implementar directamente neste include todas as alterações desejadas. Em vez disso faremos o seguinte.

2\. Criamos um grupo de funções chamado Z_ZXM06U02 e damos-lhe a mesma descrição da função referida acima. Este grupo de funções virá a conter um módulo de função por cada uma das diferentes acções que pretendermos implementar neste enhancement.

3.a. Criamos o módulo de função Z_ZXM06U02_E1EDKA1. Como parâmetros de entrada enviamos, dos parâmetros disponizados pela função EXIT_SAPLEINM_002, apenas aqueles de que vamos necessitar, por exemplo o XEKKO e o XEKPO e, como pretendemos alterar os segmentos de dados, a tabela interna INT_EDIDD. Dentro desta função implementamos a lógica necessária para proceder à alteração do campo desejado.

3.b. Criamos o módulo de função Z_ZXM06U02_Z1EDK01. Neste caso, os parâmetros poderão ser diferentes mas a lógica mantém-se: declarar apenas os parâmetros necessários. Lá dentro implementa-se a lógica necessária a adicionar o segmento Z1EDK01.

Em ambas as funções comentamos de forma clara o que lá se pretende.

4\. No include ZXM06U02 implementa-se apenas a invocação de ambas as funções antes criadas. Mais nada. Como resultado, o código deste include ficará algo como isto:


{{< highlight ABAP >}}
* Modificar segmento E1EDKA1 para parceiros AW
CALL FUNCTION 'Z_ZXM06U02_E1EDKA1'
  EXPORTING
    XEKKO = xekko
  TABLES
    XEKPO = xekpo
    INT_EDIDD = int_edidd.

* Criar segmento Z1EDK01 para a extensão ORDERS05EX1
CALL FUNCTION 'Z_ZXM06U02_Z1EDK01'
  EXPORTING
    CONTROL_RECORD_OUT = control_record_out
    XEKKO = xekko
  TABLES
    XEKPO = xekpo
    INT_EDIDD = int_edidd.
{{< /highlight >}}

É muito importante que as diferentes funções não dependam umas das outras pois, caso contrário, volta o caos.

Vantagens:

  * Em vez de ficar com um combóio de código onde mais cedo ou mais tarde ninguém se entende, ficamos apenas com uma lista clara dos procedimentos que ali ocorrem;

  * Caso seja necessário desactivar uma das alterações, basta para isso comentar a chamada à função;

  * Como todos os user-exits definidos assim é fácil encontrá-los. Basta pesquisar os grupos de funções;

**Tratamento 2**
Agora um exemplo mais complexo e que quebra a regra de ouro (por um bom motivo).

Estamos na transacção ME21N - Criação de Ordem de Compra, e precisamos de intervir de duas formas ao nível do processamento do item aquando da criação ou modificação interactiva de itens da ordem. As duas NÃO são independentes uma da outra:

a) Verificar um objecto de autorização definido pelo utilizador
b) Arredondar quantidade do item

Aqui vai.

1\. Para isto vamos implementar a BADI ME_PROCESS_PO_CUST e usar o seu método PROCESS_ITEM que é executado no PAI da transacção ME21N a cada alteração ao nível do item.

2\. Criamos um grupo de funções chamado Z_ME_PROCESS_PO_CUST e damos-lhe a mesma descrição da BADI referida acima. Este grupo de funções virá a conter um módulo de função por cada uma das diferentes acções que pretendermos implementar neste enhancement.

3\. Agora vamos complicar um pouco. Porquê? Por várias razões. Todas elas relacionadas com o facto de, ao contrário do exemplo anterior em que os dados estavam já disponíveis em estruturas e tabelas internas, aqui têm de ser obtidos através da chamada de métodos de classes. Há métodos para obter itens, para gravar itens, etc. Assim, mesmo que várias coisas sejam feitas a um item, há que obtê-lo e gravá-lo apenas uma vez. Este facto obriga-nos a manter alguma lógica comum a todas as actividades que ali quisermos efectuar.

Assim, no início do nosso método PROCESS_ITEM executamos o seguinte código que, fazendo uso de objectos disponibilizados pelo PROCESS_ITEM, nos permite obter os dados do item e do cabeçalho:


{{< highlight ABAP >}}
DATA: po_item TYPE mepoitem,
           po_header TYPE mepoheader,
           po_po TYPE REF TO if_purchase_order_mm.

DATA: BEGIN OF status,
                            abort TYPE flag,
                            item_changed TYPE flag,
END OF status.

* Get PO data and initialize variables
po_item = im_item->get_data( ).
po_po = im_item->get_header( ).
po_header = po_po->get_data( ).
CLEAR status.
{{< /highlight >}}

Além disso, declaramos uma pequena estrutura com duas flags. A primeira, STATUS-ABORT, assinala um eventual erro em algum momento do nosso processo que nos permite saber que não devemos continuá-lo. A segunda, STATUS-ITEM_CHANGED, assinala alterações aos dados e permite-nos, no final do processo, saber se é necessário gravar os dados ou não. Já vamos ver como são utilizadas.

4.a. Agora vem a primeira acção: verificar o objecto de autorização. Para isso criamos o módulo de funções Z_ME_PROCESS_PO_CUST_AUTH_CHK e passamos-lhe os parâmetros de que necessita. Fica assim:


{{< highlight ABAP >}}
* Check for custom authorizations
CALL FUNCTION 'Z_ME_PROCESS_PO_CUST_AUTH_CHK'
  EXPORTING
    po_item = po_item
  CHANGING
    abort_badi = status-abort.
{{< /highlight >}}

Se a autorização falhar, a função deverá ligar a flag STATUS-ABORT.

4.b. Agora a segunda acção: arredondar quantidade do item. Criamos o módulo de funções Z_ME_PROCESS_PO_CUST_ROUNDING que fica assim:


{{< highlight ABAP >}}
* Round item quantities
IF status-abort EQ space.
  CALL FUNCTION 'Z_ME_PROCESS_PO_CUST_ROUNDING'
    EXPORTING
      po_header = po_header
    CHANGING
      po_item = po_item
      item_changed = status-item_changed.
ENDIF.
{{< /highlight >}}

Estão a ver? Começa-se logo por testar a flag STATUS-ABORT para não trabalhar para o boneco. Depois, neste caso, como há eventual alteração dos dados do item, já é necessário considerar a flag STATUS-ITEM_CHANGED, que deverá ser ligada no caso de haver arredondamento da quantidade.

Agora poder-se-iam criar tantos procedimentos destes quantos se quisesse, e ficariam sempre claros e arrumados.

5\. Finalmente, a lógica comum de finalização do processo. É simples: caso tenha havido alteração dos dados, estas são guardadas; caso tenha havido algum erro, assinala-se o erro. Tudo através de métodos disponibilizados na BADI:


{{< highlight ABAP >}}
* Update PO
IF status-abort EQ space.
* Save changes to item
  IF status-item_changed NE space.
    im_item->set_data( po_item ).
  ENDIF.
ELSE.
  im_item->invalidate( ).
ENDIF.
{{< /highlight >}}

E pronto. Enfim, este caso é já bastante complicado, mas permite ficar com a ideia de que, mesmo assim, é possível implementar esta minha proposta.

A minha promessa é: em enhancements complicados, esta abordagem garante sanidade mental ao longo dos anos. No projecto onde implementei o código que usei para os exemplos, esta BADI tem já nada mais nada menos que 12 acções diferentes e independentes, cada uma contida numa função. Quando cheguei ao projecto estavam todas a eito sem encapsulamento. Ninguém se entendia e montes de consultores morreram ou ficaram estropiados apenas por terem olhado de soslaio para esta BADI. Agora fazer alterações ali é como beber o néctar dos deuses.

O Abapinho saúda-vos.
