---
title: 'Request Based Debugging'
slug: request-based-debugging
date: 2014-05-12 09:00:10
tags: [debug, sapgui]
categories: [artigos]
wordpressId: 2665
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Se em _debug_ consultares a variável de sistema UNAME dentro de uma chamada RFC podes achar estranho encontrar um utilizador que não o teu. O que acontece é que o sistema adopta um utilizador específico a chamadas remotas e uma nova sessão é iniciada. Uma nova sessão implica um novo contexto de execução e, consequentemente, todos os nossos _breakpoints_ , já estrategicamente colocados, não serão reconhecidos.

Este problema pode dificultar um _debug_ simples obrigando-nos a percorrer o código à procura DAQUELA chamada remota ÀQUELE sistema em particular.

A SAP tem a solução.

<!--more-->

Para evitar este tipo de situações a SAP disponibiliza, desde a Netweaver Release 7.02, a funcionalidade de _debug_ por _Terminal ID_. O _Terminal ID_ identifica o utilizador Microsoft Windows que iniciou a sessão e é armazenado no registo do Windows sob a chave _HKEY_CURRENT_USER\Software\SAP\ABAP Debugging_.

Este identificador único permite que o debugger não se atrapalhe com as mudanças de sessão e responda a todos os _breakpoints_ externos (subscritos a um determinado _Terminal ID_ ) com a tranquilidade a que estamos habituados.

Os passos para iniciar uma sessão de debugging por terminal ID são os seguintes:

  1. _Login_ no sistema onde pretendemos fazer _debug_ ;

  2. Abrir o objecto a ser testado no editor ABAP (SE38, SE80, SE37, SE24) e introduzir os _breakpoints_ externos pretendidos;

  3. Aceder ao menu de debugging e escolher a opção de debug por _ID terminal_ :
_Utilitários>Configurações>Editor  ABAP>Depuração_
Nota: Se ainda não existir, um novo ID será gerado e armazenado no registo do Windows;

  4. Ao aceitar o sistema irá perguntar se os _breakpoints_ que já existem deverão continuar activos. A reposta é sim. Neste momento já temos breakpoints externos associados a um terminal ID;

  5. No sistema de origem podemos agora executar o programa que chama o nosso RFC em _debug_ mas, ao invés de utilizar o comando **/h** utilizamos o comando **/htid** indicando ao _debug_ que deve parar em todos os _breakpoints_ associados ao meu _terminal ID_.

Esta é uma funcionalidade muito prática e pode também ser aplicada a chamadas HTTP. Mas para este cenário será necessária a instalação de um _plug-in_ no browser que permita a propagação do terminal ID às camadas de baixo.

Nota: Neste cenário assumimos que o utilizador que corre o programa é o mesmo que introduz os breakpoints no RFC a testar pois assim, consequentemente, o terminal ID será o mesmo. Podem no entanto haver dois utilizadores distintos e para estes casos podemos usar os seguintes comandos para activar/desactivar o debug com base em terminal ID:

/hset tid=<tid>
| <tid> = do utilizador que introduziu os breakpoints

---|---

/hget tid
| Exibir o terminal ID assignado

/hdel tid
| Eliminar a assignação a um terminal ID

O Abapinho agradece a Miguel Jorge por ter escrito este artigo.

Obrigado Howard Dickins pela [foto][1].

   [1]: https://www.flickr.com/photos/dorkomatic/6182110293/in/photostream/
