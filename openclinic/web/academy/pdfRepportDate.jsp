<%@page import="java.io.*,com.itextpdf.text.*,com.itextpdf.text.pdf.*" %>
<%@include file="/includes/validateUser.jsp"%>
<%
	// Creer un nouveau document PDF
	com.itextpdf.text.Document doc = new com.itextpdf.text.Document();
	ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
	PdfWriter docWrite = PdfWriter.getInstance(doc, baosPDF);
	
	// ==========================================================
	doc.setPageSize(PageSize.A4.rotate());
	doc.open();
	
	PdfPTable table = new PdfPTable(5);
	PdfPCell cellID = new PdfPCell(new Paragraph("ID", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellNOM = new PdfPCell(new Paragraph("NOM", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellPRENOM = new PdfPCell(new Paragraph("PRENOM", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellPRESTATION = new PdfPCell(new Paragraph("PRESTATION ", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellMONTANT = new PdfPCell(new Paragraph("MONTANT", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	
	String dateDebet = request.getParameter("datebegin");
	String dateDebet2 = request.getParameter("dateend");
	java.util.Date dBegin = SH.parseDate(dateDebet);
	java.util.Date dEnd = SH.parseDate(dateDebet2);
	
	Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
	String sql = "select personid,lastname,firstname,"+
			 " OC_PRESTATION_DESCRIPTION,OC_DEBET_AMOUNT"+
			 " from AdminView,OC_ENCOUNTERS,OC_PRESTATIONS,OC_DEBETS"+
			 " where"+
			 " personid=oc_encounter_patientuid and"+
			 " replace(oc_debet_encounteruid,'1.','')=oc_encounter_objectid and"+
			 " replace(oc_debet_prestationuid,'1.','')=oc_prestation_objectid and"+
			 " oc_debet_date>=? AND oc_debet_date<?";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	//ps.setDate(1,new java.sql.Date(new java.util.Date().getTime()));
	ps.setDate(1,new java.sql.Date(dBegin.getTime()));
	ps.setDate(2,new java.sql.Date(dEnd.getTime()));
	//ps.setTimestamp(2,new java.sql.Timestamp(dBegin.getTime()+SH.getTimeDay()));
	ResultSet rs = ps.executeQuery();
	
	table.addCell(cellID);
	table.addCell(cellNOM);
	table.addCell(cellPRENOM);
	table.addCell(cellPRESTATION);
	table.addCell(cellMONTANT);
	
	while(rs.next()){
		
		table.addCell(rs.getString(1));
		table.addCell(rs.getString(2));
		table.addCell(rs.getString(3));
		table.addCell(rs.getString(4));
		table.addCell(rs.getString(5));
		
		/*
		PdfPCell cell = new PdfPCell(new Paragraph(rs.getString("personid")));
		cell.setColspan(20);
		table.addCell(cell);
		
		cell = new PdfPCell(new Paragraph(rs.getString("lastname")));
		cell.setColspan(20);
		table.addCell(cell);
		
		cell = new PdfPCell(new Paragraph(rs.getString("firstname")));
		cell.setColspan(20);
		table.addCell(cell);
		
		cell = new PdfPCell(new Paragraph(rs.getString("OC_PRESTATION_DESCRIPTION")));
		cell.setColspan(20);
		table.addCell(cell);
		
		cell = new PdfPCell(new Paragraph(rs.getString("OC_DEBET_AMOUNT")));
		cell.setColspan(20);
		table.addCell(cell); 
		*/
	}
	rs.close();
	ps.close();
	conn.close();
	
	doc.add(table);
	doc.close();
	docWrite.close();
	// ==========================================================
	String sFileName = "testPDF.pdf";
	response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "inline;Filename=\""+
    					sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
	baosPDF.writeTo(os);
	os.flush();
	os.close();
%>