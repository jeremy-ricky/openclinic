<%@include file="/includes/helper.jsp"%>
<%@page import="org.dom4j.*"%>
<%!
	// Declaration d'une methode qui va generer l'erreur chaque fois il y a erreur
	void sendError(Element root, String errorCode, String errorMessage){
		Element error = root.addElement("error");
		error.setAttributeValue("id", errorCode);
		error.setText(errorMessage);
	}
%>
<%
	Document document = DocumentHelper.createDocument();
	Element root = document.addElement("message");
	// Get action to perform on patient objects
	// Possible values are "find", "add" or "update"
	// SH.c() est une methode qui verifie si le string est vide
	String action = SH.c(request.getParameter("action"));
	
	if(action.equalsIgnoreCase("find")){
		String sPersonid = SH.c(request.getParameter("personid"));
		String sLastname = SH.c(request.getParameter("lastname"));
		String sFirstname = SH.c(request.getParameter("firstname"));
		String sDateOfBirth = SH.c(request.getParameter("dateofbirth"));
		
		// On verifie si on a pas reusi une valeur dans aucun critere de recherche
		if((sPersonid+sLastname+sFirstname+sDateOfBirth).length()==0){
			// Send error message: no search criteria have been specified
			sendError(root, "001", "No search criteria specified");
		}else{
			List patients = AdminPerson.getAllPatients("", "", "", sLastname, sFirstname, sDateOfBirth, sPersonid, "");
			Iterator iPatients = patients.iterator();
			while(iPatients.hasNext()){
				AdminPerson patient = (AdminPerson)iPatients.next();
				patient = AdminPerson.get(patient.personid);
				// Creer un nouvel element patient
				Element ePatient = root.addElement("patient");
				// Mettre le personid comme attribut de l'element patient
				ePatient.setAttributeValue("personid", patient.personid);
				
				// Inserer les elements lastname, firstname et dateofbirth dans l'element patient
				ePatient.addElement("lastname").setText(patient.lastname);
				// On peut utiliser la methode addCDATA pour echaper aux caracteres speciaux
				//ePatient.addElement("lastname").addCDATA(patient.lastname);
				ePatient.addElement("firstname").setText(patient.firstname);
				ePatient.addElement("gender").setText(patient.gender);
				ePatient.addElement("dateofbirth").setText(patient.dateOfBirth);
				
				Element eLanguage = ePatient.addElement("language");
				eLanguage.setAttributeValue("code", patient.language);
				eLanguage.setText(getTranNoLink("web.language", patient.language, "en"));
				// Ajouter les autres donnees administraves personnelles du patient
				AdminPrivateContact apc = patient.getActivePrivate();
				Element eAdress = ePatient.addElement("adress");
				
				eAdress.addElement("adress").setText(apc.address);
				eAdress.addElement("city").setText(apc.city);
				eAdress.addElement("telephone").setText(apc.telephone);
				eAdress.addElement("mobile").setText(apc.mobile);
				eAdress.addElement("email").setText(apc.email);
				eAdress.addElement("country").setText(apc.country);
				
				Element eCountry = eAdress.addElement("country");
				eCountry.setAttributeValue("code", apc.country);
				eCountry.setText(getTranNoLink("country", apc.country, "en"));
				
			}
		}
		
	}else if(action.equalsIgnoreCase("add")){
		
	}else if(action.equalsIgnoreCase("update")){
		
	}else{
		// Send error message: reason = command unknown
		sendError(root, "002", "Action '"+action+"': unknown action");
	}
	//out.println(document.asXML());
	String sFileName = "api.xml";
	response.setContentType("application/xml");
    response.setHeader("Content-Disposition", "inline;Filename=\""+
    					sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
	byte[] b = document.asXML().getBytes("utf-8");
	for(int n=0;n<b.length;n++){
		os.write(b[n]);
	}
	os.flush();
	os.close();
%>