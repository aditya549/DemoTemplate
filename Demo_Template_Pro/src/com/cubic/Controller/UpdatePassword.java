package com.cubic.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cubic.Beans.UserBean;
import com.cubic.DAO.ForgotPasswordDAO;
import com.cubic.DAO.UpdatePasswordDAO;

@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		
		String mailid=request.getParameter("email");
		String newpassword=request.getParameter("password");
		System.out.println(mailid);
		System.out.println(newpassword);
		UserBean user=new UserBean();
		user.setEmail(mailid);
		user.setUpassword(newpassword);
		UpdatePasswordDAO.update(user);
		boolean b=user.isIsvalid();
		if(b) {
			response.getWriter().print("<script>window.alert('Password Changed Successfully')</script>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}else {
			/*resp.getWriter().print("<script>window.alert('Something Went Wrong try again later')</script>");*/
			RequestDispatcher rd=request.getRequestDispatcher("Forgotpasswordcubic.jsp");
			/*HttpSession session=req.getSession(true);*/
			request.setAttribute("email", user.getEmail());
			request.setAttribute("errmsg","**Password Used Recently PLease Use Another Password Which Must not used lastTime");
			/*response.sendRedirect("Forgotpasswordcubic.jsp");*/
			rd.include(request, response);
		}
	}
}
