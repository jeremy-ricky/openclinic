<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="be.fedict.eid.applet.service.Identity"%>
<%@page import="be.fedict.eid.applet.service.Address"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Identity Result Page</title>
</head>
<body>
<h1>Identity Result Page</h1>
<h2>Identity Information</h2>
<img src="/openclinic/photo.jpg" alt="photo"/>
<table>
	<tr>
		<th>Attribute</th>
		<th>Value</th>
	</tr>
	<tr>
		<td>Name</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).name%></td>
	</tr>
	<tr>
		<td>First name</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).firstName%></td>
	</tr>
	<tr>
		<td>Middle name</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).middleName%></td>
	</tr>
	<tr>
		<td>Card Number</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).cardNumber%></td>
	</tr>
	<tr>
		<td>Chip Number</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).chipNumber%></td>
	</tr>
	<tr>
		<td>Card Validity Date Begin</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).cardValidityDateBegin
									.getTime()%></td>
	</tr>
	<tr>
		<td>Card Validity Date End</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).cardValidityDateEnd
									.getTime()%></td>
	</tr>
	<tr>
		<td>Card Delivery Municipality</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).cardDeliveryMunicipality%></td>
	</tr>
	<tr>
		<td>National Number</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).nationalNumber%></td>
	</tr>
	<tr>
		<td>Nationality</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).nationality%></td>
	</tr>
	<tr>
		<td>Place Of Birth</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).placeOfBirth%></td>
	</tr>
	<tr>
		<td>Date Of Birth</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).dateOfBirth
									.getTime()%></td>
	</tr>
	<tr>
		<td>Gender</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).gender%></td>
	</tr>
	<tr>
		<td>Document Type</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).documentType%></td>
	</tr>
	<tr>
		<td>Special Status</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).specialStatus%></td>
	</tr>
	<tr>
		<td>Noble Condition</td>
		<td><%=((Identity) session.getAttribute("eid.identity")).nobleCondition%></td>
	</tr>
	<tr>
		<td>Street and number</td>
		<td><%=((Address) session.getAttribute("eid.address")).streetAndNumber%></td>
	</tr>
	<tr>
		<td>ZIP</td>
		<td><%=((Address) session.getAttribute("eid.address")).zip%></td>
	</tr>
	<tr>
		<td>Municipality</td>
		<td><%=((Address) session.getAttribute("eid.address")).municipality%></td>
	</tr>
</table>
</body>
</html>