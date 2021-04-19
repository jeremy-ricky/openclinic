<%@page import="org.dom4j.*,
				org.apache.commons.httpclient.*,
				org.apache.commons.httpclient.methods.*,
				java.util.*"%>
<%@include file="/includes/helper.jsp"%>

<%
	// Creer un client qui va se connecter sur le serveur
	HttpClient client = new HttpClient();
	// URL auquel on veut se connecter avec le client Http
	//String url = "http://localhost/openclinic/academy/api/patient.jsp";
	String url = "http://192.168.1.77/academy/academy/api/patient.jsp";
	// Creer methode qui contient les parametres de connexion (ex. URL et parametres)
	PostMethod method = new PostMethod(url);
	// Ajouter a la mothode les parametres
	Vector<NameValuePair> vNvp = new Vector<NameValuePair>();
	vNvp.add(new NameValuePair("action","find"));
	// On peut essayer de recuperer tous les patients dont leurs firstname commence par qlq chose
	//vNvp.add(new NameValuePair("firstname","%"));
	vNvp.add(new NameValuePair("personid","9966"));
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
					// Code specifique pour l'application a partir d'ici
					String sLastname = ePatient.elementText("lastname");
					String sFirstname = ePatient.elementText("firstname");
					String sDateofBirth = ePatient.elementText("dateofbirth");
					String sGender = ePatient.elementText("gender");
					
					Connection conn = MedwanQuery.getInstance().getAdminConnection();
					String sql = "SELECT * FROM admin WHERE 1=1";
					if(sLastname.length()>0){
						sql+=" AND lastname=?";
					}
					if(sFirstname.length()>0){
						sql+=" AND firstname=?";
					}
					if(sDateofBirth.length()>0){
						sql+=" AND dateofbirth=?";
					}
					if(sGender.length()>0){
						sql+=" AND gender=?";
					}
					/*
					On peut utiliser cet code aulieu de faire nos requette manuelement 
					List patients = AdminPerson.getAllPatients("", "", "", sLastname, sFirstname, sDateofBirth, "", "");
					
					boolean bPatientExists = false;
					if(patients.size()>0){
						Iterator i = patients.iterator();
						while(i.hasNext()){
							AdminPerson existingPatient = (AdminPerson)i.next();
							if(existingPatient.gender.equalsIgnoreCase(sGender)){
								bPatientExists = true;
								break;
							}
						}
					}
					*/
					PreparedStatement ps = conn.prepareStatement(sql);
					int nPar=1;
					if(sLastname.length()>0){
						ps.setString(nPar++, sLastname);
					}
					if(sFirstname.length()>0){
						ps.setString(nPar++, sFirstname);
					}
					if(sDateofBirth.length()>0){
						ps.setDate(nPar++, new java.sql.Date(SH.parseDate(sDateofBirth).getTime()));
					}
					if(sGender.length()>0){
						ps.setString(nPar++, sGender);
					}
					
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						// Do nothing
						System.out.println("API message: patient "+sLastname+", "+sFirstname+" existe deja !!!");
					}else{
						// Inserer patient dans la base de donnee
						System.out.println("API message: patient "+sLastname+", "+sFirstname+" n'existe pas dans ma BD !!!");
						
						AdminPerson newPatient = new AdminPerson();
						newPatient.lastname = sLastname;
						newPatient.firstname = sFirstname;
						newPatient.dateOfBirth = sDateofBirth;
						newPatient.gender = sGender;
						newPatient.language = ePatient.element("language").attributeValue("code");
						newPatient.updateuserid = "4";
						newPatient.sourceid = "1";
						
							if(newPatient.store()){
								System.out.println("API message: patient "+sLastname+", "+sFirstname+" a ete bien ajoute dans ma BD !!!");		
							}
			
					}
					rs.close();
					ps.close();
					conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	
%>