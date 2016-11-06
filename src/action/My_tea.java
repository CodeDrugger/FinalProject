package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.Student;
import domain.Teacher;


public class My_tea implements Action {
	private String id_in;
	private Teacher teas;
	private Student stu;
	List<Teacher> select_tea = new ArrayList<>();
    List<Teacher> attention_tea = new ArrayList<>();
    List<Teacher> attention_me = new ArrayList<>();
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String am = null;
	      String at = null;
	      String st = null;
	      try { 
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from stu_inf where id='"+id_in+"'");
	          while(rst.next())
	          {
	        	 am = rst.getString("attentioned_me");
	        	 at = rst.getString("attentioned_tea");
	        	 st = rst.getString("selected_tea");
	        	 stu.setAttentioned_me(am);
	        	 stu.setAttentioned_tea(at);
	        	 stu.setSelected_tea(st);
	          }
	          //对字符串进行处理
	          
	          String aml[] = am.split("/");
	          String atl[] = at.split("/");
	          String stl[] = st.split("/");
	          //提示信息的添加
	          int len1 = aml.length;
	          int len2 = atl.length;
	          int len3 = stl.length;
	          
	          int i = 0;
	        
	          for(i=0;i<len1;i++)
	          {
	        	 Teacher t = new Teacher();
	        	 String s[] = aml[i].split(" ");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 select_tea.add(t);
	          }	  
	          for(i=0;i<len2;i++)
	          {
	        	 Teacher t = new Teacher();
	        	 String s[] = atl[i].split(" ");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 attention_tea.add(t);
	          }	  
	          for(i=0;i<len3;i++)
	          {
	        	 Teacher t = new Teacher();
	        	 String s[] = stl[i].split(" ");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 attention_me.add(t);
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

	public String getId_in() {
		return id_in;
	}

	public void setId_in(String id_in) {
		this.id_in = id_in;
	}

	public Teacher getTeas() {
		return teas;
	}

	public void setTeas(Teacher teas) {
		this.teas = teas;
	}

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public List<Teacher> getSelect_tea() {
		return select_tea;
	}

	public void setSelect_tea(List<Teacher> select_tea) {
		this.select_tea = select_tea;
	}

	public List<Teacher> getAttention_tea() {
		return attention_tea;
	}

	public void setAttention_tea(List<Teacher> attention_tea) {
		this.attention_tea = attention_tea;
	}

	public List<Teacher> getAttention_me() {
		return attention_me;
	}

	public void setAttention_me(List<Teacher> attention_me) {
		this.attention_me = attention_me;
	}

	
	
}
