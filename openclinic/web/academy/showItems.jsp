<%@include file="/includes/validateUser.jsp"%>
<table width='100%'>
	<tr class='admin'>
		<td><%=getTran(request, "web", "type", sWebLanguage) %></td>
		<td><%=getTran(request, "web", "value", sWebLanguage) %></td>
	</tr>
<%
	String serverid = request.getParameter("serverid");
	String transactionid = request.getParameter("transactionid");
	TransactionVO transaction = MedwanQuery.getInstance().loadTransaction(Integer.parseInt(serverid), Integer.parseInt(transactionid));
	Collection items = transaction.getItems();
	Iterator i = items.iterator();
	while(i.hasNext()){
		ItemVO item = (ItemVO)i.next();
		out.println("<tr>");
		out.println("	<td class='admin'>"+ getTran(request, "web.occup", transaction.getTransactionType(), sWebLanguage)+"</td>");
		out.println("   <td class='admin2'>"+ item.getValue() +"</td>");
		out.println("</tr>");
	}
%>
</table>