---
title: 'abapBlame - My new open source project'
slug: abapblame
date: 2019-12-16 10:53:08
tags: [abapblame, abapgit, blame, git, opensource, tool]
categories: [noticias]
wordpressId: 4337
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
ABAP's versioning system is terribly bad. Besides all its faults, it doesn't provide an easy way to determine who did what and when. [Git][1], which is a decent versioning tool, let's you do this through its [git-blame][2] command.

Due to this, many ABAP programmers got used to sign the code with their name and date every time they add, delete or modify lines in a
program. And the more that program is modified, the more difficult it becomes to read it and understand what's there.

<!--more-->

Hoping to contribute with a solution for this, I created a program that tries to replicate some of git-blame's functionality. It is now in alpha stage (still missing some functionality), almost beta. But it already works. And it's very easy to use. Please try it. I hope you like it. All suggestions and contributions are welcome.

You can find it here: <https://github.com/abapinho/abapBlame>

If you care about the project and want to help me give it more visibility please add click the star button in the project's github. Thanks!

Greetings from Abapinho.

Photo credit: [chucknado][3].

   [1]: https://git-scm.com/
   [2]: https://www.git-scm.com/docs/git-blame
   [3]: https://visualhunt.co/a4/637c1e
