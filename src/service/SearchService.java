package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import domain.Search;
import domain.Student;

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
		    	String[] matchmap = {"计算机","信息安全","生物信息","测控","光电","飞行器","工程力学","电子",
		    			"机械","材料","焊接","能源","核","热","电气","化学","物理","数学","管理","社会","国际",
		    			"土木","建筑","给排水","环境","交通","道路","软件","法学","语","食品","信息","通信","生物",
		    			"男","女","非直博","直博","保研","考研"};
		    	for (String s:matchmap)
		    	{
		    		if (k.contains(s))
		    		{
		    			k = s;
		    			break;
		    		}		    			
		    	}
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
		    	ResultSet rs = stmt.executeQuery("select * from stu_inf where "
		    			+ "name like '%" + k + "%' or "
		    			+ "sex like '%" + k + "%' or "
		    			+ "benke_major like '%" + k + "%' or "
		    			+ "wish_major like '%" + k + "%' or "
		    			+ "wish_class like '%" + k + "%' or "
		    			+ "bein_class like '%" + k + "%' or "
		    			+ "honor like '%" + k + "%' or "
		    			+ "self_intro like '%" + k + "%'");
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
		    				rs.getString("picture_name"));
		    		list.add(st);
		    	}
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
