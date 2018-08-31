package com.cubic.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

import com.cubic.Beans.UserBean;

public class UpdatePasswordDAO {
	
	public static void update(UserBean user) {
		String str1;
		String str2;
		String str3;
		String newpassword;
		System.out.println("Testing DAO");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","reddy","reddy");
			PreparedStatement pst=con.prepareStatement("select * from userlogin where email=?");
			pst.setString(1, user.getEmail());
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				Set<String> strings = new HashSet<String>();
				newpassword=user.getUpassword();
				str1=rs.getString("upassword");
				str2=rs.getString("last1password");
				str3=rs.getString("last2password");
				strings.add(str1);
				strings.add(str2);
				strings.add(str3);
				if (strings.contains(newpassword)) 
				{
					user.setIsvalid(false);
				}else {
					String temp=str1;
					str3=str2;
					PreparedStatement pst1=con.prepareStatement("update userlogin set upassword=?,last1password=?,last2password=? where email=?");
					pst1.setString(1, user.getUpassword());
					pst1.setString(2, temp);
					pst1.setString(3, str3);
					pst1.setString(4, user.getEmail());
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
			}
			}
			else {
				System.out.println("Testing DAO Else");
				user.setIsvalid(false);
		}
		}
	catch (Exception e) {
		System.out.println(e);
	}		
	}
}
