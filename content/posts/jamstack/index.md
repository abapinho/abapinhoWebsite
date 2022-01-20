---
slug: jamstack
title: Adeus Wordpress, olá Jamstack
description: O Abapinho deixou de correr sobre Wordpress. Agora é um site estático gerado em Hugo e alojado no Netlify.
date: 2022-01-12T09:00:00Z
tags: [jamstack, website, hosting]
categories: [artigos]
keywords: ["Jamstack"]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
draft: true
---
Depois de mais de 10 anos a usar [Wordpress][1], o mundo evoluiu e o Abapinho decidiu evoluir com ele.

<!--more-->

## Porquê abandonar o Wordpress?

Porque o Wordpress:

* É todo dinâmico, corre em PHP e é gerado no momento
* Como tal precisa de uma base de dados
* E tem um back-office para configurar tudo
* Que obriga a gerir utilizadores e passwords
* E a manter uma série de plugins
* Como caches para ficar mais rápido
* E alojar isto custa dinheiro

As coisas acima descritas não só adicionam complexidade como são pontos de vulnerabilidade na segurança do site.

## Porquê adoptar Jackstack?

Porque com [Jamstack][2]:

* O site é estático, gerado uma vez e publicado
* Como tal não precisa de base de dados
* Nem de back-office
* Nem de utilizadores
* Nem de plugins
* Nem de _hosting_ com capacidades dinâmicas
* Por ser só HTML é muito mais rápido
* Sem precisar de sistemas de cache
* E ainda por cima por ser colocado numa CDN
* Que o torna ainda mais rápido
* Além disso o conteúdo é todo baseado me [Markdown][11] em vez de HTML
* E por isso muito mais simples e poderoso
* A publicação é totalmente automatizada por [CI/CD][3]

Ironicamente, ao mesmo tempo que, sendo site estático, é em tudo mais simples, as ferramentas que suportam a sua edição, geração e publicação são tão poderosas que o resultado é muito melhor do que o dinossaurico Wordpress.

## Que ferramentas?

### Edição

O site é agora apenas uma estrutura de pastas com ficheiros Markdown e alguns templates em HTML e [Go][4]. Está alojado num repositório privado no [GitHub][5] e é editado localmente no [Visual Studio Code][6]. Mas também pode ser editado online no [Forestry][7] que integra directamente com o repositório no GitHub.

O Visual Studio Code e o Forestry são grátis.

### Geração

Os _Static Site Generators_ [são mais que as mães][8]. O mais conhecido é o [Jeckyl][9] mas eu optei pelo [Hugo][10] porque me pareceu mais simples e versátil e porque é feito em Go e eu gosto de Go. Quando faço _commit_ para o _main branch_, é automaticamente iniciado um _pipeline CI/CD_ que executa o comando Hugo que gera o site todo a partir do _markdown_+_templates_.

O Hugo é grátis

### Alojamento

O site está alojado na CDN do [Netlify][12] que é uma [_global edge network_][13] e é publicado automaticamente através do mesmo _pipeline CI/CD_ que corre a cada _commit_ para o _main branch_. O Netlify tem a vantagem adicional de gerar _deploy previews_ que são uma óptima forma de testar novidades no site antes de o publicar.

o netlify é grátis.

### Coisas dinâmicas

Ainda que o conteúdo seja todo estático, há algumas coisas que ainda assim têm de ser dinâmicas:

* Comentários: podia usar o [Disqus][14] que é um [SaaS][15] grátis mas eles são famosos por não respeitarem a privacidade dos utilizadores e por isso optei pelo [Remark42][16] que corre num [_Docker container_][17] na minha [VPS][18];
* _Analytics_: poderia usar o [Google Analytics][19] mas isso seria dormir com o inimigo, por isso estou a usar o [Matomo][20] que corre noutro _Docker container_ na minha VPS;
* Pesquisa: estou a usar o [Algolia][21]. Quando o site é publicado, o _pipeline CI/CD_ enviar um JSON com o conteúdo em português e inglês para o Algolia que o transforma em índices pesquisáveis por um scriptzinho Javascript que tenho em todas as páginas.
* Notificações por email: o Remark42 envia nofificações por email. Para isso estou a usar o [SendGrid][23].

O Remark42 e o Matomo são grátis. O Algolia é grátis até 10000 pesquisa por mês e o SendGrid é grátis até 100 emails/dia. A VPS custa 5€/mês na [Contabo][22].

## Conclusão

Bem, isto explica porque é que ultimamente não tenho publicado tantos artigos no site. Para já decidi manter o _design_ inalterado apenas porque seria complicado demais fazer tudo. Num futuro próximo vou abordar essa questão e tentar inventar uma nova imagem que seja _responsive_, para poder funcionar bem em telemóveis pois esse é o principal problema do Abapinho hoje.

Quaisquer críticas e sugestões são bem-vindas.

O Abapinho saúda-vos.

[1]: <https://wordpress.org/>
[2]: <https://jamstack.org/>
[3]: <https://pt.wikipedia.org/wiki/CI/CD>
[4]: <https://go.dev/>
[5]: <https://github.com/>
[6]: <https://code.visualstudio.com/>
[7]: <https://forestry.io/>
[8]: <https://jamstack.org/generators/>
[9]: <https://jekyllrb.com/>
[10]: <https://gohugo.io/>
[11]: <https://www.markdownguide.org/>
[12]: <https://netlify.com/>
[13]: <https://www.netlify.com/products/edge/>
[14]: <https://disqus.com/>
[15]: <https://pt.wikipedia.org/wiki/Software_como_servi%C3%A7o>
[16]: <https://remark42.com/>
[17]: <https://www.docker.com/>
[18]: <https://pt.wikipedia.org/wiki/Servidor_virtual_privado>
[19]: <https://analytics.google.com/>
[20]: <https://matomo.org/>
[21]: <https://www.algolia.com/>
[22]: <https://contabo.com/>
[23]: <https://sendgrid.com/>
