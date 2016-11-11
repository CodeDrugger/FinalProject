package action;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Teacher;

public class Change_tea implements Action {
	private Teacher teac;
	private String id;
	
	public Teacher getTeac() {
		return teac;
	}

	public void setTeac(Teacher teac) {
		this.teac = teac;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String Show_tea(){
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
	          rst = stmt.executeQuery("select * from tea_inf where id='"+teac.getId()+"'");
	        	  while(rst.next())
	        	  {
	        		  teac.setEnrollment(rst.getString("enrollment"));
	        		  teac.setIn_enrollment(rst.getString("in_enrollment"));
	        		  teac.setName(rst.getString("name"));
	        		  teac.setSex(rst.getString("sex"));
	        		  teac.setId(rst.getString("id"));
	        		  teac.setPicture_name(rst.getString("picture_name"));
	        		  teac.setSelf_intro(rst.getString("self_intro"));
	        		  teac.setResearch_field(rst.getString("research_field"));
	        		  teac.setCollege(rst.getString("college"));
	        		  teac.setXueyuan(rst.getString("xueyuan"));
	        		  teac.setMajor(rst.getString("major"));
	        		  teac.setTel(rst.getString("tel"));
	        		  teac.setEmail(rst.getString("email"));
	        		  teac.setAttentioned_me(rst.getString("attentioned_me"));
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
	@Override
	public String execute() throws Exception{
		
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      //ResultSet rst = null;
	      String sql = "update tea_inf set "
	    		+"sex='"+teac.getSex()+"',"
	    	    +"name='"+teac.getName()+"',"
	    		+"self_intro='"+teac.getSelf_intro()+"',"
	      		+"research_field='"+teac.getResearch_field()+"',"
	    		+"college='"+teac.getCollege()+"',"+"xueyuan='"+teac.getXueyuan()+"',"
	      		+"major='"+teac.getMajor()+"',"
	    		+"tel='"+teac.getTel()+"',"
	      		+"email='"+teac.getEmail()+"'" 
	    		+ " where id='"+teac.getId() +"'";	     
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
