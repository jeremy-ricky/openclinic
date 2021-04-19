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
	
	PdfPTable table = new PdfPTable(100);
	//PdfPCell cell = new PdfPCell(new Paragraph("Cellule 1\nDeuxieme ligne", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	PdfPCell cell = new PdfPCell(new Paragraph("Cellule 1\nDeuxieme ligne", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	cell.setColspan(30);
	//cell.setBorder(PdfPCell.NO_BORDER);
	table.addCell(cell);
	
	cell = new PdfPCell(new Paragraph("Cellule 2", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	cell.setColspan(50);
	table.addCell(cell);
	
	cell = new PdfPCell(new Paragraph("Cellule 3", FontFactory.getFont("Agency FB",10,Font.BOLD,BaseColor.BLACK)));
	cell.setColspan(20);
	table.addCell(cell);
	
	doc.add(table);
	doc.close();
	docWrite.close();
	// ==========================================================
	String sFileName = "testPDF.pdf";
	response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "iniline;Filename=\""+
    					sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
	baosPDF.writeTo(os);
	os.flush();
	os.close();
%>