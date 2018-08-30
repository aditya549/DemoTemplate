<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<%@page import="com.cubic.Beans.UserBean"%>
<html lang="zxx">

<head>
	<title>Registration Form Responsive Widget Template :: w3layouts</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Video Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
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
			<span>E</span>dit
			<span>U</span>ser
			<span>R</span>egistration
			<span>F</span>orm</h1>
		<!-- //title -->
		<!-- content -->
		<% UserBean name=(UserBean)session.getAttribute("userbean");
	%>
		<div class="sub-main-w3">
			<form action="UpdateServlet" method="post">
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Username</label>
					<input Value="<%=name.getUname() %>" name="Name" type="text" required="">
				</div>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-unlock-alt"></i>Password</label>
					<input Value="<%=name.getUpassword() %>" name="Password" type="password" required="">
				</div>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Email</label>
					<input Value="<%=name.getEmail() %>" name="email" type="text" required="">
				</div>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Where Are You Form</label>
					<input Value="<%=name.getPlace()%>" name="place" type="text" required="">
				</div>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Gender</label>
					<input type="radio" value="male" name="gender" required="">Male
					<input type="radio" value="female" name="gender" required="">FeMale
				</div>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Select Domain</label>
						<select name="domain">
						 <option value="java">Java</option>
 						 <option value="dotnet">DotNet</option>
 						 <option value="Testing">Testing</option>
  						 <option value="Web Designing">Web Designing</option>
						 </select>

				</div>
				<input type="hidden" value="<%=name.getId()%>" name="id">
				<input type="submit" value="Update">
			</form>
		</div>
		<!-- //content -->

		<!-- copyright -->
		<div class="footer">
			<p>&copy; 2018 Video Login Form. All rights reserved | Design by
				<a href="http://w3layouts.com">W3layouts</a>
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