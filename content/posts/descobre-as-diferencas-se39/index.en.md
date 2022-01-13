---
title: 'Spot the differences with SE39'
slug: descobre-as-diferencas-se39
date: 2016-05-30 09:00:21
tags: [sapgui]
categories: [dicas]
wordpressId: 3556
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Earlier today I was doing a QC review to a new program named ZSDFAKSPE with almost 1000 lines and no comment whatsoever. An obvious clone of a standard program called SDFAKSPE.

So I decided to use the Spli-screen editor, found in transaction SE39. Having entered both programs I could then compare them side-by-side.

<!--more-->

Since whoever created ZSDFAKSPE used Pretty Printer, the editor started by showing differences in almost all lines. This was easily solve by going to the settings and activating the "ignore indentions" option, and now the editor only shows the lines in which the code really changed. And there's also an option to ignore comments.

And then it was as simple as using the dedicated navigation buttons in the toolbar to jump between changes.

This way, instead of spending one hour reading 1000 lines, it tooke me 2 minutes to find the differences.

Greetings from Abapinho.
