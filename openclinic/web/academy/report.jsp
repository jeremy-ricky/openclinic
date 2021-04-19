<%@include file="/includes/validateUser.jsp"%>

<form 	name='reportForm' method='post' 
		action='<%=sCONTEXTPATH %>/academy/pdfReportServiceDate.jsp'>
	<table width='100%'>
		<tr class='admin'>
			<td colspan='2'><%=getTran(request,"web","incomereport",sWebLanguage) %></td>
		</tr>
		<tr>
			<td>
				<%=SH.writeDateField("begindate", "reportForm", "", 
						true, false, sWebLanguage, sCONTEXTPATH) %>
				-
				
				<%=SH.writeDateField("enddate", "reportForm", "", 
						true, false, sWebLanguage, sCONTEXTPATH) %>
			</td>
			<td>
				<%=getTran(request,"web","service",sWebLanguage) %>: 
               	
               	<input type="hidden" name="service" id="service" value="">
               	<input class="text" type="text" name="EditDebetServiceName" id="EditDebetServiceName" readonly size="30" value="" >
               	<img src="<%=sCONTEXTPATH %>/_img/icons/icon_search.png" class="link" alt="<%=getTran(null,"Web","select",sWebLanguage)%>" onclick="searchService('service','EditDebetServiceName');">
				
				<input class='button' type='submit' value='Générer rapport'/>
			</td>
		</tr>
	</table>
</form>

<script>
	function searchService(serviceUidField,serviceNameField){
		openPopup("/_common/search/searchService.jsp&ts=<%=getTs()%>&VarCode="+serviceUidField+"&VarText="+serviceNameField);
		document.getElementById(serviceNameField).focus();
  	}
</script>