<%@page import="java.io.*,com.itextpdf.text.*,com.itextpdf.text.pdf.*" %>
<%@include file="/includes/validateUser.jsp"%>
<%
	//Creer un nouveau document PDF 
	com.itextpdf.text.Document doc = new com.itextpdf.text.Document();
	//Preparer un outputStream pour le contenu du document
	ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
	//Rediger le contenu du document vers le outputStream
	PdfWriter docWriter = PdfWriter.getInstance(doc, baosPDF);
	
	// Genener le contenu du document
	//Specifier la taille du document
	doc.setPageSize(PageSize.A4.rotate());
	//Ouvrir le document
	doc.open();
	//Creer une table de 100 colonnes que nous allons poser sur le document
	PdfPTable table = new PdfPTable(100);
	
	String datebegin = request.getParameter("begindate");
	String dateend = request.getParameter("enddate");
	String service = request.getParameter("service");
	java.util.Date dBegin = SH.parseDate(datebegin);
	java.util.Date dEnd = SH.parseDate(dateend);
	
	Connection conn = MedwanQuery.getInstance().getOpenclinicConnection();
	PreparedStatement ps = conn.prepareStatement("SELECT OC_DEBET_DATE, OC_PRESTATION_DESCRIPTION, OC_DEBET_AMOUNT+OC_DEBET_INSURARAMOUNT AMOUNT"+
			 	 " FROM AdminView, OC_ENCOUNTRS, OC_PRESTATIONS,OC_DEBETS"+
			 	 " WHERE personid=oc_encounter_patientuid AND REPLACE(oc_debet_encounteruid,'1.','')=oc_encounter_objectid"+
			 	 " AND REPLACE(oc_debet_prestationuid,'1.','')=oc_prestation_objectid"+
			 	 " AND oc_debet_date>=? AND oc_debet_date<? AND oc_debet_serviceuid=?");
	
		ps.setDate(1,new java.sql.Date(dBegin.getTime()));
		ps.setDate(2,new java.sql.Date(dEnd.getTime()));
		ps.setString(3,service);
	
		//Creer une cellule de 30 colonnes pour le prenom
		PdfPCell cell = new PdfPCell(new Paragraph("DATE"));
		cell.setColspan(30);
		table.addCell(cell);
		
		//Creer une cellule de 30 colonnes pour le prenom
		cell = new PdfPCell(new Paragraph("PRESTATION"));
		cell.setColspan(35);
		table.addCell(cell);
		
			//Creer une cellule de 30 colonnes pour le prenom
			cell = new PdfPCell(new Paragraph("VALEUR"));
			cell.setColspan(35);
			table.addCell(cell);
			double TotalG=0;	
			ResultSet rs = ps.executeQuery();
				while(rs.next()){
					//Creer une cellule de 30 colonnes pour le prenom
					cell = new PdfPCell(new Paragraph(rs.getString("OC_DEBET_DATE")));
					cell.setColspan(30);
					table.addCell(cell);
					
					//Creer une cellule de 30 colonnes pour le prenom
					cell = new PdfPCell(new Paragraph(rs.getString("OC_PRESTATION_DESCRIPTION")));
					cell.setColspan(35);
					table.addCell(cell);
					
					//Creer une cellule de 30 colonnes pour le prenom
					cell = new PdfPCell(new Paragraph(rs.getString("AMOUNT")));
					cell.setColspan(35);
					table.addCell(cell);
				TotalG += (Double.parseDouble(rs.getString("AMOUNT")));
				}
	
				//Creer une cellule de 30 colonnes pour le prenom
				cell = new PdfPCell(new Paragraph("TOTAL GENERAL"));
				cell.setColspan(65);
				table.addCell(cell);
				
				//Creer une cellule de 30 colonnes pour le prenom
				cell = new PdfPCell(new Paragraph(TotalG+" FBU"));
				cell.setColspan(30);
				table.addCell(cell);
	
			//Inserer la table dans le document
			
			doc.add(table);
			//Cloturer le document
			doc.close();
			docWriter.close();
			//Envoyer le contenu du document au navigateur
			String sFileName = "testPDF.pdf";
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "inline; filename=\""+sFileName+"\"");
			ServletOutputStream os = response.getOutputStream();
			baosPDF.writeTo(os);
			os.flush();
			os.close();
	
%>