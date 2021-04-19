<%@include file="/includes/validateUser.jsp"%>
<table width="100%">
  <tr class="admin">
    <td colspan="4">Contacts</td>
    
  </tr>
  
<%
  Vector<Encounter> encounters= Encounter.selectEncounters("", "", "", "", "", "", "", "", activePatient==null?"-1":activePatient.personid,"");

out.println("<tr>");
out.println("   <td class='admin2'>BEGIN DATE</td>");
out.println("   <td class='admin2'>END DATE</td>");
out.println("   <td class='admin2'>ENCOUNTER TYPE</td>");
out.println("   <td class='admin2'>SERVICE</td>");
out.println("</tr>");
 for(int n=0; n<encounters.size(); n++){
	 Encounter encounter = encounters.elementAt(n);
	 out.println("<tr>");
	 out.println(" <td class='admin2'>"+new SimpleDateFormat("dd/MM/yyyy HH:mm").format(encounter.getBegin())+"</td>");
	 out.println(" <td class='admin2'>"+(encounter.getEnd()==null?"": new SimpleDateFormat("dd/MM/yyyy HH:mm").format(encounter.getEnd()))+"</td>");
	 out.println(" <td class='admin2'>"+getTran(request, "encounterType",encounter.getType(),sWebLanguage)+"</td>");
	 //out.println(" <td class='admin2'>"+getTran(request, "service",encounter.getServiceUID(),sWebLanguage)+"</td>");
	 out.println(" <td class='admin2'>"+encounter.getService().getFullyQualifiedName(sWebLanguage)+"</td>");
	 out.println("</tr>");
 }
%>

</table>