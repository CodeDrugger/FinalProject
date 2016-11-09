package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import domain.Questions;

public class QuestionService {
	public boolean doSaveQues(Questions q)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
			String ques = "";
			for (int i = 0; i < Integer.parseInt(q.getAmount()); i++)
			{
				ques += q.getQuestions()[i];
				ques += "^&^";
			}
			stmt.executeUpdate("insert into questions (id,amount,questions) values ("
			+ q.getId() + "," + q.getAmount() + "," + ques + ")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return true;
	}
}
