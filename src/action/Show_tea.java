package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Teacher;

public class Show_tea implements Action {
	private  Teacher teas;
	
	
	public String Return_profile(){
		return "return_stu";
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

}
