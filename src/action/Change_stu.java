package action;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Student;

public class Change_stu implements Action {
	private Student stuc;
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Student getStuc() {
		return stuc;
	}

	public void setStuc(Student stuc) {
		this.stuc = stuc;
	}

	public String Show_stu(){
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
	          rst = stmt.executeQuery("select * from stu_inf where id='"+stuc.getId()+"'");
	        	  while(rst.next())
	        	  {
	        		  stuc.setName(rst.getString("name"));
	        		  stuc.setSex(rst.getString("sex"));
	        		  stuc.setAge(rst.getString("age"));
	        		  stuc.setBenke_major(rst.getString("benke_major"));
	        		  stuc.setWish_major(rst.getString("wish_major"));
	        		  stuc.setZhibo(rst.getString("zhibo"));
	        		  stuc.setWish_class(rst.getString("wish_class"));
	        		  stuc.setBein_class(rst.getString("bein_class"));
	        		  stuc.setScore(rst.getString("score"));
	        		  stuc.setHonor(rst.getString("honor"));
	        		  stuc.setSelf_intro(rst.getString("self_intro"));
	        		  stuc.setTel(rst.getString("tel"));
	        		  stuc.setEmail(rst.getString("email"));
	        		  stuc.setPicture_name(rst.getString("picture_name"));
	        		  stuc.setId(rst.getString("id"));
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
	
	public String execute() throws Exception{
		
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      //ResultSet rst = null;
	      String sql = "update stu_inf set "
	      		  + "name='"+stuc.getName()+"',"
	    		  +"sex='"+stuc.getSex()+"',"
	      		  +"age='"+stuc.getAge()+"',"
	    		  +"benke_major='"+stuc.getBenke_major()+"',"
	      		  +"wish_major='"+stuc.getWish_major()+"',"
	    		  +"zhibo='"+stuc.getZhibo()+"',"
	      		  +"wish_class='"+stuc.getWish_class()+"',"
	    		  +"bein_class='"+stuc.getBein_class()+"',"
	      		  +"score='"+stuc.getScore()+"',"
	    		  +"honor='"+stuc.getHonor()+"',"
	      		  +"self_intro='"+stuc.getSelf_intro()+"',"
	    		  +"tel='"+stuc.getTel()+"',"
	      		  +"email='"+stuc.getEmail()+"'" 
	    		  + " where id='"+stuc.getId() +"'";
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          //int i=
	          stmt.executeUpdate(sql);
	          
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
