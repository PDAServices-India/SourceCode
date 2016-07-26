<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.pda.cmp.model.LoginDetails" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Appl.css" />
<title>Success</title>
</head>
<%!UserDetails userDetails; %>
<% System.out.println("Inside welcome page:"+session.getAttribute("uname")); 
   System.out.println("Role From Session: "+session.getAttribute("role"));
%>
<body id="lbody">

<div id="fdiv">
	<div id="header">
			<h3>Application Home Page</h3>
	</div>
	<div id="sidebar">
		<% if(session.getAttribute("role").equals("Admin")){ %>
		<table>
		<tr>
		<th><a href="${flowExecutionUrl}&_eventId=viewUser">Administrator</a></th></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=createUser">CreateUser</a></td></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=editUser">EditUser</a></td></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=logOff">LogOff</a></td></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=viewProductCatalogue">ProductCatalogue</a></td></tr>
		</table>
		<%}
		if(session.getAttribute("role").equals("Moderator")){ %>
		<table>
		<tr>
		<th><a href="${flowExecutionUrl}&_eventId=viewUser">Moderator</a></th></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=editUser">EditUser</a></td></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=logOff">LogOff</a></td></tr>
		</table>
		<%}
		if(session.getAttribute("role").equals("Guest")) { %>
		<table>
		<tr>
		<th><a href="${flowExecutionUrl}&_eventId=viewUser">Guest</a></th></tr>
		<tr><td><a href="${flowExecutionUrl}&_eventId=logOff">LogOff</a></td></tr>
		</table>
		<%} %>
	</div>
	<div id="content">
		<h3>Aircell LLC</h3>
	</div>
</div>

</body>
</html>