package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Student;
import domain.Teacher;

public class Show_tea implements Action {
	private Teacher teas; //传入teas.id
	private Student stu_select;
	//学生选老师
	public String Attention_on_tea(){//需要传参数 tea.attentioned_me stu_select.attentioned_tea teas.id teas.name stu_selected.id name 
			  String ret = SUCCESS;
		      Connection con = null;
		      Statement stmt = null;
		      if(stu_select.getAttentioned_tea().contains(teas.getName()+" "+teas.getId()))
		      		return "has_selected";
		      String tea_beiguan = teas.getAttentioned_me()+"/"+stu_select.getName()+" "+stu_select.getId();
		      //格式 /name id 0:待定 1:同一 2:不同意
		      String stu_guan = stu_select.getAttentioned_tea()+"/"+teas.getName()+" "+teas.getId();
		      String sql_stu = "update stu_inf set attentioned_tea='"+stu_guan+ "' where id='"+stu_select.getId() +"'";
		      String sql_tea = "update tea_inf set attentioned_me='"+tea_beiguan+ "' where id='"+teas.getId() +"'";
		      try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
		      try{   
		    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
		    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
		          stmt=con.createStatement();   
		          int i1=stmt.executeUpdate(sql_tea);
		          int i2=stmt.executeUpdate(sql_stu);
		          
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
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from tea_inf where id='"+teas.getId()+"'");
	        	  while(rst.next())
	        	  {
	        		  teas.setEnrollment(rst.getString("enrollment"));
	        		  teas.setIn_enrollment(rst.getString("in_enrollment"));
	        		  teas.setName(rst.getString("name"));
	        		  teas.setSex(rst.getString("sex"));
	        		  teas.setId(rst.getString("id"));
	        		  teas.setPicture_name(rst.getString("picture_name"));
	        		  teas.setSelf_intro(rst.getString("self_intro"));
	        		  teas.setResearch_field(rst.getString("research_field"));
	        		  teas.setCollege(rst.getString("college"));
	        		  teas.setXueyuan(rst.getString("xueyuan"));
	        		  teas.setMajor(rst.getString("major"));
	        		  teas.setTel(rst.getString("tel"));
	        		  teas.setEmail(rst.getString("email"));
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
	
	public Teacher getTeas() {
		return teas;
	}
	public void setTeas(Teacher teas) {
		this.teas = teas;
	}
}
