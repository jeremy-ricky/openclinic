<%@include file="/includes/validateUser.jsp"%>
<%
	Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
	String sql = "SELECT OC_INSURAR_NAME AS 'Assurreur',SUM(oc_debet_insuraramount) AS 'Total'"+
				 " FROM oc_insurars,oc_debets,oc_insurances"+
				 " WHERE REPLACE(OC_DEBET_INSURANCEUID,'1.','')=OC_INSURANCE_OBJECTID AND"+
				 " REPLACE(OC_INSURANCE_INSURARUID,'1.','')=OC_INSURAR_OBJECTID AND"+
				 " OC_DEBET_SERVICEUID='CL.LAB' GROUP BY OC_INSURAR_NAME";
	
	String resultString = "Total;Assureur\n";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
		while(rs.next()){
			//out.println(rs.getDouble("Total") +";"+ rs.getString("Assurreur"));
			resultString = resultString+rs.getDouble("Total") +";"+ rs.getString("Assurreur")+"\n";
		}
	rs.close();
	ps.close();
	conn.close();
	String sFileName = "financialRepport.csv";
	// Envoyer le contenu comme un document csv 
	response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "Attachment;Filename=\""+sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
    byte[] resultBytes = resultString.getBytes("ISO-8859-1");
    
    	for(int n=0;n<resultBytes.length;n++){
    		os.write(resultBytes[n]);
    	}
    		
    	os.flush();
    	os.close();
%>