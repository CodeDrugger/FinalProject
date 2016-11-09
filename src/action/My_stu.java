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


public class My_stu implements Action {
	private String id_in;
	private Teacher teas;
	private Student stu;
	List<Student> select_stu = new ArrayList<>();
    List<Student> attention_stu = new ArrayList<>();
    List<Student> attention_me = new ArrayList<>();
    
	private String stu_inf_id;
	private Student stu_inf;
	
	private String teacher_id;
	private String student_id;
	
	
	public String Attention_stu(){
		//need things teacher id student id
		 
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String stu_name = null;
	      String stu_id = null;
	      String stu_attentioned_me = null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_attentioned_stu = null;
	      
	      
	      stu_id = student_id;
	      tea_id = teacher_id;
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from tea_inf where id='"+tea_id+"'");
	          while(rst.next())
	          {
	       		  tea_name = rst.getString("name");
	       		  tea_id=rst.getString("id");
	       		  tea_attentioned_stu=rst.getString("attentioned_stu");
	       	  }
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
      	      {
      		  stu_name = rst.getString("name");
      		  stu_id = rst.getString(("id"));
      		  stu_attentioned_me = rst.getString("attentioned_me");
      	      }
	          if(tea_attentioned_stu.contains(stu_name+" "+stu_id))
		      		return "has attentioned";
		      String stu_beiguan = stu_attentioned_me+"/"+stu_name+" "+stu_id;
		      //格式 /name id 0:待定 1:同一 2:不同意
		      String tea_guan = tea_attentioned_stu+"/"+tea_name+" "+tea_id;
		      String sql_stu = "update stu_inf set attentioned_me='"+stu_beiguan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set attentioned_stu='"+tea_guan+ "' where id='"+tea_id +"'";
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
	public String Cancel_attention(){
		//need things teacher id student id	      
	      String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String stu_name = null;
	      String stu_id = null;
	      String stu_attentioned_me = null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_attentioned_stu = null;
	      
	      
	      stu_id = student_id;
	      tea_id = teacher_id;
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from tea_inf where id='"+tea_id+"'");
	          while(rst.next())
	          {
	       		  tea_name = rst.getString("name");
	       		  tea_id=rst.getString("id");
	       		  tea_attentioned_stu=rst.getString("attentioned_stu");
	       	  }
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
    	      {
    		  stu_name = rst.getString("name");
    		  stu_id = rst.getString(("id"));
    		  stu_attentioned_me = rst.getString("attentioned_me");
    	      }
	          if(!tea_attentioned_stu.contains(stu_name+" "+stu_id))
		      		return "not attentioned";
		      String stu_beiguan = stu_attentioned_me.replaceAll("/"+tea_name+" "+tea_id,"");
		      //格式 /name id 0:待定 1:同一 2:不同意
		      String tea_guan = tea_attentioned_stu.replaceAll("/"+stu_name+" "+stu_id,"");
		      String sql_stu = "update stu_inf set attentioned_me='"+stu_beiguan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set attentioned_stu='"+tea_guan+ "' where id='"+tea_id +"'";
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
	public String Choose_stu(){
		//need things teacher id student id
	      String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String stu_name = null;
	      String stu_id = null;
	      String stu_attentioned_me = null;
	      String stu_attentioned_tea = null;
	      String stu_selected_tea = null;
	      String stu_selected_me =null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_attentioned_stu = null;
	      String tea_selected_stu = null;
	      String tea_enrollment = null;
	      String tea_in_enrollment = null;
	      int tea_num1;
	      int tea_num2;
	      
	      
	      stu_id = student_id;
	      tea_id = teacher_id;
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from tea_inf where id='"+tea_id+"'");
	          while(rst.next())
	          {
	       		  tea_name = rst.getString("name");
	       		  tea_id=rst.getString("id");
	       		  tea_selected_stu=rst.getString("selected_stu");
	       		  tea_attentioned_stu = rst.getString("attentioned_stu");
	       		  tea_enrollment = rst.getString("enrollment");
	       		  tea_in_enrollment = rst.getString("in_enrollment");
	       	  }
	          
	          tea_num1 = Integer.parseInt(tea_in_enrollment);
	          tea_num2 = Integer.parseInt(tea_enrollment);
	          if(tea_num1>=tea_num2)
	        	  return "teacher full";
	          else 
	          {
	        	  tea_num1++;
	        	  tea_in_enrollment = tea_num1+"";
	          }
	          
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
    	      {
    		  stu_name = rst.getString("name");
    		  stu_id = rst.getString(("id"));
    		  stu_selected_tea = rst.getString("selected_tea");
    		  stu_selected_me = rst.getString("selected_me");
    	      }
	          if(!stu_selected_tea.contains(tea_name+" "+tea_id))
	        	  return "student not select";
	          if(tea_selected_stu.contains(stu_name+" "+stu_id))
		      		return "has selected";
		      String stu_beiguan = stu_selected_me+"/"+stu_name+" "+stu_id;
		      String tea_guan = tea_selected_stu+"/"+stu_name+" "+stu_id;
		      String sql_stu = "update stu_inf set selected_me='"+stu_beiguan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set selected_stu='"+tea_guan+"',in_enrollment='"+tea_in_enrollment+"' where id='"+tea_id +"'";
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
	
	public String Mytea_inf() {
		//need tea_inf_id  id_in
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
	          rst = stmt.executeQuery("select * from stu_inf where id='"+stu_inf_id+"'");
	        	  while(rst.next())
	        	  {
	        		  stu.setId(rst.getString("id"));
	        		  stu.setName(rst.getString("name"));
	        		  stu.setSex(rst.getString("sex"));
	        		  stu.setAge(rst.getString("age"));
	        		  stu.setBenke_major(rst.getString("benke_major"));
	        		  stu.setWish_major(rst.getString("wish_major"));
	        		  stu.setZhibo(rst.getString("zhibo"));
	        		  stu.setWish_class(rst.getString("wish_class"));
	        		  stu.setBein_class(rst.getString("bein_class"));
	        		  stu.setScore(rst.getString("score"));
	        		  stu.setHonor(rst.getString("honor"));
	        		  stu.setSelf_intro(rst.getString("self_intro"));
	        		  stu.setTel(rst.getString("tel"));
	        		  stu.setEmail(rst.getString("email"));
	        		  stu.setAttentioned_me(rst.getString("attentioned_me"));
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
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      //ResultSet rst2 = null;
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
	          rst = stmt.executeQuery("select * from tea_inf where id='"+id_in+"'");
	          while(rst.next())
	          {
	        	 am = rst.getString("attentioned_me");
	        	 at = rst.getString("attentioned_stu");
	        	 st = rst.getString("selected_stu");
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
	        	 Student t = new Student();
	        	 String s[] = aml[i].split(" ");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 select_stu.add(t);
	          }	  
	          for(i=0;i<len2;i++)
	          {
	        	 Student t = new Student();
	        	 String s[] = atl[i].split(" ");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 attention_stu.add(t);
	          }	  
	          for(i=0;i<len3;i++)
	          {
	        	 Student t = new Student();
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
	public List<Student> getSelect_stu() {
		return select_stu;
	}
	public void setSelect_stu(List<Student> select_stu) {
		this.select_stu = select_stu;
	}
	public List<Student> getAttention_stu() {
		return attention_stu;
	}
	public void setAttention_stu(List<Student> attention_stu) {
		this.attention_stu = attention_stu;
	}
	public List<Student> getAttention_me() {
		return attention_me;
	}
	public void setAttention_me(List<Student> attention_me) {
		this.attention_me = attention_me;
	}
	public String getStu_inf_id() {
		return stu_inf_id;
	}
	public void setStu_inf_id(String stu_inf_id) {
		this.stu_inf_id = stu_inf_id;
	}
	public Student getStu_inf() {
		return stu_inf;
	}
	public void setStu_inf(Student stu_inf) {
		this.stu_inf = stu_inf;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	
	
	
}
