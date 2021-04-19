<%@include file="/includes/validateUser.jsp"%>
<%
	Vector ecnounters = Encounter.selectEncounters("", "", "01/01/2021", "", "", "", "", "", "", "");
	for(int n = 0; n<ecnounters.size();n++){
		Encounter encounter = (Encounter)ecnounters.elementAt(n);
		java.util.Date begin = encounter.getBegin();
		System.out.println(encounter.getUid()+" - begin: "+begin);
	}
%>