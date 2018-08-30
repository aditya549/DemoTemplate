<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h1{
text-align: center; 
border:outset;
margin-left: 500px;
margin-right: 500px
}
hr{
border: outset;
margin-left: 400px;
margin-right: 400px
}
</style>
</head>
<body>
<h1>Welcome User</h1>
<hr>
<p align="center">
**Please Enter New Password Which You Want To Use In Cubic IT Solution Login</p>
<form name="myform" action="UpdatePassword" method="post" onsubmit="return validateForm();">
<table align="center">
<% 
String email=(String)request.getAttribute("email");
%>
<tr><td >You'r Email Id</td><td><input type="text" name="email" id="email" value="<%=email %>" readonly="readonly"></td></tr>
<tr><td >Enter New Password</td><td><input type="password" name="password" id="pass"></td></tr>
<tr><td >Re-Enter New Password</td><td><input type="password" name="chkpassword" id="pass1"></td></tr>
<tr align="right"><td><input type="submit" value="Change Passowrd"></td></tr>
</table>
</form>
<hr>
<script>
function validateForm() {
    var x = document.getElementById("pass").value;
    var y = document.getElementById("pass1").value;
    if (x == "") {
        alert("Password must be filled out");
        return false;
    }
    if (y == "") {
        alert("RePassword must be filled out");
        return false;
    }
    if(x != y){
    	alert("Both Passwords must be Same");
    	 return false;
    }
    return true;
    
}
</script>
</body>
</html>