---
title: 'Análises parciais na SE30'
slug: se30-parciais
date: 2011-11-28 11:37:25
tags: [debug, performance]
categories: [dicas]
wordpressId: 1153
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Claro que já conheces a transacção SE30 (Análise de tempo de execução) e claro que a usas amiúde para analisar programas standard e descobrir nele tabelas, funções, BADIs e quejandos.

Ora se fores como eu, manténs uma relação de amor-ódio com esta transacção: se por um lado a amas por graças a ela consegues ver as entranhas de um programa sem ter de fazer debug, por outro lado odeia-la porque normalmente a lista de entranhas costuma ter milhares de linhas e tornar-se ingerível.

Mas eu já não sou como eu porque, desde que descobri que a SE30 permite fazer análises parciais, a minha relação com ela passou a ser de puro amor. E a partir de agora também tu poderás amá-la na sua totalidade porque vou ensinar-te este segredo.

  1. Transacção SE30;

  2. No bloco "Restrições de medição" cria uma variante com um nome qualquer diferente do DEFAULT;

  3. Na variante activa o pisco "Unidades determinadas";

  4. Insere a transacção ou programa ou módulo de função a analisar;

  5. Carrega em "Executar" (normalmente agora a análise começaria mas, como escolhemos "unidades determinadas", começa desligada e é preciso ligá-la explicitamente);

  6. Navega dentro do programa que estás a analisar até chegares ao ponto que queres analisar;

  7. Activa a análise escrevendo **/ron** lá em cima no campo de comandos;

  8. Faz o que tens a fazer;

  9. Desactiva a análise escrevendo lá em cima **/roff** ;

  10. Sai do programa, voltando ao ecrã da SE30.

Acabaste de fazer uma análise parcial que, em vez dos típicos milhares de linhas, tem apenas as dezenas ou centenas de linhas que ocorreram entre os comandos **/ron** e **/roff**. Mais útil, não?

Aproveita o balanço e explora as outras possibilidades disponibilizadas pelas variantes de "restrição de medição".

Obrigado a Michael Opoczynski pelo ensinamento.

E obrigado a [* Cati Kaoe *][1] pela foto.

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/catikaoe/3234711319/in/photostream/
