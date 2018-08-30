package com.cubic.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cubic.Beans.UserBean;
import com.cubic.DAO.UserLoginDAO;
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		UserBean ub=new UserBean();
		ub.setUname(req.getParameter("Name"));
		ub.setUpassword(req.getParameter("Password"));
		UserLoginDAO.login(ub);
		boolean b=ub.isIsvalid();
		if(b) {
			System.out.println("Login Success");
			HttpSession session=req.getSession(true);
			session.setAttribute("userbean", ub);
			res.sendRedirect("UserHome.jsp");
		}else
			System.out.println("inValid UserDetails");
			out.println("<p style='text-align:center'>Invalid Admin Details </p>");
			RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
			rd.include(req, res);
			
	}
}
