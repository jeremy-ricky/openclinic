
<%@include file="/includes/validateUser.jsp"%>

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
				<%=SH.writeSelect(request, "ITEM_TYPE_SELECTSERVICE", "", sWebLanguage) %>
				<select name="service">
                       <%
                          try {
                        	  Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
                              String req = "SELECT serviceid FROM servicesview";
                              Statement stm = conn.createStatement();
                              ResultSet rs = stm.executeQuery(req);
                                 while(rs.next()){
                        %>
                                    <option><%=rs.getString("serviceid")%></option>         
                        <%
                                  }

                             } catch (Exception ex) {
                                 System.out.println("Erreur de generation de rapport" + ex.getMessage());
                                 ex.printStackTrace();
                             }
                        %>
                   </select>
                <input class='button' type="submit" name="submitButton" value="Generer rapport"/>
			</td>
		<tr>
			
		</tr>
			
		</tr>
		
	</table>
</form>
