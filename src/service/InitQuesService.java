package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import domain.Questions;

public class InitQuesService {
	public void doInitQues(Questions q)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
		    ResultSet rs = stmt.executeQuery("select * from questions where id='" + q.getId() + "'");
		    if (rs.next())
		    {
		    	q.setQuestions(rs.getString("questions").split("\\^\\&\\^"));
		    	q.setAmount(rs.getString("amount"));
		    }
		    else
		    {
		    	q.setAmount("0");
		    }
		    connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
