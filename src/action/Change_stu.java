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
	
	public Student getStuc() {
		return stuc;
	}

	public void setStuc(Student stuc) {
		this.stuc = stuc;
	}

	@Override
	public String execute() throws Exception{
		
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      String sql = "update stu_inf set name='"+stuc.getName()+"',"+"sex='"+stuc.getSex()+"',"+"age='"+stuc.getAge()+"',"+"benke_major="+stuc.getBenke_major()+"',"+"wish_major='"+stuc.getWish_major()+"',"+"zhibo='"+stuc.getZhibo()+"',"+"wish_class='"+stuc.getWish_class()+"',"+"bein_class='"+stuc.getBein_class()+"',"+"score='"+stuc.getScore()+"',"+"honor='"+stuc.getHonor()+"',"+"self_intro='"+stuc.getSelf_intro()+"',"+"tel='"+stuc.getTel()+"',"+"email='"+stuc.getEmail()+"'" +  " where id='"+stuc.getId() +"'";
	      try {
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
