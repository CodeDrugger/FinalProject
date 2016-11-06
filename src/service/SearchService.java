package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import domain.Search;
import domain.Student;
import domain.Teacher;

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
		    				rs.getString("picture_name"),
		    				rs.getString("selected_tea"),
		    				rs.getString("attentioned_tea"),
		    				rs.getString("attentioned_me"),
		    				rs.getString("state"));
		    		list.add(st);
		    	}
		    }
		    else if (search.getUser() == 1)//学生执行搜索 
		    {
		    	/*
		    	 * "鲁棒控制","先进机电","智能控制","飞行器地面测试","飞行器导航","时滞不确定系统","高精度运动",
		    			"滤波理论","线性系统","磁浮轴承","增益切换","增益协调","间歇故障诊断","蒙特卡洛方法","多传感器融合数据",
		    			"在轨运行","深空探测器","自主故障诊断","数字超声成像","先进分布式仿真","特殊网络化控制","非线性滤波",
		    			"模糊控制","系统辨识","博弈与控制 ",
		    	 */
		    	String[] matchmap = {"模式识别","机器学习","医学图像处理","航天器视觉分析及装置","自然语言处理",
		    			"机器翻译","网络信息处理","人工智能","语音识别","音频信息处理","软件工程","复杂大系统计算",
		    			"虚拟现实","系统建模","生物特征","生物计算","数据挖掘","生物信息","图像处理","嵌入式系统",
		    			"计算机视觉","多媒体","人机交互","大数据","脑机接口","软件错误","软件缺陷","内容安全","语音合成",
		    			"文本过滤","容错计算","信息存储","普适计算","可信计算","移动计算","网络挖掘","健康信息","物联网",
		    			"无线传感器","计算机系统结构","增强现实","虚拟现实","混沌密码学","情感分析","文本挖掘","云计算",
		    			"分布式计算","人机交互","深度学习","视觉跟踪","图像增强","计算机","信息安全","生物信息","测控",
		    			"光电","飞行器","工程力学","电子","机械","材料","焊接","能源","核","热","电气","化学","物理",
		    			"数学","管理","社会","国际","土木","建筑","给排水","环境","交通","道路","软件","法学","语",
		    			"食品","信息","通信","生物","男","女"};
		    	for (String s:matchmap)
		    	{
		    		if (k.contains(s))
		    		{
		    			k = s;
		    			break;
		    		}		    			
		    	}
		    	ResultSet rs = stmt.executeQuery("select * from tea_inf where "
		    			+ "name like '%" + k + "%' or "
		    			+ "sex like '%" + k + "%' or "
		    			+ "research_field like '%" + k + "%' or "
		    			+ "college like '%" + k + "%' or "
		    			+ "xueyuan like '%" + k + "%' or "
		    			+ "major like '%" + k + "%' or "
		    			+ "self_intro like '%" + k + "%'");
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
		    				rs.getString("students"));
		    		list.add(tr);
		    	}
			}
		    connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
