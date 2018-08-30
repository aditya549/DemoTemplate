package com.cubic.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cubic.Beans.UserBean;
import com.cubic.DAO.ForgotPasswordDAO;
import com.cubic.DAO.UpdatePasswordDAO;

@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
		
		String mailid=req.getParameter("email");
		String newpassword=req.getParameter("password");
		System.out.println(mailid);
		System.out.println(newpassword);
		UserBean user=new UserBean();
		user.setEmail(mailid);
		user.setUpassword(newpassword);
		UpdatePasswordDAO.update(user);
		boolean b=user.isIsvalid();
		if(b) {
			resp.getWriter().print("<script>window.alert('Password Changed Successfully')</script>");
			RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
		}else {
			resp.getWriter().print("<script>window.alert('Something Went Wrong try again later')</script>");
			RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
		}
	}
}
