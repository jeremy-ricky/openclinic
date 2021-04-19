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
	PdfPCell cellDate = new PdfPCell(new Paragraph("Dates", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellPrestation = new PdfPCell(new Paragraph("Prestation", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellValeur = new PdfPCell(new Paragraph("Valeur", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cellTotal = new PdfPCell(new Paragraph("Total", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	
	String datebegin = request.getParameter("datebegin");
	String dateend = request.getParameter("dateend");
	String service = request.getParameter("service");
	java.util.Date dBegin = SH.parseDate(datebegin);
	java.util.Date dEnd = SH.parseDate(dateend);
	
	Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
	String sql = "SELECT OC_PRESTATION_CREATETIME AS Dates, OC_PRESTATION_DESCRIPTION AS Prestation, OC_DEBET_AMOUNT AS Valeur"+
			 	 " FROM oc_debets, oc_prestations"+
			 	 " WHERE REPLACE(OC_DEBET_PRESTATIONUID,'1.','')=OC_PRESTATION_OBJECTID"+
			 	 " AND OC_DEBET_DATE>=? AND OC_DEBET_DATE<?"+
			 	 " AND OC_DEBET_SERVICEUID=?";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	//ps.setDate(1,new java.sql.Date(new java.util.Date().getTime()));
	ps.setDate(1,new java.sql.Date(dBegin.getTime()));
	ps.setDate(2,new java.sql.Date(dEnd.getTime()));
	ps.setString(3,service);
	
	ResultSet rs = ps.executeQuery();
	
	table.addCell(cellDate);
	table.addCell(cellPrestation);
	table.addCell(cellValeur);
	
	while(rs.next()){
		
		table.addCell(rs.getString(1));
		table.addCell(rs.getString(2));
		table.addCell(rs.getString(3));
		
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