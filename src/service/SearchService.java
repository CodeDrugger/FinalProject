package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import domain.Search;

public class SearchService {
	public ArrayList<Object> doSearch(Search search)
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
		    String k = search.getKeyword();
		    if (search.getUser() == 0)//导师执行搜索
		    {
		    	/*
		    	 * id varchar(20) not null,
					name varchar(20) not null,
					sex varchar(20) not null,
					age varchar(20) not null,
					benke_major varchar(20) not null,
					wish_major varchar(20) not null,
					zhibo varchar(20) not null,
					wish_class varchar(20) not null,
					bein_class varchar(20) not null,
					score varchar(20) not null,
					honor varchar(1000) not null,
					self_intro varchar(1000) not null,
					tel varchar(20) not null,
					email varchar(20) not null
		    	 */
		    	
		    }
		    else if (search.getUser() == 1)//学生执行搜索 
		    {
				
			}
		    connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
