---
title: 'Bate às portas certas'
slug: portas-sap
date: 2011-04-02 08:49:57
tags: [sysadmin]
categories: [dicas]
wordpressId: 701
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Para tua conveniência, aqui tens as portas TCP/IP utilizadas pelo _NetWeaver Application Server ABAP_ e pelo _Internet Connection Manager (ICM)_ :


{{< highlight ABAP >}}
<table border="0">
<thead>
<tr>
<th>Serviço</td>
<th>Número porta/Nome serviço</td>
<th>Por defeito</td>
<th>Fixo</td>
</tr>
</thead>
<tbody>
<tr>
<td>Dispatcher</td>
<td>32NN/sapdpNN</td>
<td>3200</td>
<td>x</td>
</tr>
<tr>
<td>Gateway</td>
<td>33NN/sapgwNN</td>
<td>3300</td>
<td>x</td>
</tr>
<tr>
<td>Gateway</td>
<td>48NN/sapgwNNs</td>
<td>4800</td>
<td>x</td>
</tr>
<tr>
<td>ICM HTTP</td>
<td>80NN</td>
<td>8000</td>
<td> </td>
</tr>
<tr>
<td>ICM HTTPS</td>
<td>443NN</td>
<td>Inactivo</td>
<td> </td>
</tr>
<tr>
<td>ICM SMTP</td>
<td>25</td>
<td>Inactivo</td>
<td> </td>
</tr>
<tr>
<td>Message Server</td>
<td>36NN/sapmsSID</td>
<td>3600/sapmsC11</td>
<td> </td>
</tr>
<tr>
<td>Message Server HTTP</td>
<td>81NN</td>
<td>8100</td>
<td> </td>
</tr>
<tr>
<td>Message Server HTTPS</td>
<td>444NN</td>
<td>Inactivo</td>
<td> </td>
</tr>
<tr>
<td>Central System Log</td>
<td>UDP: 12NN, 13NN, 14NN, 15NN</td>
<td>Inactivo</td>
<td> </td>
</tr>
</tbody>
</table>
{{< /highlight >}}

Para saberes mais consulta [este documento da SAP][1].

O Abapinho saúda-vos.

   [1]: https://archive.sap.com/kmuuid2/902ce392-dfce-2d10-4ba9-b4f777843182/Regular%20Expression%20Processing%20in%20ABAP.pdf
