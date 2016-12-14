package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import domain.AdvSearch_stu;
import domain.Teacher;

public class AdvSchService_stu {
	public ArrayList<Object> doAdvSch_stu(AdvSearch_stu advsch)
	{
		ArrayList<Object> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
			if (advsch.getResearch_filed().equals("请填写研究方向"))
				advsch.setResearch_filed("");		
			String sqlstr = "select * from tea_inf where "
					+ "research_field like '%" + advsch.getResearch_filed() + "%' and "
					+ "xueyuan like '%" + advsch.getXueyuan() + "%' and "
					+ "major like '%" + advsch.getMajor() + "%' and "
					+ "enrollment-in_enrollment>0";
			if (advsch.getIsfull().equals("full"))
				sqlstr = "select * from tea_inf where "
						+ "research_field like '%" + advsch.getResearch_filed() + "%' and "
						+ "xueyuan like '%" + advsch.getXueyuan() + "%' and "
						+ "major like '%" + advsch.getMajor() + "%'";
			if (!advsch.getKeyword().equals(""))
			{
				String k = advsch.getKeyword();
				sqlstr += (" and ("
						+ "name like '%" + k + "%' or "
						+ "sex like '%" + k + "%' or "
						+ "self_intro like '%" + k + "%' or "
						+ "college like '%" + k + "%' or "
						+ "tel like '%" + k + "%' or "
						+ "email like '%" + k + "%')");
			}
			ResultSet rs = stmt.executeQuery(sqlstr);
			while(rs.next())
			{
				Teacher tr = new Teacher(
	    				rs.getString("id"),
	    				rs.getString("name"),
	    				rs.getString("sex"),
	    				rs.getString("picture_name"),
	    				rs.getString("self_intro"),
	    				rs.getString("research_field"),
	    				rs.getString("college"),
	    				rs.getString("xueyuan"),
	    				rs.getString("major"),
	    				rs.getString("tel"),
	    				rs.getString("email"),
	    				rs.getString("enrollment"),
	    				rs.getString("in_enrollment"),
	    				rs.getString("selected_stu"),
	    				rs.getString("attentioned_stu"),
	    				rs.getString("attentioned_me"),
	    				rs.getString("rate"));
	    		list.add(tr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
}
