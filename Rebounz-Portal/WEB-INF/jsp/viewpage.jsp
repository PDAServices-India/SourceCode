<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.aircell.model.UserDetails"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ESB Simulator | View User</title>
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
      <ul>
            <li><a class="create" href="${flowExecutionUrl}&_eventId=createUser">Create User</a></li>
            <li><a class="edit" href="${flowExecutionUrl}&_eventId=editUser">Edit User</a></li>
      </ul> 
       <h2><span><a href="viewCatalogue.do">Product Catalog</a></span></h2>
        <h2><span><a href="">Image Repository</a></span></h2>
         <h2><span><a href="">PromoCode</a></span></h2>
          <h2><span><a href="">Security Question</a></span></h2>
      <div id="container">
        <div id="menublock">
        </div>
      </div>
    </div>
    <div id="secondary">
    <div id="bodyContainer">
	<form method="post">
	<table align=center width="90%" border="1" cellspacing="2" cellpadding="5" >
	<tr>
	<th> SELECT</th>
	<th> USER NAME </th> 
	<th> EMAIL </th>
	<th> STATUS </th>
	<th> ROLE</th>
	</tr>
	<%
		ArrayList<Object> list=new ArrayList<Object>();
		list=(ArrayList<Object>)request.getAttribute("list");
		
		System.out.println("Arraylist for user details in JSP:"+list);
		for(int i=0;i<list.size();i++)
		{
		System.out.println(list.get(i));
		UserDetails viewUserDetailsBean = (UserDetails)list.get(i);
		System.out.println("Email: "+viewUserDetailsBean.getEmail());
	%>		
	<tr>
	<td width="1">
		<input type="checkbox" name="chkUsername" value='<%=viewUserDetailsBean.getUsername() %>'/>
	</td>
	<td>
		<%=viewUserDetailsBean.getUsername() %>
	</td>
	<td>
		<%=viewUserDetailsBean.getEmail() %>
	</td>
	<td>
		<%=viewUserDetailsBean.getStatus() %>
	</td>
	<td>
		<%= viewUserDetailsBean.getRole() %>
	</td>
	</tr>
<%}%>
</table>
	<input type="submit" name="_eventId_Delete" value="Delete" /> 
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