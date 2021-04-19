<%@page import="be.openclinic.finance.Wicket"%>
<%@page import="be.openclinic.finance.Insurance"%>
<%@page import="be.presis.InsuredPerson"%>
<%@page import="org.dom4j.*,
				org.apache.commons.httpclient.*,
				org.apache.commons.httpclient.methods.*,
				java.util.*"%>
<%@include file="/includes/helper.jsp"%>


<%
	Connection conn = MedwanQuery.getInstance().getAdminConnection();
	String sql = "SELECT admin.personid, MAX(admin.personid) as 'somme', lastname, firstname, dateofbirth, gender, telephone FROM admin, adminprivate";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String personid = rs.getString("admin.personid");
		String lastname = rs.getString("lastname");
		String firstname = rs.getString("firstname");
		String dateofbirth = rs.getString("dateofbirth");
		String gender = rs.getString("gender");
		String telephone = rs.getString("telephone");
		String totalId = rs.getString("somme");
		System.out.println("Nombre total de patients retrouvés:"+totalId);
	}
	
	rs.close();
	ps.close();
	conn.close();
%>

<%
	// Creer un client qui va se connecter sur le serveur
	HttpClient client = new HttpClient();
	// URL auquel on veut se connecter avec le client Http
	//String url = "http://localhost/openclinic/academy/api/patient.jsp";
	String url = "http://192.168.1.77/openclinic/newapi/patient.jsp";
	// Creer methode qui contient les parametres de connexion (ex. URL et parametres)
	PostMethod method = new PostMethod(url);
	// Ajouter a la mothode les parametres
	Vector<NameValuePair> vNvp = new Vector<NameValuePair>();
	vNvp.add(new NameValuePair("action","find"));
	// On peut essayer de recuperer tous les patients dont leurs firstname commence par qlq chose
	//vNvp.add(new NameValuePair("firstname","%"));
	vNvp.add(new NameValuePair("lastname","frank"));
	NameValuePair[] nvp = new NameValuePair[vNvp.size()];
	vNvp.copyInto(nvp);
	method.setQueryString(nvp);
	// Executer la methode en utulisant le client Http
	client.executeMethod(method);
	// Recuperer la reponse du serveur qui est stockee dans la methode
	String sResponse = method.getResponseBodyAsString();
	//System.out.println(sResponse);
	// On doit transformer la reponse recue en un document XML
	Document document = DocumentHelper.parseText(sResponse);
	Element root = document.getRootElement();
		if(root.element("error")!=null){
			Iterator iErrors = root.elementIterator("error");
			while(iErrors.hasNext()){
				Element eError = (Element)iErrors.next();
				System.out.println("ERROR! Code="+eError.attributeValue("id")+
						" Message="+eError.getText());
			}
		}else{
			Iterator iPatients = root.elementIterator("patient");
			while(iPatients.hasNext()){
				try{
					Element ePatient = (Element)iPatients.next();
					
					String sLastname = ePatient.elementText("lastname");
					String sFirstname = ePatient.elementText("firstname");
					String sDateofBirth = ePatient.elementText("dateofbirth");
					String sGender = ePatient.elementText("gender");
					
					List patients = AdminPerson.getAllPatients("", "", "", sLastname, sFirstname, sDateofBirth, "", "");
					
					boolean bPatientExists = false;
					if(patients.size()>0){
						Iterator i = patients.iterator();
						while(i.hasNext()){
							AdminPerson existingPatient = (AdminPerson)i.next();
							if(existingPatient.lastname.equalsIgnoreCase(sLastname) 
									&& existingPatient.firstname.equalsIgnoreCase(sFirstname) || existingPatient.dateOfBirth.equalsIgnoreCase(sDateofBirth)){
								bPatientExists = true;
								System.out.println("Le patient existe deja !");
								break;
							}
						}
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	
%>

<%
	try{
	Connection con = MedwanQuery.getInstance().getOpenclinicConnection();
	String sqls = "SELECT adminview.personid, MAX(adminview.personid) as 'somme', lastname, firstname, dateofbirth, gender, telephone, dateEnd"+
				 " FROM adminview, privateview, healthrecord";
	
	String resultString = "ID de la Personne;Nom de famille;Prénom;Date de Naissance;Sexe;Numéro de téléphone\n";
	PreparedStatement pst = con.prepareStatement(sqls);
	ResultSet rst = pst.executeQuery();
		while(rst.next()){
			resultString=resultString+rs.getString("adminview.personid")+";"+
					rs.getString("lastname")+";"+
					rs.getString("firstname")+";"+
					rs.getString("dateofbirth")+";"+
					rs.getString("gender")+";"+
					rs.getString("dateEnd")+";"+
					rs.getString("telephone")+
							"\n";
		}
	rst.close();
	pst.close();
	con.close();
	String sFileName = "personalRepport.csv";
	// Envoyer le contenu comme un document csv 
	response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "Attachment;Filename=\""+sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
    byte[] resultBytes = resultString.getBytes();
    	for(int n=0;n<resultBytes.length;n++){
    		os.write(resultBytes[n]);
    	}	
    	os.flush();
    	os.close();
	}catch(Exception e){
		System.out.println("Le message d'erreur: "+e.getMessage());
		e.printStackTrace();
	}
%>

