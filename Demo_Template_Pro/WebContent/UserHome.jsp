<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<%@page import="com.cubic.Beans.UserBean"%>
<html lang="zxx">

<head>
	<title>User Login Home</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Video Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Marck+Script&amp;subset=cyrillic,latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=cyrillic,latin-ext"
	    rel="stylesheet">
	<!-- //web-fonts -->
</head>

<body>
	<div class="video-w3l" data-vide-bg="video/1">
		<!-- title -->
		<h1>
			<span>W</span>EL
			<span>C</span>OME
			<span>U</span>SER</h1>
			<p style="font-size:x-large;text-align: right;margin-left:1150px;margin-right:100px;border: outset;color: white">
			<a href="logout.jsp" style="text-decoration: none;color: white">
			Logout</a></p>
		<!-- //title -->
	<% UserBean name=(UserBean)session.getAttribute("userbean");
	%>
	<h1 style="text-align: center;color: white;">Login Success Welcome <%=name.getUname() %></h1>
	<h3 style="text-align: center;"><button onclick="myFunction()">Click Here For User Details</button></h3><br><br>
		<div id="myDIV" style="display: none";>
		<p align="center" style="border:outset;margin-left: 600px;margin-right: 600px;background-color: white">
		<% String imgname="Images/"+name.getUname()+".png";%>
		
		<img src="<%=imgname%>" alt="Smiley face" height="80" width="80" ></p>
		<table style="margin-left: 500px;background-color: white;border: 1px solid black;"><th colspan="2"><u><b>User Profile</b></u></th>
		<tr><td>User Name &nbsp</td>
			<td><%=name.getUname() %></td></tr>
		<tr><td>Email Id &nbsp</td>
			<td><%=name.getEmail()%></td></tr>
		<tr><td>Gender &nbsp</td>
			<td><%=name.getGender() %></td></tr>
		<tr><td>Place &nbsp</td>
			<td><%=name.getPlace() %></td></tr>
		<tr><td>MobileNumber &nbsp</td>
			<td><%=name.getMobile() %></td></tr>
		<tr><td>Domain &nbsp</td>
			<td><%=name.getDomain() %></td></tr>
		<tr><th colspan="2"><a href="edit.jsp?id=<%=name.getId()%>" style="border: outset;">Edit</a></th></tr>
		
		</table>
		</div>
		<h1 style="text-align: center;"><a href="delete.jsp?id=<%=name.getId()%>" style="border: outset;text-decoration: none;">Delete My Account</a></h1>
	<script>
function myFunction() {
    var x = document.getElementById("myDIV");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
</script>
				<!-- copyright -->
		<div class="footer">
			<p>&copy; 2018 Video Login Form. All rights reserved | Design by
				<a href="http://w3layouts.com">Cubic It Solution</a>
			</p>
		</div>
		<!-- //copyright -->
	</div>

	
	<!-- Jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //Jquery -->

	<!-- Video js -->
	<script src="js/jquery.vide.min.js"></script>
	<!-- //Video js -->
	
</body>

</html>