<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.aircell.model.LoginDetails"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ESB Simulator</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.tools.min.js" type="text/javascript"></script>
<script src="js/newsticker.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$(".newsticker").jCarouselLite({
		vertical: true,
		hoverPause:true,
		visible: 1,
		auto:1000,
		speed:2000
	});
});

</script>
</head>
<%
	System.out.println("Enetered Into pwdrestorepage JSP @@@@@");
	LoginDetails responseData1 = (LoginDetails)request.getAttribute("loginFormObject");
	System.out.println("UserName: "+responseData1.getUsername()+" New Password: "+responseData1.getPasswordNew());  
%>
<body>
<div id="wrap">
  <div id="topBG"></div>
  <div id="wrapper">
    <div id="banner">
      <div id="animatedLine"></div>
    </div>
    <div id="primary">
      <div>
        <h2>Password Restore</h2>
        <form action="" method="post">
          <div>
            <div class="error"><form:errors path="loginDetails.passwordConfirm" cssClass="errors" /></div>
            <label>User Name: </label>
            <input readonly="readonly" <% if(request.getAttribute("loginFormObject")!=null){%> value="<%=responseData1.getUsername()%>" <% } %> name="username" type="text" id="username" />
			<label>New Password: </label>
			<input name="passwordNew" type="password" id="passwordNew"/>
			<label>Confirm Password: </label>
			<input name="passwordConfirm" type="password" id="passwordConfirm"/>
          </div>
          <input name="_eventId_Update" type="image" src="images/nextBtn.png" class="Btn" id="Update" value="Next" />
          <input name="_eventId_Clear" type="image" src="images/cancelBtn.png" class="Btn" id="Cancel" value="Cancel" />
        </form>
      </div>
    </div>
    <div id="secondary">
      <h2>About</h2>
      <div class="newsticker">
        <ul>
          <li>
            <h4>Definitions and scope</h4>
            <p>Commentators[2] disagree over whether to define an Enterprise Service Bus (ESB) as an architectural style, a software product, or a group of software products.<span> <a href="#">Read More...</a></span></p>
          </li>
          <li>
            <h4>ESB architecture</h4>
            <p>Use of the word “bus” stems from the physical bus that carries bits between devices in a computer. The ESB serves an analogous function at a higher level of abstraction.<span> <a href="#">Read More...</a></span></p>
          </li>
          <li>
            <h4>ESB as software</h4>
            <p>In such a complex architecture, the ESB represents the piece of software that lies between the business applications and enables communication among them. Ideally,<span> <a href="#">Read More...</a></span></p>
          </li>
        </ul>
      </div>
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
