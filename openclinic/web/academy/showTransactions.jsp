<%@include file="/includes/validateUser.jsp"%>
<table width='100%'>
	<tr class='admin'>
		<td><%=getTran(request, "web", "date", sWebLanguage) %></td>
		<td><%=getTran(request, "web", "type", sWebLanguage) %></td>
	</tr>
<%
	Vector transactions = MedwanQuery.getInstance().getTransactionsAfter(Integer.parseInt(activePatient.personid), SH.parseDate("01/01/1900"));
	System.out.println(transactions);
	
	for(int n=0; n<transactions.size();n++){
		TransactionVO transaction = (TransactionVO)transactions.elementAt(n);
		
		String url = getTran(request, "web.occup", transaction.getTransactionType(), sWebLanguage);
		url = "<a href='"+sCONTEXTPATH+"/main.jsp?Page=academy/showItems.jsp"+
			  "&serverid="+transaction.getServerId()+"&transactionid="+transaction.getTransactionId()+"'>"+url+"</a>";
		out.println("<tr>");
		out.println("	<td class='admin'>"+
							SH.formatDate(transaction.getUpdateTime())+"</td>");
		out.println("   <td class='admin2'>"+ url +"</td>");
		out.println("</tr>");
		
	}
%>
</table>