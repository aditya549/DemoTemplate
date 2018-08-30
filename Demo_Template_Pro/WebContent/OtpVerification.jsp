<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int otptrue=(Integer)session.getAttribute("otptrue");
String email=(String)session.getAttribute("email");
int otpcheck=Integer.parseInt(request.getParameter("otp"));
if(otptrue==otpcheck){%>
<script>alert("Email Verified Successfully Now You can Change You'r Password");</script>
<script>window.location.href="http://localhost:8085/Demo_Template_Pro/Forgotpasswordcubic.jsp"</script>
<% 	
}else
{%>
<script>alert("Invalid OTP Please Try Again");</script>
<script>window.location.href="http://localhost:8085/Demo_Template_Pro/index.jsp"</script>
<%
}
%>
</body>
</html>