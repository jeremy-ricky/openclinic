<%@include file="/includes/validateUser.jsp"%>
<%
	String mypersonid = "";
	boolean bPersonidValidated = false;
	if(activePatient != null){
		mypersonid = activePatient.personid;
		bPersonidValidated = true;
	}
	if(request.getParameter("mypersonid") != null){
		mypersonid = request.getParameter("mypersonid");
		try{
			int id = Integer.parseInt(mypersonid);
			bPersonidValidated = true;
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<form name="reportForm" method="POST">
	ID Patient : <input type="text" name="mypersonid" value="<%=mypersonid%>"/>
	<input type="submit" name="submitButton" value="Executer"/>
</form>
<% 
	String sql = "SELECT lastname, firstname, OC_ENCOUNTER_TYPE, OC_ENCOUNTER_SERVICEUID, OC_ENCOUNTER_SERVICEBEGINDATE"+ 
			" FROM oc_encounters a, adminview b, oc_encounter_services c"+ 
			" WHERE"+ 
			" b.personid=OC_ENCOUNTER_PATIENTUID AND"+
			" a.OC_ENCOUNTER_SERVERID=c.OC_ENCOUNTER_SERVERID"+ 
			" AND a.OC_ENCOUNTER_OBJECTID=c.OC_ENCOUNTER_OBJECTID"+
			" AND OC_ENCOUNTER_SERVICEENDDATE is null";
	
	if(bPersonidValidated){
		sql = sql+" AND b.personid=?";
	}
	//System.out.println(sql);
	Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	
	if(bPersonidValidated){
		ps.setString(1, mypersonid);
	}
	
	ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String lastname = rs.getString("lastname");
			String firstname = rs.getString("firstname");
			String encountertype = rs.getString("OC_ENCOUNTER_TYPE");
			String serviceuid = rs.getString("OC_ENCOUNTER_SERVICEUID");
			java.util.Date begindate = rs.getDate("OC_ENCOUNTER_SERVICEBEGINDATE");
			
			out.println("<tr>");
			out.println("	<td class='admin'>"+lastname+"</td>");
			out.println("	<td class='admin'>"+firstname+"</td>");
			out.println("	<td class='admin2'>"+encountertype+"</td>");
			out.println("	<td class='admin2'>"+serviceuid+"</td>");
			out.println("	<td class='admin2'>"+begindate+"</td>");
			out.println("</tr>");
		}
		rs.close();
		ps.close();
		conn.close();
%>