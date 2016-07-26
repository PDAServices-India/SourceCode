<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.aircell.model.UserDetails" %>
 <%@include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ESB Simulator</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/menu.css" rel="stylesheet" type="text/css" />
</head>
<%!UserDetails userDetails; %>

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
       <h2><span><a href="viewCatalogue.do">Product Catalog</a></span></h2>
        <h2><span><a href="">Image Repository</a></span></h2>
         <h2><span><a href="">PromoCode</a></span></h2>
          <h2><span><a href="">Security Question</a></span></h2>
      <div id="container">
        <div id="menublock">
         <!-- <ul>
            <li><a class="create" href="${flowExecutionUrl}&_eventId=createUser">Create User</a></li>
            <li><a class="edit" href="${flowExecutionUrl}&_eventId=editUser">Edit User</a></li>
             <li><a class="" href="#">Delete User</a></li>
            <li><a class="" href="#">View User</a></li>
          </ul> -->
        </div>
      </div>
    </div>
    <div id="secondary">
  	 <center> <h1> ESB SIMULATOR </h1></center>
      <!--<h2><span>View User</span></h2>
      <div id="bodyContainer">
        <form id="viewAccount" method="post" action="/UserManagement/create.do" >
          <table width="100%" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <th width="14%" align="left" scope="col">First Name</th>
              <th width="15%" align="left" scope="col">Last Name</th>
              <th width="16%" align="left" scope="col">User Name</th>
              <th width="22%" align="left" scope="col">Email</th>
              <th width="11%" align="left" scope="col">Gender</th>
              <th width="11%" align="left" scope="col">Status</th>
              <th width="11%" align="left" scope="col">Change Status</th>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
            <tr>
              <td>Karthikeyan</td>
              <td>Karuppusamy</td>
              <td>Karthikeyan.K</td>
              <td>karthik.k2@excelacom.in</td>
              <td>Male</td>
              <td>Active</td>
              <td><a href="#">De-active</a></td>
            </tr>
          </table>
        </form>
      </div>
    </div>-->
    <div class="clear"></div>
  </div>
  <div id="footer">
    <p><a href="#">Privacy Policy</a> | <a href="#">Terms &amp; Conditions</a> <br />
      &copy; Copyright 2010. All rights reserved.</p>
  </div>
</div>
</body>
</html>
