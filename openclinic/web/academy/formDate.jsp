<%@include file="/includes/validateUser.jsp"%>
<%
	
%>

<form name="reportForm" method="POST" action="<%=sCONTEXTPATH %>/academy/financialReport.jsp">
	<table width='100%'>
		<tr class='admin'>
			<td>
				<%=getTran(request, "web", "dailyincomereport", sWebLanguage) %>
			</td>
		</tr>
		<tr>
			<td>
				<%=SH.writeDateField("datebegin","reportForm", "", true, false, sWebLanguage, sCONTEXTPATH) %>
				<input class='button' type="submit" name="submitButton" value="Generer rapport"/>
			</td>
		</tr>
	</table>
</form>
