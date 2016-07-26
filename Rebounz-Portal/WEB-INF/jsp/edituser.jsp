<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jsp/include.jsp" %>
<%@ page import="com.aircell.model.EditUname" %>
<%@ page import="com.aircell.model.UserDetails" %>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Appl.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<script type="text/javascript" language="javascript">
function getUsername()
{
	var index;
	var data;
	var flowExecutionUrl;
	alert("inside");	
	index=document.getElementById("username");
	data=document.getElementById("username").options[index.selectedIndex].text;
	alert("Data :"+data);
	document.location.href="${flowExecutionUrl}&_eventId=getUsernameList&username="+data;
	alert("Outside");
}
</script>

<%! UserDetails getFullUserDetails;
	EditUname getUserDetails; %>
	<%
		System.out.println("Entered Into JSP !!!!!!!!!!!!");
		ArrayList<Object> unameList=new ArrayList<Object>();
		ArrayList<Object> fullvalueList=new ArrayList<Object>();
		if(request.getAttribute("fullDetails")!=null )
		{
		fullvalueList=(ArrayList<Object>)request.getAttribute("fullDetails");	
		System.out.println("Full Value List Condition working & full value list::: "+fullvalueList);
		getFullUserDetails = (UserDetails)fullvalueList.get(0);
		System.out.println("emial value in jsp:"+getFullUserDetails.getEmail());
		}
		unameList=(ArrayList<Object>)request.getAttribute("uname");
		System.out.println("Arraylist for User Name:"+unameList);
	%>
	
<body >
	<form method="post">
		<table>
			<tr>
				<td>User Name</td>
				<td>
					<select name="username" id="username" onchange="getUsername()">
						<option>Select</option>
						<% for(int i=0;i<unameList.size();i++) { 
							getUserDetails = (EditUname)unameList.get(i);
						%><option <%if(request.getAttribute("fullDetails")!=null && getFullUserDetails.getUsername().equalsIgnoreCase(getUserDetails.getUsername())) {%>SELECTED <% } %> ><%=getUserDetails.getUsername() %></option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>E-mail Address</td>
				<td><input <%if(request.getAttribute("fullDetails")!=null && fullvalueList==request.getAttribute("fullDetails")) { %> value="<%=getFullUserDetails.getEmail() %>"<%} %>type="text" name="email" id="email" value=""/>
				</td>
			</tr>
					<tr><td colspan="2"><b style="color:red"><form:errors path="userDetails.email" cssClass="errors" /></b></td></tr>
			<tr>
				<td>Role</td>
				<td>
					<select name="role" id="role">
						<option>Select</option>
						<option>Admin</option>
						<option>Moderator</option>
						<option>Guest</option>
					</select>
				</td>
				<td colspan="2"><b style="color:red"><form:errors path="userDetails.role" cssClass="errors" /></b></td>
				
			</tr>
			<tr>
				<td><input type="submit" name="_eventId_Edit" value="Edit"></td>
				<td><input type="reset" name="_eventId_Cancel" value="Cancel"></td>
			</tr>
		</table>
	</form>
</body>
</html>