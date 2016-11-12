package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
			ResultSet rs = stmt.executeQuery("select * from questions where id='" + q.getId() + "'");
			for (int i = 0; i < Integer.parseInt(q.getAmount()); i++)
			{
				ques += q.getQuestions()[i];
				ques += "^&^";
			}
			if(rs.next())
			{
				stmt.executeUpdate("update questions set "
						+ "amount='" + q.getAmount() + "', "
						+ "questions='" + ques + "' "
						+ "where id='" + q.getId() + "'");
			}
			else
			{
				stmt.executeUpdate("insert into questions (id,amount,questions) values ('"
						+ q.getId() + "','" + q.getAmount() + "','" + ques + "')");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return true;
	}
}
