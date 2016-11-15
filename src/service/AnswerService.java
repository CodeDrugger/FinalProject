package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import domain.Answers;

public class AnswerService {
	public void doSaveAns(Answers a)
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
			String ans = "";
			ResultSet rs = stmt.executeQuery("select * from answers where "
					+ "id_tea='" + a.getId_tea() + "' and id_stu='" + a.getId_stu() + "'");
			for (int i = 0; i < Integer.parseInt(a.getAmount()); i++)
			{
				ques += a.getQuestions()[i];
				ques += "^&^";
				ans += a.getAnswers()[i];
				ans += "^&^";
			}
			if(rs.next())
			{
				stmt.executeUpdate("update answers set "
						+ "amount='" + a.getAmount() + "', "
						+ "questions='" + ques + "', "
						+ "answers='" + ans + "' "
						+ "where id_tea='" + a.getId_tea() + "' and id_stu='" + a.getId_stu() + "'");
			}
			else
			{
				stmt.executeUpdate("insert into answers (id_tea,id_stu,amount,questions,answers) values ("
						+ "'" + a.getId_tea() + "',"
						+ "'" + a.getId_stu() + "',"
						+ "'" + a.getAmount() + "',"
						+ "'" + ques + "',"
						+ "'" + ans + "')");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
