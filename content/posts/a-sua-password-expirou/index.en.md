---
title: 'Your password has expired. Change it 5 times.'
slug: a-sua-password-expirou
date: 2012-05-07 10:00:08
tags: [sysadmin]
categories: [dicas]
wordpressId: 1666
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
It is not uncommon for us to be emotionally attached to our passwords. Therefore, it is always rather painful to receive those despicable threatening notices that say "your password is going to expire”. Soon followed by the blow we receive to our heart on the appearance of the inevitable vile invective that "your password has expired." At such times, the hurt is so great that all the muses leave us, we have imagination cramp and remain stuck there, staring and drained, emptied of any idea to help us choose our next password.

But, that was before.

I propose the following for future use: employ one of [ the many wonderfully crafty methods that Abapinho taught you][1] to edit the USR02 table. Go to your user registration and delete the content of fields OCOD1, OCOD2, OCOD3, OCOD4 and OCOD5. And SAP has forgotten. It was just a momentary lapse it had. Now you can again use the password of your heart.

Thanks to Allan Oliveira for the tip.

Greetings from Abapinho.

   [1]: {{< ref "como-sabotar-tabelas" >}} (How to sabotage tables)
