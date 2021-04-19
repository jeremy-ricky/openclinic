<%@page import="java.io.*,com.itextpdf.text.*,com.itextpdf.text.pdf.*"%>
<%@include file="/includes/validateUser.jsp"%>

<%
	//Cr�er un nouveau document PDF	
	com.itextpdf.text.Document doc = new com.itextpdf.text.Document();
	//Pr�parer un outputStream pour le contenu du document
	ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
	//Rediriger le contenu du document vers le outputStream
	PdfWriter docWriter = PdfWriter.getInstance(doc,baosPDF);

	//G�n�rer le contenu du document
	//Sp�cifier la taille du document
	doc.setPageSize(PageSize.A4);
	//Ouvrir le document
	doc.open();
	//Cr�er une table de 100 colonnes que nous allons poser sur le document
	PdfPTable table = new PdfPTable(100);
	
	Connection conn = MedwanQuery.getInstance().getAdminConnection();
	PreparedStatement ps = conn.prepareStatement("select * from admin");
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		//Cr�er une cellule de 30 colonnes pour le pr�nom
		PdfPCell cell = new PdfPCell(new Paragraph(rs.getString("firstname")));
		cell.setColspan(30);
		table.addCell(cell);
		//Cr�er une cellule de 50 colonnes pour le nom
		cell = new PdfPCell(new Paragraph(rs.getString("lastname")));
		cell.setColspan(50);
		table.addCell(cell);
		//Cr�er une cellule de 20 colonnes pour la date de naissance
		cell = new PdfPCell(new Paragraph(SH.formatDate(rs.getDate("dateofbirth"))));
		cell.setColspan(20);
		table.addCell(cell);
	}
	rs.close();
	ps.close();
	conn.close();
	
	//Ins�rer la table dans le document
	doc.add(table);
	//Cl�turer le document
	doc.close();
	//Cl�turer le PDFWriter pour rendre disponible le ByteArrayOutputStream
	docWriter.close();
	
	//Envoyer le contenu du document au navigateur du client
	String sFileName="testPDF.pdf";
	response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "inline; filename=\""+
    					sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
    baosPDF.writeTo(os);
    os.flush();
	os.close();
	

%>