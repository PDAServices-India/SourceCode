<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.aircell.model.UserDetails" %>
 <%@include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ESB Simulator | Create User</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
</head>
<body class="inner">
<div id="wrap">
  <div id="header">
    <div class="logo"><a href="index.html">Logo</a></div>
    <div id="navTop">
      <ul>
        <li><a href="${flowExecutionUrl}&_eventId=logOff">Sign Out</a></li>
        <li><a href="#">Help?</a></li>
      </ul>
    </div> 
</div>
</div>

<div id="wrapper">
    <div id="primary">
      <h2><span><a href="${flowExecutionUrl}&_eventId=viewUser">Administrator</a></span></h2>
        <div id="container">
        <div id="menublock">
          <ul>
            <li><a class="create" href="${flowExecutionUrl}&_eventId=createUser">Create User</a></li>
            <li><a class="edit" href="${flowExecutionUrl}&_eventId=editUser">Edit User</a></li>
             <li><a class="" href="#">Delete User</a></li>
            <li><a class="" href="#">View User</a></li>
          </ul> 
        </div>
      </div>
       <h2><span><a href="viewCatalogue.do">Product Catalog</a></span></h2>
        <h2><span><a href="">Image Repository</a></span></h2>
         <h2><span><a href="">PromoCode</a></span></h2>
          <h2><span><a href="">Security Question</a></span></h2>
      </div>

	<div id="secondary">
	<div id="bodyContainer">
	<form method="post">
		<table>
			<!-- <tr><td colspan="2"><b style="color:red"><form:errors path="userDetails.role" cssClass="errors" /></b></td></tr> -->
			<tr>
				<td>User Name: </td>
				<td><input type="text" name="username" id="username" /></td>	
			</tr>
			<tr>
			<td colspan="2"><b style="color:red"><form:errors path="userDetails.username" cssClass="errors" /></b></td>
			</tr>
			<tr>
				<td>E-mail Address: </td>
				<td><input type="text" name="email" id="email"/></td>
			</tr>
			<tr><td colspan="2"><b style="color:red"><form:errors path="userDetails.email" cssClass="errors" /></b></td></tr>
			<tr>
				<td>Role: </td>
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
				<td><input type="submit" name="_eventId_Create" value="Create"/></td>
				<td><input type="reset" name="_eventId_Clear" value="Clear"/></td>
			</tr>
		</table>
	</form>
	</div>
	 <div class="clear"></div>
  </div>
  <div id="footer">
    <p><a href="#">Privacy Policy</a> | <a href="#">Terms &amp; Conditions</a> <br />
      &copy; Copyright 2010. All rights reserved.</p>
  </div>
</div>
</body>
</html>