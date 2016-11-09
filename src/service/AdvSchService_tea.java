package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import domain.AdvSearch_tea;
import domain.Student;

public class AdvSchService_tea {
	public ArrayList<Object> doAdvSch_tea(AdvSearch_tea advsch)
	{
		ArrayList<Object> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			Statement stmt = connect.createStatement();
			String sqlstr = "select * from stu_inf where "
						+ "benke_major like '%" + advsch.getBenke_major() + "%' and "
						+ "wish_major like '%" + advsch.getWish_class() + "%' and "
						+ "zhibo like '%" + advsch.getZhibo() + "%' and "
						+ "wish_class like '%" + advsch.getWish_class() + "%' and "
						+ "bein_class like '%" + advsch.getBein_class() + "%'";
			if (advsch.getRange() == 0)
				sqlstr += (" and score>" + advsch.getScore());
			else if (advsch.getRange() == 1)
				sqlstr += (" and score<" + advsch.getScore());
			else if (advsch.getRange() == 2)
				sqlstr += (" and score=" + advsch.getScore());
			if (!advsch.getKeyword().equals(""))
			{
				/*
				 * private String id;
				private String name;
				private String sex;
				private String age;
				private String honor;
				private String self_intro;
				private String tel;
				private String email;
				private String picture_name;
				private String selected_tea; //只能有一个，改变状态
				private String attentioned_tea;
				private String attentioned_me;
				private String state;
				 */
				String k = advsch.getKeyword();
				sqlstr += (" and ("
						+ "name like '%" + k + "%' or "
						+ "sex like '%" + k + "%' or "
					    + "age like '%" + k + "%' or "
						+ "honor like '%" + k + "%' or "
						+ "self_intro like '%" + k + "%' or "
						+ "tel like '%" + k + "%' or "
						+ "email like '%" + k + "%')");
			}
			ResultSet rs = stmt.executeQuery(sqlstr);					
			while (rs.next())
			{
				Student st = new Student(
	    				rs.getString("id"),
	    				rs.getString("name"),
	    				rs.getString("sex"),
	    				rs.getString("age"),
	    				rs.getString("benke_major"),
	    				rs.getString("wish_major"),
	    				rs.getString("zhibo"),
	    				rs.getString("wish_class"),
	    				rs.getString("bein_class"),
	    				rs.getString("score"),
	    				rs.getString("honor"),
	    				rs.getString("self_intro"),
	    				rs.getString("tel"),
	    				rs.getString("email"),
	    				rs.getString("picture_name"),
	    				rs.getString("selected_tea"),
	    				rs.getString("attentioned_tea"),
	    				rs.getString("attentioned_me"),
	    				rs.getString("state"),
	    				rs.getString("rate"));
	    		list.add(st);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
}