package com.cubic.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OtpVerificationServlet")
public class OtpVerificationServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
		String email=req.getParameter("email");
		int otp=Integer.parseInt(req.getParameter("otp"));
		int otptrue=Integer.parseInt(req.getParameter("otptrue"));
		if(otp==otptrue) {
			req.setAttribute("email", email);
			resp.getWriter().print("<script>window.alert('EMail id Verified Successfully Please Change Password')</script>");
			RequestDispatcher rd=req.getRequestDispatcher("Forgotpasswordcubic.jsp");
			rd.include(req, resp);
		}else {
		resp.getWriter().print("<script>window.alert('Invalid OTP Plaese Try Again')</script>");
		RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
		rd.include(req, resp);
		}
	}
}
