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
<%

String name=(String)session.getAttribute("name");
String password=(String)session.getAttribute("password");
String email=(String)session.getAttribute("email");
String gender=(String)session.getAttribute("gender");
String place=(String)session.getAttribute("place");
String domain=(String)session.getAttribute("domain");
String mobile=(String)session.getAttribute("mobile");

session.invalidate();
/* String password=ub.getUname();
String email=ub.getEmail();
String place=ub.getPlace();
String mobile=ub.getMobile();
String gender=ub.getGender();
String domain=ub.getDomain(); */
%>
	<div class="video-w3l" data-vide-bg="video/1">
		<!-- title -->
		<h1>
			<span>U</span>ser
			<span>R</span>egistration
			<span>F</span>orm</h1>
		<!-- //title -->
		<!-- content -->
		<div class="sub-main-w3">
			<form action="UserRegistrationServlet" method="post" onsubmit="myfun()">
				<%if(name==null){ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Username</label>
					<input placeholder="Username" name="name"  type="text" required="" >
				</div>
				<%}else{ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Username</label>
					<input placeholder="Username" name="name"  value="<%=name%>"type="text" required="" >
				</div>
				<% }%>
				<%if(name==null){ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-unlock-alt"></i>Password</label>
					<input placeholder="Password" name="password" type="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
				</div>
				<%}else{ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-unlock-alt"></i>Password</label>
					<input placeholder="Password" value="<%=password %>" name="password" type="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
				</div>
				<% }%>
				<%if(name==null){ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Email</label>
					<input placeholder="email" name="email" type="text" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="that must be in the following order: characters@characters.domain (characters followed by an @ sign, followed by more characters, and then a . After the . sign, you can only write 2 to 3 letters from a to z:">
				</div>
				<%}else{ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Email</label>
					<input placeholder="email" name="email" type="text" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="that must be in the following order: characters@characters.domain (characters followed by an @ sign, followed by more characters, and then a . After the . sign, you can only write 2 to 3 letters from a to z:">
					<br>
					<p style="color:red;"><%=email %></p>
				</div>
				<% }%>
				<%if(name==null){ %>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Mobile Number</label>
					<input placeholder="Enter Mobile Number" name="mobile" type="text" required="" maxlength="10" pattern="[789][0-9]{9}" title="Mobile Number Must Start with 7,8,9 and contains 10digits and Only Numbers">
				</div>
				<%}else{ %>
					<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Mobile Number</label>
					<input placeholder="Enter Mobile Number" value="<%=mobile %>" name="mobile" type="text" required="" maxlength="10" pattern="[789][0-9]{9}" title="Mobile Number Must Start with 7,8,9 and contains 10digits and Only Numbers">
				</div>
				<% }%>
				<div class="form-style-agile">
					<label>
						<i class="fas fa-user"></i>Where Are You From</label>
					<select name="place" required="required">
						<option value="" selected disabled hidden>Choose here</option>
						<option value="Hyderabad">Hyderabad</option>
						<option value="Chennai">Chennai</option>
						<option value="Bangalore">Bangalore</option>
						<option value="Pune">Pune</option>
					</select>
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
						<select name="domain" required="required">
						<option value="" selected disabled hidden>Choose here</option>
						 <option value="java">Java</option>
 						 <option value="dotnet">DotNet</option>
 						 <option value="Testing">Testing</option>
  						 <option value="Web Designing">Web Designing</option>
						 </select>

				</div>
				<input type="submit" value="Register">
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