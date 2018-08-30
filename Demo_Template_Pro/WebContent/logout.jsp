<%@page import="com.cubic.Beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% UserBean name=(UserBean)session.getAttribute("userbean");
	session.invalidate();
	
	
	%>
	<script>alert("log out success");</script>
	<script>window.location.href="http://localhost:8085/DemoTemplate/index.jsp"</script>

</body>
</html>