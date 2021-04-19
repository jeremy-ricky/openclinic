<%@include file="/includes/helper.jsp"%>
<%@page import="org.dom4j.*"%>
<%!
	//D�claration de m�thodes propres � la page jsp
	
	void sendError(Element root, String errorCode,String errorMessage){
		Element error = root.addElement("error");
		error.setAttributeValue("id", errorCode);
		error.setText(errorMessage);
	}
%>
<%
	Document document = DocumentHelper.createDocument();
	Element root = document.addElement("message");
	// Retrouver le param�tre action pour savoir ce qu'il faut faire
	// Les valeurs possibles sont "find", "add" ou "update"
	String action = SH.c(request.getParameter("action"));

	if(action.equalsIgnoreCase("find")){
		//action = find. R�cup�rer les crit�res sur base desquels des patients
		// doivent �tre cherch�s
		String sPersonid = SH.c(request.getParameter("personid"));
		String sLastname = SH.c(request.getParameter("lastname"));
		String sFirstname = SH.c(request.getParameter("firstname"));
		String sDateOfBirth = SH.c(request.getParameter("dateofbirth"));
		
		if((sPersonid+sLastname+sFirstname+sDateOfBirth).length()==0){
			sendError(root,"002","Aucun crit�re sp�cifi�");
		}
		else{
			List patients = AdminPerson.getAllPatients("", "", "", sLastname, sFirstname, sDateOfBirth, sPersonid, "");
			Iterator iPatients = patients.iterator();
			while(iPatients.hasNext()){
				AdminPerson patient = (AdminPerson)iPatients.next();
				patient = AdminPerson.get(patient.personid);
				//Cr�er un nouvel �l�ment patient
				Element ePatient = root.addElement("patient");
				//Mettre le personid comme attribut de l'�l�ment patient
				ePatient.setAttributeValue("personid", patient.personid);
				//Ins�rer les �l�ments lastname, firstname et dateofbirth dans l'�l�ment patient
				ePatient.addElement("lastname").setText(patient.lastname);
				ePatient.addElement("firstname").setText(patient.firstname);
				ePatient.addElement("gender").setText(patient.gender);
				ePatient.addElement("dateofbirth").setText(patient.dateOfBirth);
				Element eLanguage=ePatient.addElement("language");
				eLanguage.setAttributeValue("code", patient.language);
				eLanguage.setText(getTranNoLink("web.language",patient.language,"en"));
				
				AdminPrivateContact apc = patient.getActivePrivate();
				//Ins�rer un �l�ment address qui contient les coordonn�es du patient
				Element eAddress = ePatient.addElement("address");
				eAddress.addElement("address").setText(apc.address);
				eAddress.addElement("city").setText(apc.city);
				eAddress.addElement("province").setText(apc.province);
				eAddress.addElement("telephone").setText(apc.telephone);
				eAddress.addElement("mobile").setText(apc.mobile);
				eAddress.addElement("email").setText(apc.email);
				Element eCountry=eAddress.addElement("country");
				eCountry.setAttributeValue("code", apc.country);
				eCountry.setText(getTranNoLink("country",apc.country,"en"));
			}
		}
	}
	else if(action.equalsIgnoreCase("add")){
		
	}
	else if(action.equalsIgnoreCase("update")){
		
	}
	else{
		sendError(root,"001","Action '"+action+"': action inconnue");
	}

	String sFileName="api.xml";
	response.setContentType("application/xml");
    response.setHeader("Content-Disposition", "inline; filename=\""+
    					sFileName+"\"");
    ServletOutputStream os = response.getOutputStream();
	byte[] b = document.asXML().getBytes("utf-8");
	for(int n=0;n<b.length;n++){
		os.write(b[n]);
	}
    os.flush();
	os.close();
%>