---
slug: abapgit-undo
title: Undo with abapGit
description: Use abapGit to undo your changes
date: 2023-03-06T09:00:00Z
tags: []
categories: [artigos]
keywords: [abapGit undo]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Did you know that you can finally make radical changes to a development without fear
because there is a simple way to undo all those changes?

<!--more-->

Until recently there was no decent way to automate changes to multiple SAP objects. All changes had to be done by hand or semi-automatically, at most using [SAPlink][1] which only supported a few object types.

So if I wanted to do a more violent experiment in the code involving making changes to multiple objects, I would think long and hard before doing it because, if I needed to undo them, I would have to revert everything by hand. It was laborious, unpleasant and dangerous.

abapGit][2] changed that. Thanks Lars Hvam! git][3] is a distributed version manager. And abapGit is a project that tries to implement it (as much as possible) in the SAP reality.

abapGit is used for much more than what I am going to teach here. It can be used to manage and distribute project versions, both internally and on the web. But I thought I'd share that it can also be used for this very specific task: undoing multiple changes to a package.

I recently used it for that very purpose because I am teaching ABAP training and this was the best way I found to be able to repeatedly make and undo a series of changes to a set of objects.

To achieve this you can make use of an excellent feature of abapGit: _offline_ repositories. It goes like this:

1. In abapGit you create an _offline_ repository of a package that you want to change;
2. Export the package to a ZIP file on your local computer. This will be your original code. The one you may eventually revert to;
3. Make all necessary changes in that package: create, delete and modify objects, be they programs, DDIC objects or others;
4. The experience failed and you now wish to revert your changes;
5. Go back to abapGit, pick the repository you have created and then import the ZIP that you saved earlier;
6. Now abapGit should highlight all the objects that have changes and you can analyse the differences between what you have in the system (_local_) and what you have imported from the ZIP file (_remote_);
7. Press _Pull_ and say yes to everything. abapGit will revert all the changes. All the objects in the package will now be exactly as they were at the time you created the ZIP. What you have created in the meantime will be deleted, what you modified will be reverted and what you deleted will be recreated.

Note of course that the same can also be achieved using _online_ repositories which is, by the way, the best way to work with abapGit. But for that you need a git server which you may not have at hand or you may be prevented from using by company privacy policies. And that's where _offline_ repositories can help you.

Greetings from Abapinho.

[1]: <https://wiki.scn.sap.com/wiki/display/ABAP/SAPlink>
[2]: <https://abapgit.org/>
[3]: <https://git-scm.com/>
