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

import com.cubic.Beans.UserBean;
import com.cubic.DAO.UserRegisterDAO;
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		UserBean ub=new UserBean();
		ub.setUname(request.getParameter("Name"));
		ub.setUpassword(request.getParameter("Password"));
		ub.setEmail(request.getParameter("email"));
		ub.setGender(request.getParameter("gender"));
		ub.setPlace(request.getParameter("place"));
		ub.setDomain(request.getParameter("domain"));
		ub.setId(Integer.parseInt(request.getParameter("id")));
		try {
			UserRegisterDAO.update(ub);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean b=ub.isIsvalid();
		if(b) {
			System.out.println("Updated Success");
			out.println("<h1 style='text-align:center;color:red'>User Record Updated Please Login Again To Continue</h1>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}else
		{
			System.out.println("Record Not Updated");
			out.println("<h1 style='text-align:center;color:red'>User Record Not Updated </h1>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	
	}
}
