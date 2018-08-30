package com.cubic.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cubic.Beans.UserBean;
import com.cubic.DAO.UserRegisterDAO;
@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		UserBean ub=new UserBean();
		ub.setUname(request.getParameter("name"));
		ub.setUpassword(request.getParameter("password"));
		ub.setEmail(request.getParameter("email"));
		ub.setGender(request.getParameter("gender"));
		ub.setPlace(request.getParameter("place"));
		ub.setDomain(request.getParameter("domain"));
		ub.setMobile(request.getParameter("mobile"));
		try {
			UserRegisterDAO.register(ub);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean b=ub.isIsvalid();
		if(b) {
			System.out.println("Registartion Success");
			out.println("<h1 style='text-align:center;color:red'>User Registration Success Please Login To Continue</h1>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		else 
		{
			HttpSession session=request.getSession(true);
			session.setAttribute("name", ub.getUname());
			session.setAttribute("place", ub.getPlace());
			session.setAttribute("mobile", ub.getMobile());
			session.setAttribute("domain", ub.getDomain());
			session.setAttribute("password", ub.getUpassword());
			session.setAttribute("gender", ub.getGender());
			session.setAttribute("email","Email id Alreday Taken Please Try With Another");
			response.sendRedirect("UserRegistration.jsp");
		}
}
}
