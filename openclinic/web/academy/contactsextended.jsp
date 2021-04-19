<%@include file="/includes/validateUser.jsp"%>
<table width="100%">
	<tr class='admin'><td colspan="4">Contacts</td></tr>
<%
	Vector<Encounter> encounters = Encounter.selectEncounters("", "", "", "", "", "", "", "", activePatient==null?"-1":activePatient.personid, "");
	for(int n=0;n<encounters.size();n++){
		Encounter encounter = encounters.elementAt(n);
		out.println("<tr>");
		out.println("	<td class='admin2'>"+new SimpleDateFormat("dd/MM/yyyy HH:mm").format(encounter.getBegin())+"</td>");
		out.println("	<td class='admin2'>"+(encounter.getEnd()==null?"":new SimpleDateFormat("dd/MM/yyyy HH:mm").format(encounter.getEnd()))+"</td>");
		out.println("	<td class='admin2'>"+getTran(request,"encountertype",encounter.getType(),sWebLanguage)+"</td>");
		out.println("	<td class='admin2'>"+encounter.getService().getLabel(sWebLanguage)+"</td>");
		out.println("</tr>");
	}
%>
</table>