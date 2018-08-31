package com.cubic.Controller;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.io.IOException;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cubic.Beans.UserBean;
import com.cubic.DAO.ForgotPasswordDAO;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {
		String targetmailid=req.getParameter("emailcheck");
		UserBean user=new UserBean();
		user.setEmail(targetmailid);
		ForgotPasswordDAO.forgot(user);
		boolean b=user.isIsvalid();
		if(b){
			
			String to=targetmailid;//change accordingly
			String from="cubicitsolutioninterview@gmail.com";
			String password="1100reddy";
			Random rand = new Random();
			int otp = rand.nextInt(900000) + 100000;
			String sub="Reg.ForGot Password From Cubic It Solution";
			String msg = "<i>Greetings!</i><br><br><br>";
		        msg += "<b>Hi...!!There We are From Cubic IT Solution!</b><br><br><br>";
		        msg += "<b>You'r OTP is</b><br><br><br>";
		        msg += otp;
		 	Properties props = new Properties();    
	          props.put("mail.smtp.host", "smtp.gmail.com");    
	          props.put("mail.smtp.socketFactory.port", "465");    
	          props.put("mail.smtp.socketFactory.class",    
	                    "javax.net.ssl.SSLSocketFactory");    
	          props.put("mail.smtp.auth", "true");    
	          props.put("mail.smtp.port", "465");    
	          //get Session   
	          Session session = Session.getDefaultInstance(props,    
	           new javax.mail.Authenticator() {    
	           protected PasswordAuthentication getPasswordAuthentication() {    
	           return new PasswordAuthentication(from,password);  
	           }    
	          });    
	          //compose message    
	          try {    
	           MimeMessage mess = new MimeMessage(session);
	           
	           /*mess.setSender(new InternetAddress("no-reply@domain.com", "Sender Name"));*/
	          
	           mess.setFrom(new InternetAddress("Sender Name" + "<" + "no-reply@domain.com" + ">"));
		 	   mess.setReplyTo(InternetAddress.parse("no_reply@gmail.com", false));
	           mess.addRecipient(Message.RecipientType.TO,new InternetAddress(to,false));    
	           mess.setSubject(sub);    
	           mess.setText(msg); 
	           mess.setSentDate(new Date());
	           
	           mess.setContent(msg, "text/html");
	           //send message  
	           Transport.send(mess);    
	           //System.out.println("message sent successfully");  
	           req.setAttribute("otp",otp);
	           req.setAttribute("email", targetmailid);
	           //System.out.println("message sent successfully"); 
	           resp.getWriter().print("<script>window.alert('OTP Sent To You are Mail id Successfully')</script>");
				RequestDispatcher rd=req.getRequestDispatcher("OtpPage.jsp");
				rd.include(req, resp);
	          /*resp.getWriter().print("<script>window.location.href='http://localhost:8085/DemoTemplate/index.jsp'</script>");*/
	          } catch (MessagingException e) {throw new RuntimeException(e);}    		
		}else
		{
			resp.getWriter().print("<script>window.alert('Something Went Wrong try again later')</script>");
			RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
			/*resp.getWriter().println("<script>window.location.href='http://localhost:8085/DemoTemplate_Task/forgotpassword.jsp'");*/
		}
	}
}
