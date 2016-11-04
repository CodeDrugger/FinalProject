package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Student;

public class Show_stu implements Action {
	private Student stus = new Student();
	private String number1;
	private String number2;
	
	public Student getStus() {
		return stus;
	}
	public void setStus(Student stus) {
		this.stus = stus;
	}
	public String Choose_stu(){
		int i1 = Integer.valueOf(number1).intValue();
		int i2 = Integer.valueOf(number2).intValue();
		if(i1+1>i2)
			return "choose_fail";
		else 
		{
			  String s = i1+1+"";
			  String ret = SUCCESS;
		      Connection con = null;
		      Statement stmt = null;
		      ResultSet rst = null;
		      String sql = "update tea_inf set in_enrollment='"+s+ "' where id='"+teas.getId() +"'";	      
		      try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
		      try{   
		    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
		    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
		          stmt=con.createStatement();   
		          int i=stmt.executeUpdate(sql);
		          
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
	          rst = stmt.executeQuery("select * from stu_inf where id='"+stus.getId()+"'");
	        	  while(rst.next())
	        	  {
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
