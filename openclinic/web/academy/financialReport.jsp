<%@include file="/includes/validateUser.jsp"%>
<%
	String dateDebet = request.getParameter("datebegin");
	java.util.Date dBegin = SH.parseDate(dateDebet);	

	Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
	String sql = "select personid,lastname,firstname,"+
				 " OC_PRESTATION_DESCRIPTION,OC_DEBET_AMOUNT"+
				 " from AdminView,OC_ENCOUNTERS,OC_PRESTATIONS,OC_DEBETS"+
				 " where"+
				 " personid=oc_encounter_patientuid and"+
				 " replace(oc_debet_encounteruid,'1.','')=oc_encounter_objectid and"+
				 " replace(oc_debet_prestationuid,'1.','')=oc_prestation_objectid and"+
				 " oc_debet_date>=? AND oc_debet_date<?";
	String resultString = "ID;NOM;PRENOM;PRESTATION;MONTANT\n";
	PreparedStatement ps = conn.prepareStatement(sql);
	//ps.setDate(1,new java.sql.Date(new java.util.Date().getTime()));
	ps.setDate(1,new java.sql.Date(dBegin.getTime()));
	ps.setTimestamp(2,new java.sql.Timestamp(dBegin.getTime()+SH.getTimeDay()));
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		resultString=resultString+rs.getString("personid")+";"+
				rs.getString("lastname")+";"+
				rs.getString("firstname")+";"+
				rs.getString("oc_prestation_description")+";"+
				rs.getDouble("oc_debet_amount")+
						"\n";
	}
	rs.close();
	ps.close();
	conn.close();
	String sFileName = "financialReport.csv";
	
	//Envoyer le contenu comme un document csv
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "Attachment;Filename=\""+
    					sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
	byte[] resultBytes = resultString.getBytes();
	for(int n=0;n<resultBytes.length;n++){
		os.write(resultBytes[n]);
	}
	os.flush();
	os.close();
%>