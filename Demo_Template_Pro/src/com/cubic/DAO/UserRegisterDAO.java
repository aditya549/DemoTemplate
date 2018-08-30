package com.cubic.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.cubic.Beans.UserBean;

public class UserRegisterDAO {

	public static void register(UserBean ub) throws SQLException {
		Connection con=null;
		try {
			String str=ub.getEmail();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "reddy", "reddy");
			Statement stmt=con.createStatement();
			String query="select * from UserLogin where email='"+str+"'";
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()) {
				ub.setIsvalid(false);
			}else {
				PreparedStatement pst=con.prepareStatement("insert into UserLogin values(?,?,?,?,?,?,seq_person.nextval,?,?,?)");
				pst.setString(1, ub.getUname());
				pst.setString(2, ub.getUpassword());
				pst.setString(3, ub.getEmail());
				pst.setString(4, ub.getPlace());
				pst.setString(5, ub.getGender());
				pst.setString(6, ub.getDomain());
				pst.setString(7, ub.getMobile());
				pst.setString(8, null);
				pst.setString(9, null);
				int i=pst.executeUpdate();
				if(i==0) {
					ub.setIsvalid(false);
				}else
					ub.setIsvalid(true);

			}
		}catch (Exception e) {
			System.out.println(e);
		}
		finally {
			con.close();
		}
	}

	public static void update(UserBean ub) throws SQLException {
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "reddy", "reddy");
			PreparedStatement pst=con.prepareStatement("update userlogin set uname=?,upassword=?,email=?,place=?,gender=?,domain=? where id=?");
			pst.setString(1, ub.getUname());
			pst.setString(2, ub.getUpassword());
			pst.setString(3, ub.getEmail());
			pst.setString(4, ub.getPlace());
			pst.setString(5, ub.getGender());
			pst.setString(6, ub.getDomain());
			pst.setInt(7,ub.getId());
			int i=pst.executeUpdate();
			if(i==0) {
				ub.setIsvalid(false);
			}else
				ub.setIsvalid(true);
		}catch (Exception e) {
			System.out.println(e);
		}
		finally {
			con.close();
		}

	}

}
