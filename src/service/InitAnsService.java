package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import domain.Answers;

public class InitAnsService {
	public void doInitAns(Answers a)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
		    ResultSet rs = stmt.executeQuery("select * from answers where "
		    		+ "id_tea='" + a.getId_tea() + "' and id_stu='" + a.getId_stu() + "'");
		    if (rs.next())
		    {
		    	a.setQuestions(rs.getString("questions").split("\\^\\&\\^"));
		    	a.setAnswers(rs.getString("answers").split("\\^\\&\\^"));
		    	a.setAmount(rs.getString("amount"));
		    }
		    else
		    {
		    	a.setAmount("0");
		    }
		    connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
