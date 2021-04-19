<%@include file="/includes/validateUser.jsp"%>
<%
	
%>

<form name="reportForm" method="POST" action="<%=sCONTEXTPATH %>/academy/pdfRepportDate.jsp">
	<table width='100%'>
		<tr class='admin'>
			<td>
				<%=getTran(request, "web", "pdfreport", sWebLanguage) %>
			</td>
		</tr>
		<tr>
			<td>
				<%=SH.writeDateField("datebegin","reportForm", "", true, false, sWebLanguage, sCONTEXTPATH) %>
				
				<%=SH.writeDateField("dateend","reportForm", "", true, false, sWebLanguage, sCONTEXTPATH) %>
				<input class='button' type="submit" name="submitButton" value="Generer rapport"/>
			</td>
		</tr>
	</table>
</form>
