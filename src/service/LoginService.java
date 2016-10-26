package service;

import java.sql.*;

import domain.Login;


public class LoginService {
	public int doLogin(Login login)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
		    ResultSet rs = stmt.executeQuery("select * from login where username='" + login.getUsername() + "'");
		    if (rs.next())
		    {
		    	if (login.getPassword().equals(rs.getString("password")))
		    	{
		    		connect.close();
		    		return 1;//成功
		    	}
		    }
		    connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;//失败
	}
}
