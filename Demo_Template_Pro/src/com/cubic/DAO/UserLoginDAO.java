package com.cubic.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cubic.Beans.UserBean;

	public class UserLoginDAO {
		public static void login(UserBean ub) {
	
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "reddy", "reddy");
			PreparedStatement pst=con.prepareStatement("select * from UserLogin where uname=? and upassword=?");
			pst.setString(1, ub.getUname());
			pst.setString(2, ub.getUpassword());
			ResultSet rs=pst.executeQuery();
			boolean b=rs.next();
			if(b) {
				ub.setIsvalid(true);
				ub.setUname(rs.getString("uname"));
				ub.setEmail(rs.getString("email"));
				ub.setGender(rs.getString("gender"));
				ub.setPlace(rs.getString("place"));
				ub.setDomain(rs.getString("domain"));
				ub.setId(rs.getInt("id"));
				ub.setMobile(rs.getString("mobile"));
			}else
				ub.setIsvalid(false);
		}
		catch (Exception e) {
				System.out.println(e);
			}
		}
}
