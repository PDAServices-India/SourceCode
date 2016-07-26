<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jsp/include.jsp" %>
<%@ page import="com.pda.cmp.model.LoginDetails" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>

<body>
	<center>
	<form  method="post">
		<table width="32%" border="1">
			<tr>
			<td align="center" bgcolor="lightblue">Login</td>
			</tr>
			<tr>
			<td>
				<table border="0" width="100%">
			<tr>
			</tr>
			<tr>
				<td>User Name</td>
				<td>
						<input type="text" name="username" id="username" value="" />
				</td>
			</tr>
			<tr><td colspan="2"><b style="color:red"><form:errors path="loginDetails.username" cssClass="errors" /></b></td></tr>
			<tr>
				<td>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td>
						<input type="password" name="password" id="password"value=""/>		
				</td>
			</tr>
			<tr><td colspan="2"><b style="color:red"><form:errors path="loginDetails.password" cssClass="errors" /></b></td></tr>
			<tr>	
			<td align="center" colspan="1"><input type="submit" name="_eventId_SignIn" value="SignIn" /> </td>
			<td align="center" colspan="2"><input type="reset" name="_eventId_Clear" value="clear" /></td>
			</tr>	
		</table>	
		</td>
		</tr>
		</table>
	</form>
	</center>
</body>
</html>

