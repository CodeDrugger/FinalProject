package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import domain.Login;

public class SignUpService {
	public int doSignUp(Login login)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
			ResultSet rSet = stmt.executeQuery("select * from id_alloc");
			int id = -1;
			if (rSet.next())
				id = rSet.getInt("id");
			if (id < 0) 
			{
				connect.close();
		    	return 0;//失败
			}
		    int state = stmt.executeUpdate(
		    		"insert into login (username,password,userclass,id) values " +
		    		"('" + login.getUsername() +
		    		"','" + login.getPassword() +
		    		"','" + login.getUserclass() +
		    		"','" + String.valueOf(id) +
		    	    "')");
		    int stat = stmt.executeUpdate("update id_alloc set id='" + String.valueOf(id + 1) + "'");
		    if (state == 0 || stat == 0)
		    {
		    	connect.close();
		    	return 0;//失败
		    }
		    connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 1;//成功
	}
}
