<%@include file="/includes/validateUser.jsp"%>
<%
	String lastAccess = "";
	if(request.getParameter("lastaccess") != null){
		lastAccess = request.getParameter("lastaccess");
	}
	if(lastAccess.length()==0){
		lastAccess = SH.formatDate(new java.util.Date(new java.util.Date().getTime()+90*SH.getTimeDay()));
	}
	if(request.getParameter("deactivateButton") != null){
		Enumeration parnames = request.getParameterNames();
		while(parnames.hasMoreElements()){
			String parname = (String)parnames.nextElement();
			if(parname.startsWith("deactivateuser")){
				String userid = parname.split("\\.")[1];
				User user = User.get(Integer.parseInt(userid));
				user.setStop(new java.util.Date());
				user.saveToDB();
			}
		}
	}
%>
<form name="reportForm" method="POST">
	<%= getTran(request, "web", "lastaccess", sWebLanguage)%>: <%=SH.writeDateField("lastaccess", "reportForm", lastAccess, true, false, sWebLanguage, sCONTEXTPATH) %>
	<input type="submit" name="submitButton" value="<%=getTranNoLink("web", "search", sWebLanguage)%>"/>
	<input type="submit" name="deactivateButton" value="<%=getTranNoLink("web", "desactivate", sWebLanguage)%>"/>

<table width='100%'>
	<tr class='admin'>
		<td><%=getTranNoLink("web", "userid", sWebLanguage)%></td>
		<td><%=getTranNoLink("web", "username", sWebLanguage)%></td>
		<td><%=getTranNoLink("web", "lastaccess", sWebLanguage)%></td>
	</tr>
<%
	Connection conn = MedwanQuery.getInstance().getAdminConnection();
	PreparedStatement ps = conn.prepareStatement(" SELECT MAX(accesstime) maxtime, userid FROM accesslogs, user WHERE accesslogs.userid=users.userid AND users.stop is NULL GROUP BY userid HAVING MAX(accesstime) < ? ");
	ps.setDate(1,new java.sql.Date(SH.parseDate(lastAccess).getTime()));
	
	ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String userid = rs.getString("userid");
			User user = User.get(Integer.parseInt(userid));
			java.util.Date maxtime = rs.getTimestamp("maxtime");
			
			out.println("<tr>");
			out.println("	<td class='admin'><input type='checkbox' checked name='deactivateuser."+userid+"'>"+userid+"</td>");
			out.println("	<td class='admin'>"+user.person.getFullName()+"</td>");
			out.println("	<td class='admin'>"+new SimpleDateFormat("dd/MM/yyyy HH:mm").format(maxtime)+"</td>");
			out.println("</tr>");
		}
	rs.close();
	ps.close();
	conn.close();
%>
</table>
</form>