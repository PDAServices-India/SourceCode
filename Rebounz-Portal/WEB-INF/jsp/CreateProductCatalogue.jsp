<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap" %>
<%@page import="com.aircell.model.CreateCatalogueDetails"%>
<%@page import="com.aircell.model.AirlineDetails"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%><html>
<head>
<link rel="stylesheet" type="text/css" href="Appl.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Catalogue Create</title>
</head>
<%
System.out.println("------------Inside createCatalogue jsp!");
ArrayList<Object> taxList=new ArrayList<Object>();
ArrayList<Object> imageList=new ArrayList<Object>();
HashMap<Object,Object> airlineInfoMap=new HashMap<Object, Object>();

taxList=(ArrayList<Object>)request.getAttribute("taxList");
imageList=(ArrayList<Object>)request.getAttribute("imageList");
airlineInfoMap=(HashMap<Object,Object>)request.getAttribute("airlineInfoMap");
Set mapSet=airlineInfoMap.entrySet();
Iterator j=mapSet.iterator();
Map.Entry<Object,Object> mapObject;
System.out.println("------------taxlist:"+taxList);
System.out.println("------------imageList:"+imageList);
System.out.println("------------airlineInfoList:"+airlineInfoMap);
CreateCatalogueDetails imageDetails;
AirlineDetails airlineDetails;
%>
<script type="text/javascript" language="javascript">
function SelectDate()
{
    D = document.getElementById('Date').value;
    if(D){
        D = D.split('/');
    }else{
        Dat = new Date();
        D = new Array(Dat.getDay(), Dat.getMonth(), Dat.getFullYear());
    }
    win = window.open("date-picker.html","win","status=no,scrollbars=no,toolbar=no,menubar=no,height=150,width=150");
    if (parseInt(navigator.appVersion) == 2 && navigator.appName == "Netscape")
        win = window.open("date-picker.html","win","status=yes,height=325,width=250");
        //win'MakeDate',D[2], D[1],D[0], 'SetDate');
        win.MakeDate(D[2], D[1], D[0]);
}
function SetDate(Day, Month, Year)
{
    document.getElementById('Date').value = Day + '/' + Month + '/' + Year;
} 
function getTax()
{
	var data;
	var value;
	var tax1=" <%=taxList.get(0) %> ";
	var tax2=" <%=taxList.get(1) %> ";
	data=document.getElementById("taxCategory").selectedIndex;
	//alert(data);
	value=document.getElementById("taxCategory").options[data].text;
	//alert(value);
	if(value=="Select")
	{
		alert("Select a valid category!");
		document.getElementById("taxPercent").value="";
	}
	else if(value=="Tax1")
	{
		document.getElementById("taxPercent").value=tax1;
	}
	else if(value=="Inclusive")
	{
		document.getElementById("taxPercent").value=tax2;
	}
}
function getImageId()
{
	var imageIndex;
	var imageValue;
	imageIndex=document.getElementById("imageId").selectedIndex;
	//alert(imageIndex);
	imageValue=document.getElementById("imageId").options[imageIndex].text;
	//alert(imageValue);
}
function getAirlineInfo()
{
	var airlineIndex;
	var airlineValue;
	var length=document.getElementById("airlineId").length;
	airlineIndex=document.getElementById("airlineId").selectedIndex;
	//alert(airlineIndex);
	airlineValue=document.getElementById("airlineId").options[airlineIndex].text;
	//alert(airlineValue);
	
	if(airlineValue=="Select")
	{
		alert("Select a valid category!");
		document.getElementById("airlineCode").value="";
		document.getElementById("tailNumber").value="";
		document.getElementById("flightNumber").value="";
		document.getElementById("departureAirport").value="";
		document.getElementById("destinationAirport").value="";
	}
	for(var i=0;i<length;i++)
	{
		if(airlineIndex==i)
		{
			document.getElementById("airlineCode").options[i].selected=true;
			document.getElementById("tailNumber").options[i].selected=true;
			document.getElementById("flightNumber").options[i].selected=true;
			document.getElementById("departureAirport").options[i].selected=true;
			document.getElementById("destinationAirport").options[i].selected=true;
		}
	}
}
function showSublinks()
{
	document.getElementById("sub1").style.display="";
	document.getElementById("sub2").style.display="";
}
</script> 
<body id="lbody"><div id="fdiv">
	<div id="header">
		<h2>Product Catalogue</h2>
	</div>
	<div id="sidebar">
		<table>
			<tr>
				<td>
					<ul>
						<li style="list-style-type:none">
							<a href="${flowExecutionUrl}&_eventId=viewProductCatalogue" onclick="showSublinks()" >Product Catalogue</a>
							<ul>
								<li style="list-style-type:none"><a  id="sub1" href="${flowExecutionUrl}&_eventId=createProductCatalogue" >Create Catalogue</a></li>
								<li style="list-style-type:none"><a  id="sub2" href="${flowExecutionUrl}&_eventId=editProductCatalogue" >Edit Catalogue</a></li>
							</ul>
						</li>
					</ul>
				</td>	
			</tr>
		</table>
	</div>
	<div id="content">
	<form  method="post" >
		<table align="center">
			<tr>
				<td>Product Code</td>
				<td><input type="text" id="productCode" name="productCode"  /></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><input type="text" id="productName" name="productName" /></td>
			</tr>
			<tr>
				<td>Short Description</td>
				<td><input type="text" id="shortDescription" name="shortDescription" /></td>
			</tr>
			<tr>
				<td>Long Description</td>
				<td><input type="text" id="longDescription" name="longDescription" /></td>
			</tr>
			<tr>
				<td>Image ID</td>
				<td>
					<select style="width:76%" id="imageId" name="imageId" onchange="getImageId()" >
						<option>Select</option>
						<%
							for(int i=0;i<imageList.size();i++)
							{
								imageDetails=(CreateCatalogueDetails)imageList.get(i);
						%>
						<option><%=imageDetails.getImageId() %></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>Image URL</td>
				<td>URL1&nbsp;&nbsp;<input type="text" id="imageUrl1" name="imageUrl1" /></td>
				<td>URL2&nbsp;&nbsp;<input type="text" id="imageUrl2" name="imageUrl2" /></td>
			</tr>
			<tr>
				<td>Product Category</td>
				<td><input type="text" id="productCategory" name="productCategory" /></td>
			</tr>
			<tr>
				<td>Service Plan</td>
				<td><input type="text" id="servicePlan" name="servicePlan" /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" id="price" name="price" /></td>
			</tr>
			<tr>
				<td>Tax Category</td>
				<td>
					<select id="taxCategory" name="taxCategory" onchange="getTax()" style="width:76%">
						<option>Select</option>
						<option>Tax1</option>
						<option>Inclusive</option>
					</select>
				</td>
				<td>Tax Percent&nbsp;&nbsp;<input disabled="disabled" type="text" id="taxPercent" name="taxPercent" /></td>
			</tr>
			<tr>
				<td>Effective Date</td>
				<td><input type="text" id="effectiveDate" name="effectiveDate" /><input type="button" onClick="SelectDate('Date1')" value="Select"></td>
				<td>(in dd/MM/yyyy e.g 02/07/1991)</td>
			</tr>
			<tr>
				<td>Expiry Date</td>
				<td><input type="text" id="expiryDate" name="expiryDate" /></td>
				<td>(in dd/MM/yyyy e.g 22/11/2011)</td>
			</tr>
			<tr>
				<td>Service Code</td>
				<td><input type="text" id="serviceCode" name="serviceCode" /></td>
			</tr>
			<tr>
				<td>Presentation Priority</td>
				<td><input type="text" id="presentationPriority" name="presentationPriority" /></td>
			</tr>
			<tr>
				<td>Locale</td>
				<td><input type="text" id="locale" name="locale" /></td>
			</tr>
			<tr>
				<td>Device Type</td>
				<td><input type="text" id="deviceType" name="deviceType" /></td>
			</tr>
			<tr>
				<td>Airline ID</td>
				<td>
					<select id="airlineId" name="airlineId" onchange="getAirlineInfo()" style="width:76%"> 
						<option>Select</option>
						<%
						while(j.hasNext())
						{
							mapObject=(Map.Entry)j.next();
							airlineDetails=(AirlineDetails)airlineInfoMap.get(mapObject.getKey());
						%>
						<option><%=airlineDetails.getAirlineId() %></option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>Airline Code</td>
				<td>
				<!--<input disabled="disabled" type="text" id="airlineCode" name="airlineCode" />-->
				<select disabled="disabled" id="airlineCode" name="airlineCode" style="width:76%"> 
						<option></option>
						<%
						Iterator k=mapSet.iterator();
						while(k.hasNext())
						{
							mapObject=(Map.Entry)k.next();
							airlineDetails=(AirlineDetails)airlineInfoMap.get(mapObject.getKey());
						%>
						<option><%=airlineDetails.getAirlineCode() %></option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td>Tail Number</td>
				<td>
				<!--<input disabled="disabled" type="text" id="flightNumber" name="flightNumber" />-->
				<select disabled="disabled" id="tailNumber" name="tailNumber" style="width:76%"> 
						<option></option>
						<%
						Iterator l=mapSet.iterator();
						while(l.hasNext())
						{
							mapObject=(Map.Entry)l.next();
							airlineDetails=(AirlineDetails)airlineInfoMap.get(mapObject.getKey());
						%>
						<option><%=airlineDetails.getTailNumber() %></option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td>Flight Number</td>
				<td>
				<!--<input disabled="disabled" type="text" id="flightNumber" name="flightNumber" />-->
				<select disabled="disabled" id="flightNumber" name="flightNumber" style="width:76%"> 
						<option></option>
						<%
						Iterator m=mapSet.iterator();
						while(m.hasNext())
						{
							mapObject=(Map.Entry)m.next();
							airlineDetails=(AirlineDetails)airlineInfoMap.get(mapObject.getKey());
						%>
						<option><%=airlineDetails.getFlightNumber() %></option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td>Departure Airport</td>
				<td>
				<!--<input disabled="disabled" type="text" id="departureAirport" name="departureAirport" />-->
				<select disabled="disabled" id="departureAirport" name="departureAirport" style="width:76%" > 
						<option></option>
						<%
						Iterator n=mapSet.iterator();
						while(n.hasNext())
						{
							mapObject=(Map.Entry)n.next();
							airlineDetails=(AirlineDetails)airlineInfoMap.get(mapObject.getKey());
						%>
						<option><%=airlineDetails.getDepartureAirport() %></option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td>Destination Airport</td>
				<td>
				<!--<input disabled="disabled" type="text" id="destinationAirport" name="destinationAirport" />-->
				<select disabled="disabled" id="destinationAirport" name="destinationAirport" style="width:76%"> 
						<option></option>
						<%
						Iterator o=mapSet.iterator();
						while(o.hasNext())
						{
							mapObject=(Map.Entry)o.next();
							airlineDetails=(AirlineDetails)airlineInfoMap.get(mapObject.getKey());
						%>
						<option><%=airlineDetails.getDestinationAirport() %></option>
						<%
						}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" name="_eventId_create" value="Create" /></td>
				<td><input type="reset" name="_eventId_cancel" value="Cancel"></td>
			</tr>
		</table> 
	</form>
	</div>
</div>

</body>
</html>	