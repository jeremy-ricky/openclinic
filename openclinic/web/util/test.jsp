<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="java.net.URI"%>
<%@page import="org.apache.http.client.utils.URIBuilder"%>
<%@page import="org.apache.commons.httpclient.*,org.apache.commons.httpclient.methods.*,be.openclinic.system.*"%>
<%
	HttpClient client = new HttpClient();
	PostMethod method = new PostMethod("https://portal.bulkgate.com/api/1.0/simple/promotional");
	NameValuePair[] nvp = new NameValuePair[7];
	nvp[0]=(new NameValuePair("application_id", "18068"));
	nvp[1]=(new NameValuePair("application_token", "oTSbaGkyvumuI0jk5NbKp6FO8crVU0WG7g8gSwaIX8UClWHG6y"));
	nvp[2]=(new NameValuePair("number","25768350265"));
	nvp[3]=(new NameValuePair("country","bi"));
	nvp[4]=(new NameValuePair("sender_id","gText"));
	nvp[5]=(new NameValuePair("sender_id_value","BulkGate"));
	nvp[6]=(new NameValuePair("text",java.net.URLEncoder.encode("test message","utf-8")));
	method.setQueryString(nvp);
	int statusCode = client.executeMethod(method);
	out.println(statusCode+": "+method.getResponseBodyAsString());

/*
	HttpClient client = new HttpClient();
	PostMethod method = new PostMethod("https://http-api.d7networks.com/send");
	NameValuePair[] nvp = new NameValuePair[6];
	nvp[0]=(new NameValuePair("username", "kbqk2450"));
	nvp[1]=(new NameValuePair("password", "5lwWmg9J"));
	nvp[2]=(new NameValuePair("coding", "0"));
	nvp[3]=(new NameValuePair("from", "OpenClinic"));
	nvp[4]=(new NameValuePair("to","32475621569"));
	nvp[5]=(new NameValuePair("content",java.net.URLEncoder.encode("test","utf-8")));
	method.setQueryString(nvp);
	int statusCode = client.executeMethod(method);
	out.println(statusCode+": "+method.getResponseBodyAsString());
*/
	
%>