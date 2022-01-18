---
title: 'STA Ticket System improve SAP incident handling times'
slug: sta-ticket-system
date: 2016-02-29 09:00:53
tags: [debug]
categories: [artigos]
wordpressId: 3429
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'ticket system'
---
Today we have a guest, Tamás Holics. He owns STA Consulting, a Hungarian company which has created 2 very interesting SAP products. In this article Tamás presents the STA Ticket System.

## The problem

A lot of time is wasted in SAP software testing and maintenance processes due to incomplete or incorrect error reports from users and testers. Support people (analysts, developers) usually have to ask for more information about the error. This takes a lot of valuable working time from both the reporters of the error and support people. Solving the problem is often blocked until every information is available.

<!--more-->

Some typical examples:

  * Missing basic information

  * Users forget to enter critical data into the error reports, for example which system is affected, which SAP transaction was running, which Sales Order has the incorrect data etc. You simply can't start investigating the problem without information like this.

  * Incorrect information entered

  * Users mistype information, for example enter a wrong material number etc. This can make your developers debug for hours just to come back to the user that everything works fine. "Ooops, sorry it was Purchase Order 112000898 and not 112000989."

  * No technical information

  * Users can’t add technical data, for example they don’t know how to get the program and screen number of the current transaction. This is fine, why would they be trained to know this?

  * Missing attachments

  * Users forget to add a screenshot, short dump or an authorization report that will be required by the support staff anyway. If you had one dollar each time your IT support asked for a screenshot or a SU53 authorization report, you'd probably read this post on your yacht in Monaco.

Also, there are so many different ITSM tools out there. In order to report an error in SAP, users have to open new browser windows to launch the ITSM tool to report the error. There of course they have to enter all data manually that may take some time. Some organizations have more than five ITSM tools implemented. Test system connected to HP Quality Center, prodcution system connected to ServiceNow. Different UIs, processes. No wonder end-users may become confused.

## The solution

STA Ticket System provides an elegant and effective solution for all the problems listed above.

Key features are:

  * Errors can be reported directly from the SAP UI (all different types: classic SAP GUI, SAP Enterprise Portal, SAP Business Client, SAP Fiori Launchpad)

  * The program automatically creates an incident in the external ITSM tool of the company

  * The program automatically attaches all technical information (system, program, user and authorization data) as a PDF file

  * Users can add the business context using a few clicks (screen field values of the current program)

  * The program attaches a screenshot, short dump and authorization report automatically (when applicable)

## How does it work?

For this demonstration we used ServiceNow as the external ticketing tool. The first screenshot shows you how you can report an incident from SAP. Business Partner 331 is displayed using transaction BP. If there is any error (for example a screen field is incorrect), simply create an incident using the System menu. This is great because you don't have to leave the current screen at all.

![sta1][1]

The second screenshot shows that the main screen of STA Ticket System is displayed as a popup window. Here you can enter a short and a long description.

The lower half of the screen is a customer subscreen - a place where you can easily add your own fields. This means that if you have some custom fields defined in ServiceNow, you can simply add that using your own customer subscreen. This takes maximum a few hours even for a beginner SAP developer.

Users can attach any number of files here as well that will be attached to the ServiceNow incident of this example.

![sta2][2]

The next screenshot shows a very important and convenient feature of the tool. Users can add screen field contents to the ticket with a few clicks. The program lists all screen fields that are displayed on the running program and the user can simply select which ones to include. No manual typing means no typos.

![sta3][3]

When the user presses “Complete”, the program automatically creates an incident in ServiceNow. All fields are set as defined on the SAP screen. Notice the attachments added automatically (screenshot and PDF). In this integration example we have done the following:

  * Created a new Contact type ("Sent from SAP")

  * Created a new subcategory ("SAP") under category "Software"

  * Created two custom fields in ServiceNow

    * Scope (Entire SAP system, Entire department, Entire team or group, Single User)

    * Type (Authorization, Functional correctness, Fatal error, Performance, User Experience)

  * Defined groups per SAP module, like SAP Finance, SAP Material Management, SAP Security etc.

![sta4][4]

## Extra information

Here is a PDF document that was generated using STA Ticket System. All this information will be available for every incident your users create.

[pdf-embedder url="https://abapinho.com/wp-content/uploads/2016/02/Incident_INC0010066_ECC_20151202.pdf"]

An additional great function is that depending on the context of the current program, additional attachments are added to the ServiceNow incident.

  * The program cakes a screenshot automatically (must be confirmed by the user)

  * An authorization report (SU53) can be added as well. Your SAP basis and security people will love this feature.

  * If the current program results in a short dump, the program can attach it as HTML

![sta5][5]

![sta6][6]

![sta7][7]

You can use the product from SAP Enterprise Portal too. Simply launch it from the top of the portal or from the System menu of Transaction iViews

![sta8][8]

![sta9][9]

## Benefits

It is easy to see how your company can benefit from integrating SAP its existing ITSM tools using STA Ticket System.

  * Reduce non-value added communication resulting from incomplete or incorrect bug reports

  * Speed up debugging and maintenance tasks by providing additional information to developers

  * Boost job satisfaction of the support staff by reducing unnecessary communication and possibly unneeded debugging

  * Reduce the time needed to create an incident

  * As a result of all above, save SAP IT costs by reducing time to resolve incidents dramatically

You can spare a lot of time if your IT support is located far away from your end-users. Due to a big difference of timezones, often support people have to wait a whole day for some missing information. Very common for big multinational companies or for companies with an outsourced IT support.

Another "danger zone" is every holiday season. If a user reports an error before leaving for a long holiday, developers won't be able to work on the incident unless it is flawless. Forgot which SAP transaction he was using? He forgot to enter which system he was using out of the 30 the company uses? Forgot to enter which Sales Organization and Distribution channel did he use when starting the problematic report? This is how you can lose a month, degrade KPIs and fail SLAs.

For more information on STA Ticket System, please visit [this link][10].
You can see it in action connected to ServiceNow in [this video][11].

   [1]: images/sta1.jpg
   [2]: images/sta2.jpg
   [3]: images/sta3.jpg
   [4]: images/sta4.jpg
   [5]: images/sta5.jpg
   [6]: images/sta6.jpg
   [7]: images/sta7.jpg
   [8]: images/sta8.jpg
   [9]: images/sta9.jpg
   [10]: http://sta-technologies.com/products/ticket-system/
   [11]: https://www.youtube.com/watch?v=ML0G8sCA9K4
