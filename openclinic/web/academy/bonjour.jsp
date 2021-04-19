<%@include file="/includes/validateUser.jsp"%>
<%
	String contenu = "";
	if(request.getParameter("contenu") != null){
		contenu = request.getParameter("contenu");
	}
%>
<form name="reportForm" method="POST">
	Nom du patient contient : <input type="text" name="contenu" value="<%=contenu%>"/>
	<input type="submit" name="submitButton" value="Executer"/>
</form>
<table width='100%'>
	<tr class='admin'><td colspan="3">Bonjour !</td></tr>
<% 
	
	Connection conn = MedwanQuery.getInstance().getAdminConnection();
	PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE lastname like ?");
	ps.setString(1, "%"+contenu+"%");
	ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String personid = rs.getString("personid");
			String lastname = rs.getString("lastname");
			String firstname = rs.getString("firstname");
			if(lastname.contains(contenu)){
			out.println("<tr><td class='admin'>"+ personid +"</td><td class='admin2'>"+ lastname.toUpperCase()+"</td><td class='admin2'>"+ firstname +"</td></tr>");
			}
		}
		rs.close();
		ps.close();
		conn.close();
%>
</table>