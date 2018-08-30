package com.cubic.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cubic.Beans.UserBean;

public class UpdatePasswordDAO {
	
	public static void update(UserBean user) {
		System.out.println("Testing DAO");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","reddy","reddy");
			PreparedStatement pst1=con.prepareStatement("update userlogin set upassword=? where email=?");
			pst1.setString(1, user.getUpassword());
			pst1.setString(2, user.getEmail());
			System.out.println("Testing DAO "+user.getUpassword());
			System.out.println("Testing DAO "+user.getEmail());
			int i=pst1.executeUpdate();
			System.out.println("Testing DAO "+i);
			if(i==1) {
				System.out.println("Testing DAO If Statemnet");
				user.setIsvalid(true);
			}else {
				System.out.println("Testing DAO Else");
				user.setIsvalid(false);
			}
		}catch (Exception e) {
		// TODO: handle exception
	}		
	}
}
