---
slug: jamstack
title: Farewell Wordpress, hello Jamstack
description: Abapinho is no longer running on Wordpress. It is now a static site generated by Hugo and hosted on Netlify.
date: 2022-01-21T09:00:00Z
tags: [jamstack, website, hosting]
categories: [artigos]
keywords: ["Jamstack"]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
draft: false
---
After over 10 year using [Wordpress][1], the world evolved and Abapinho decided it's time to evolve with it.

<!--more-->

## Why abandon Wordpress?

Because Wordpress:

* Generates dynamic pages on the moment in PHP
* And, as such, needs a database
* And has a publicly accessible backoffice
* Which requires users and passwords
* And keeping a lot of plugins
* Like caches to make it deliver pages faster
* And hosting all this costs money

The things in the above list not only add complexity to the system but are also vulnerability points in the website's security.

## Why adopt Jackstack?

Because with [Jamstack][2]:

* The website is static, generated only once, when published
* As such there is no online database
* No backoffice
* No users
* No plugins
* No special hosting with _dynamic_ capabilities
* Because everything is plain HTML, everything is really fast
* Without the need for a cache between the server and the browser
* And the content is hosted in a CDN
* Which makes everything even faster
* Besides, the whole content is now all [Markdown][11] em vez de HTML
* Markdown is simpler but still powerful
* And deploying it is fully automated by [CI/CD][3]

Ironically, while being a static site makes everything simpler, the tools that are used to edit, generate and deploy it are so powerful and so well integrated that the result is in every way better than with the old Wordpress.

## What tools?

### Editing

The site is not just a simple folder with a lot of Markdown files and some HTML templates with a some  [Go][4] stuff in them. These are hosted in a [GitHub][5] private repository and can be edited locally using [Visual Studio Code][6] or online on [Forestry][7] which integrates directly with GitHub.

GitHub, Visual Studio Code and Forestry are free.

### Generation

There are [a lot][8] of _Static Site Generators_. [Jeckyl][9] is the most famous but I chose [Hugo][10] because I found it simpler, more versatile and because it's made in Go and I like Go. Whenever I _commit_ to the _main branch_, a _CI/CD pipeline_ is automatically triggered which executes the Hugo command to generate the whole site from the _markdown_ and _templates_ files.

Hugo is free.

### Hosting

The site is now hosted in [Netlify][12] which is a [_global edge network_][13] and is automatically published to its public destination by the same _CI/CD pipeline_. And it even has the bonus of generating _deploy previews_ which are a great testing tool.

Netlify is free for low traffic sites like this one.

### Dynamic stuff

Even though all content is static, some things still need to be dynamic:

* Comments: I could use [Disqus][14] which is a free [SaaS][15] but they are famous for not respecting users privacyy so I chose to self-host [Remark42][16] as a [_Docker container_][17] in my [VPS][18];
* _Analytics_: I could use [Google Analytics][19] but I've now managed to mostly deGoogle my life so... I'm using [Matomo][20] instead, running it as another _Docker container_ in my VPS;
* Search: I'm using [Algolia][21]. Every time the site is published, the _CI/CD pipeline_ sends a JSON with the whole ontent in both Portuguese and English to Algolia which then converts it into searchable indexes. A little Javascript script in all pages calls Algolia's API and renders the instant search textbox.
* Email notifications: Remark42 sends email notifications. For that i'm [SendGrid][23].

Remark42 and Matomo are free. Algolia is free up to 10000 searches per month and SendGrid is free up to 100 emails/day. The VPS custs 5€/month in [Contabo][22] and I already had it running for other purposes anyway.

## Conclusion

Well, I guess this explains why I haven't been publishing much content lately. I decided to not touch the _design_ for now so that I couuld tackle one thing at a time. But sooner or later I'll have to deal with it because it is not _responsive_ and, as such, it doesn't work well in small screens which is a big problem.

Any critics and suggestions are welcome.

Greetings from Abapinho.

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
