package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Student;
import domain.Teacher;

public class Show_stu implements Action {
	private Student stus;
	private Teacher tea_select;
	private Student id_in;
	private String tea_id;
	private String tea_name;
	private String tea_attentioned_stu;
	
	public Student getStus() {
		return stus;
	}
	public void setStus(Student stus) {
		this.stus = stus;
	}
	
	public Teacher getTea_select() {
		return tea_select;
	}
	public void setTea_select(Teacher tea_select) {
		this.tea_select = tea_select;
	}
	public Student getId_in() {
		return id_in;
	}
	public void setId_in(Student id_in) {
		this.id_in = id_in;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getTea_attentioned_stu() {
		return tea_attentioned_stu;
	}
	public void setTea_attentioned_stu(String tea_attentioned_stu) {
		this.tea_attentioned_stu = tea_attentioned_stu;
	}
	//老师选学生
	public String Attention_on_tea(){//需要传参数 tea.attentioned_me stu_select.attentioned_tea teas.id teas.name stu_selected.id name 
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      //ResultSet rst = null;
	      if(tea_select.getAttentioned_stu().contains(stus.getName()+" "+stus.getId()))
	      		return "has_selected";
	      String stu_beiguan = stus.getAttentioned_me()+"/"+tea_select.getName()+" "+tea_select.getId();
	      //格式 /name id 0:待定 1:同一 2:不同意
	      String tea_guan = tea_select.getAttentioned_stu()+"/"+stus.getName()+" "+stus.getId();
	      String sql_tea = "update tea_inf set attentioned_tea='"+tea_guan+ "' where id='"+tea_select.getId() +"'";
	      String sql_stu = "update stu_inf set attentioned_me='"+stu_beiguan+ "' where id='"+stus.getId() +"'";
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          stmt.executeUpdate(sql_tea);
	          stmt.executeUpdate(sql_stu);
	          
	        }catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            ret = ERROR;
	        }finally{
	            try{
	            	if(stmt!=null)
	            		stmt.close();
	            	if(con!=null)           
	                    con.close();
	            	
	                } catch (SQLException e) {
	                    // TODO Auto-generated catch block
	                    e.printStackTrace();
	                }   
	            }
	        
	
	return ret;
	}
	public String execute() throws Exception {
		
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      try { 
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from stu_inf where id='"+stus.getId()+"'");
	        	  while(rst.next())
	        	  {
	        		  stus.setId(rst.getString("id"));
	        		  stus.setName(rst.getString("name"));
	        		  stus.setSex(rst.getString("sex"));
	        		  stus.setAge(rst.getString("age"));
	        		  stus.setBenke_major(rst.getString("benke_major"));
	        		  stus.setWish_major(rst.getString("wish_major"));
	        		  stus.setZhibo(rst.getString("zhibo"));
	        		  stus.setWish_class(rst.getString("wish_class"));
	        		  stus.setBein_class(rst.getString("bein_class"));
	        		  stus.setScore(rst.getString("score"));
	        		  stus.setHonor(rst.getString("honor"));
	        		  stus.setSelf_intro(rst.getString("self_intro"));
	        		  stus.setTel(rst.getString("tel"));
	        		  stus.setEmail(rst.getString("email"));
	        		  stus.setAttentioned_me(rst.getString("attentioned_me"));
	        	  }
	         rst2 = stmt.executeQuery("select * from tea_inf where id='"+id_in+"'");
	         while(rst2.next())
       	  {
       		  tea_name = rst.getString("name");
       		  tea_id = rst.getString(("id"));
       		  tea_attentioned_stu = rst.getString("attentioned_stu");
       	  }

	        	  

	        }catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            ret = ERROR;
	        }finally{
	            try{
	            	if(stmt!=null)
	            		stmt.close();
	            	if(con!=null)           
	                    con.close();
	            	
	                } catch (SQLException e) {
	                    // TODO Auto-generated catch block
	                    e.printStackTrace();
	                }   
	            }
	      
	
	return ret;
	}

}
