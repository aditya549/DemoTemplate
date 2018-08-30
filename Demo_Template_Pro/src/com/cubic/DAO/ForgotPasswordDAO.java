package com.cubic.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cubic.Beans.UserBean;

public class ForgotPasswordDAO {
	public static void forgot(UserBean user) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","reddy","reddy");
			PreparedStatement pst=con.prepareStatement("select * from userlogin where email=?");
			pst.setString(1, user.getEmail());
			ResultSet rs=pst.executeQuery();
			boolean b=rs.next();
			if(b) {
				user.setIsvalid(true);
				user.setUpassword(rs.getString("upassword"));
				user.setUname(rs.getString("uname"));
			}else
				user.setIsvalid(false);
	}catch (Exception e) {
		// TODO: handle exception
	}
}
}
