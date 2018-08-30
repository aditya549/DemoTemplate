<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521","reddy","reddy");
PreparedStatement pst=con.prepareStatement("delete from userlogin where id=?");
pst.setInt(1, id);
int i =pst.executeUpdate();
if(i==1){
	session.invalidate();
	%><script>
	alert("You'r Account Deleted Please Register First To Login");</script>
	<script>
	window.location.href="http://localhost:8085/DemoTemplate/"
	</script>
<%}else
	out.println("User Account is Not Deleted ");

%>
</body>
</html>