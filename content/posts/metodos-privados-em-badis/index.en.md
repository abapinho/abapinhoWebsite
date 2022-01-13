---
title: 'Implementing private methods in BADIs'
slug: metodos-privados-em-badis
date: 2012-03-19 10:00:09
tags: [enhancements, oo]
categories: [artigos]
wordpressId: 1487
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
A little while ago I had an idea as eccentric as it was amazing that today I have decided to share here, namely, how to create private methods in BADI classes.

Let me explain.

<!--more-->

So by means of an introduction, two years ago I wrote an article entitled [Enhancing enhancements][1] and I proposed an organised way for implementing _enhancements_ which consists in never placing code directly in the _enhancements_ (whether in _user-exits_ , _mods_ , _BADIs_ or _enhancements_ ) but in advance by encapsulating every separate element that has to be done within one function. Read the article to understand the benefits of this approach. At the time objects were not yet used and for this reason I suggested the creation of a group of functions with a combination of function modules. Meanwhile, 2 years later I don't think it makes any sense at all to use functions unless when SAP forces us to do this (RFCs for example) Therefore the article is worth updating so as to use a class with static methods.

Well, I was in the process of implementing a BADI according to this same logic of always encapsulating the logic that is added to the enhancements and I started to create a class to which I added a method which I then invoked from the BADI method.

But then, _I had a lightbulb moment_ and I thought... but the BADI is already a class of its own. Why then do I have to create a new class? Indeed.

Then the idea emerged in my head to implement new private methods in the same class that implements the BADI and then to invoke them from the official BADI methods. In this way everything remains orderly without any need to create an extra class.

Let me now explain the process in detail.

Now imagine that you have to implement a BADI method. This is what you do:

  1. In SE19 you create the BADI implementation with the base in the BADI you want. Give it a name, etc, etc;

  2. Instead of entering the method that you want to implement, you first enter into the class that will contain the implementation:

![][2]

  3. (Now you are in SE24) Create a private method with a name that describes what you intend to do (I created 2):

![][3]

  4. Define the parameters of this method copying only the parameters that you will need from the BADI method:

![][4]

  5. Define exceptions if that makes sense;

  6. Implement your logic inside the new private method:

![][5]

  7. Then go to the public method of the BADI that you want to implement (you can go there directly via SE24 or do this from SE19);

  8. In this method you invoke your new private method (in this case the 2 are invoked immediately):

![][6]

Then you're done. Only now do you activate the BADI (in SE19) if it is not already active.

Advantage: Any orderly organisation has to have recourse to external classes.

Disadvantage: Private methods are not visible in SE19 (which only shows the BADI interface), which could cause some confusion for anyone unfamiliar with classes.

I think the advantage outweighs the disadvantage. What about you? What do you think? Do you see more advantages or disadvantages?

I found out that SAP likes this approach and uses it. Check out standard BADI BNK_BADI_ORIG_PAYMT_CHG) which makes use of it in the fallback implementation CL_BNK_BADI_ORIG_PAYMT_CHG. So we have their blessing.

Greetings from Abapinho.

   [1]: {{< ref "melhorar-os-melhoramentos" >}} (Enhancing enhancements)
   [2]: images/2012-02-07-08.10.30-pm.png (2012-02-07 08.10.30 pm)
   [3]: images/2012-02-07-08.12.27-pm.png (2012-02-07 08.12.27 pm)
   [4]: images/2012-02-07-08.13.52-pm.png (2012-02-07 08.13.52 pm)
   [5]: images/2012-02-07-08.46.50-pm.png (2012-02-07 08.46.50 pm)
   [6]: images/2012-02-07-08.09.03-pm.png (2012-02-07 08.09.03 pm)
