<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.pda.model.LoginDetails"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Restore Page</title>
</head>

<%
	System.out.println("Enetered Into pwdrestorepage JSP @@@@@");
	LoginDetails responseData1 = (LoginDetails)request.getAttribute("loginFormObject");
	System.out.println("UserName:  "+responseData1.getUsername()+" New Password: "+responseData1.getPasswordNew());  
%>
<body>
<center>
	<h1> Password Restore Page </h1>
	<br/>
	<form method="post">
		<table width="32%" border="1">
			<tr>
				<td align="center" bgcolor="lightblue">Login</td>
			</tr>
			<tr>
				<td>
					<table border="0" width="100%">
						<tr>
							<td width="33%" align="right">User Name: </td>
							<td width="66%" align="left">
								<input readonly="readonly"<% if(request.getAttribute("loginFormObject")!=null){%> value="<%=responseData1.getUsername()%>" <% } %> type="text" value="username" id="username"/>		
							</td>
						</tr>
						<tr>
							<td width="33%" align="right">Password: </td>
							<td width="66%" align="left">
								<input type="password" name="passwordnew" id="passwordnew" value=""/>
							</td>
						</tr>
						<tr><td colspan="2"><b style="color:red"><form:errors path="loginDetails.passwordnew" cssClass="errors" /></b></td></tr>
						<tr>
							<td width="33%" align="right">Confirm Password: </td>
							<td width="66%" align="left">
								<input type="password" name="passwordconfirm" id="passwordconfirm" value=""/>
							</td>
						</tr>
						<spring:hasBindErrors name="loginDetails">
						<tr><td colspan="2"><b style="color:red"><form:errors path="loginDetails.passwordconfirm" cssClass="errors" /></b></td></tr>
						</spring:hasBindErrors>
						<tr>
							<td align="center" colspan="2">
								<input type="submit" value="Update" name="_eventId_Update"/>
								<input type="reset" value="Clear" name="_eventId_Clear"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>