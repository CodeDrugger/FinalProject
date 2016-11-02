package action;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Teacher;

public class Change_tea implements Action {
	private Teacher teac;
	
	public Teacher getTeac() {
		return teac;
	}

	public void setTeac(Teacher teac) {
		this.teac = teac;
	}

	@Override
	public String execute() throws Exception{
		
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      String sql = "update tea_inf set name='"+teac.getName()+"',"+"sex='"+teac.getSex()+"',"+"name='"+teac.getPicture_name()+"',"+"self_intro="+teac.getSelf_intro()+"',"+"research_field='"+teac.getResearch_field()+"',"+"college='"+teac.getCollege()+"',"+"xueyuan='"+teac.getXueyuan()+"',"+"major='"+teac.getMajor()+"',"+"tel='"+teac.getTel()+"',"+"email='"+teac.getEmail()+"'" + " where id='"+teac.getId() +"'";	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
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
