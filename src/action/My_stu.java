package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.Message_Service;
import domain.Student;
import domain.Teacher;
import service.SendMail;


public class My_stu implements Action {
	private String id_in;
	private Teacher teas=new Teacher();
	private Student stu=new Student();
	List<Student> select_stu = new ArrayList<>();
    List<Student> attention_stu = new ArrayList<>();
    List<Student> attention_me = new ArrayList<>();
    List<Student> selected_me = new ArrayList<>();
    
	private String stu_inf_id;
	private Student stu_inf=new Student();
	
	private String teacher_id;
	private String student_id;
	private String message;
	
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
	      String stu_rate=null;
	      String stu_email=null;
	      
	      stu_id = student_id;
	      tea_id = teacher_id;
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
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
      		  stu_name = rst2.getString("name");
      		  stu_id = rst2.getString(("id"));
      		  stu_attentioned_me = rst2.getString("attentioned_me");
      		  stu_rate=rst2.getString("rate");
      		  stu_email=rst2.getString("email");
      	      }
	          int rate=Integer.parseInt(stu_rate);
	          rate++;
	          stu_rate=rate+"";
	          if(tea_attentioned_stu.contains(stu_name+"@.@"+stu_id))
		      {
	        	  message="已关注该学生";
	        	  return "has attentioned";
		      }
	          Message_Service m=new Message_Service();
		      m.set(stu_id,tea_id+"^&^"+tea_name+"^&^"+"关注了你");
		      String stu_beiguan = stu_attentioned_me+"/"+tea_name+"@.@"+tea_id;
		      //格式 /name id 0:待定 1:同一 2:不同意
		      String tea_guan = tea_attentioned_stu+"/"+stu_name+"@.@"+stu_id;
		      String sql_stu = "update stu_inf set rate='"+stu_rate+"',attentioned_me='"+stu_beiguan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set attentioned_stu='"+tea_guan+ "' where id='"+tea_id +"'";
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
	SendMail s = new SendMail();
	s.send_mail(stu_email,"有新导师关注了你!(来自研究生导师互选系统)","导师："+tea_name+"关注了你");
	message="成功关注该学生";
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
	      String stu_rate=null;
	      String stu_email=null;
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
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
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
	    		  stu_name = rst2.getString("name");
	    		  stu_id = rst2.getString(("id"));
	    		  stu_attentioned_me = rst2.getString("attentioned_me");
	    		  stu_rate=rst2.getString("rate");
	    		  stu_email=rst2.getString("email");
    	      }
	          int rate=Integer.parseInt(stu_rate);
	          rate--;
	          stu_rate=rate+"";
		      String stu_beiguan = stu_attentioned_me.replaceAll("/"+tea_name+"@.@"+tea_id,"");
		      //格式 /name id 0:待定 1:同一 2:不同意
		      
		      Message_Service m=new Message_Service();
		      m.set(stu_id,tea_id+"^&^"+tea_name+"^&^"+"取消关注了你");
		      String tea_guan = tea_attentioned_stu.replaceAll("/"+stu_name+"@.@"+stu_id,"");
		      String sql_stu = "update stu_inf set rate='"+stu_rate+"',attentioned_me='"+stu_beiguan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set attentioned_stu='"+tea_guan+ "' where id='"+tea_id +"'";
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
	message="已取消关注该学生";
	SendMail s = new SendMail();
	s.send_mail(stu_email,"有导师取消了对你的关注(来自研究生导师互选系统)","导师："+tea_name+"取消了对你的关注");
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
	      //String stu_attentioned_me = null;
	     // String stu_attentioned_tea = null;
	      String stu_selected_tea = null;
	      String stu_selected_me =null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_attentioned_stu = null;
	      String tea_selected_stu = null;
	      String tea_enrollment = null;
	      String tea_in_enrollment = null;
	      String stu_state=null;
	      String stu_email=null;
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
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
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
	          {
	        	  message = "您的名额已满";
	        	  return "teacher full";
	          }
	          else 
	          {
	        	  tea_num1++;
	        	  tea_in_enrollment = tea_num1+"";
	          }
	          
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
    	      {
	    		  stu_name = rst2.getString("name");
	    		  stu_id = rst2.getString(("id"));
	    		  stu_selected_tea = rst2.getString("selected_tea");
	    		  stu_selected_me = rst2.getString("selected_me");
	    		  stu_state=rst2.getString("state");
	    		  stu_email=rst2.getString("email");
    	      }
	          if(stu_state==null)
	        	  ;
	          else if(stu_state.equals("1"))
	          {
	        	  setMessage("该学生已完成互选");
	        	  return "has been selected";//该学生已经和导师完成互选了
	          }
	          if(!tea_attentioned_stu.contains(stu_name+"@.@"+stu_id))
	          {
	        	  message="不能选择你未关注的学生";
	        	  return "can't choose stu which you don't attention";
	          }
	          Message_Service m=new Message_Service();
		      m.set(stu_id,tea_id+"^&^"+tea_name+"^&^"+"选择了你"); 
		      String stu_beiguan = stu_selected_me+"/"+tea_name+"@.@"+tea_id;
		             stu_selected_tea="/"+tea_name+"@.@"+tea_id;
		      String tea_guan = tea_selected_stu+"/"+stu_name+"@.@"+stu_id;
		      String sql_stu = "update stu_inf set selected_me='"+stu_beiguan+"',selected_tea='"+stu_selected_tea+ "',state='1'"+" where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set selected_stu='"+tea_guan+"',in_enrollment='"+tea_in_enrollment+"' where id='"+tea_id +"'";
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
	setMessage("选择学生成功");     
	SendMail s = new SendMail();
	s.send_mail(stu_email,"有导师选择了你!(来自研究生导师互选系统)","导师："+tea_name+"选择了你"+"，你已经成功完成了和导师的互选，good good study，day day up！");
	return ret;
	}
	
	public String Mystu_inf() {
		//need tea_inf_id  id_in
	
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//所需输入 id_in 
		String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      //ResultSet rst2 = null;
	      String am = null;
	      String at = null;
	      String st = null;
	      String sm = null;
	      try { 
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from tea_inf where id='"+id_in+"'");
	          while(rst.next())
	          {
	        	 am = rst.getString("attentioned_me");
	        	 at = rst.getString("attentioned_stu");
	        	 st = rst.getString("selected_stu");
	        	 sm = rst.getString("selected_me");
	        	 if(am==null)
	        		 System.out.println("boom");
	        	 teas.setAttentioned_me(am);
	        	 teas.setAttentioned_stu(at);
	        	 teas.setSelected_stu(st);
	        	 teas.setSelected_me(sm);
	          }
	          //对字符串进行处理
	          
	          String aml[] = am.split("/");
	          String atl[] = at.split("/");
	          String stl[] = st.split("/");
	          String sml[] = sm.split("/");
	          //提示信息的添加
	          int len1 = aml.length;
	          int len2 = atl.length;
	          int len3 = stl.length;
	          int len4 = sml.length;
	          
	          int i = 0;
	        
	          for(i=0;i<len1;i++)
	          {
	        	 Student t = new Student();
	        	 if(aml[i].equals("")||aml[i].equals(" "))
	        		 continue;
	        	 String s[] = aml[i].split("@.@");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 t.setPicture_name(getpicture(s[1]));
	        	 t.setSelf_intro(get_self_intro(s[1]));
	        	 attention_me.add(t);
	          }	  
	          for(i=0;i<len2;i++)
	          {
	        	 Student t = new Student();
	        	 if(atl[i].equals("")||atl[i].equals(" "))
	        		 continue;
	        	 String s[] = atl[i].split("@.@");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 t.setPicture_name(getpicture(s[1]));
	        	 t.setSelf_intro(get_self_intro(s[1]));
	        	 attention_stu.add(t);
	          }	  
	          for(i=0;i<len3;i++)
	          {
	        	 Student t = new Student();
	        	 if(stl[i].equals("")||stl[i].equals(" "))
	        		 continue;
	        	 String s[] = stl[i].split("@.@");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 t.setPicture_name(getpicture(s[1]));
	        	 t.setSelf_intro(get_self_intro(s[1]));
	        	 select_stu.add(t);
	          }	  
	          
	          for(i=0;i<len4;i++)
	          {
	        	 Student t = new Student();
	        	 if(sml[i].equals("")||sml[i].equals(" "))
	        		 continue;
	        	 String s[] = sml[i].split("@.@");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 t.setPicture_name(getpicture(s[1]));
	        	 t.setSelf_intro(get_self_intro(s[1]));
	        	 selected_me.add(t);
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
	public String getpicture(String id)
	{
		  String picture="";
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
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from stu_inf where id='"+id+"'");
	        	  while(rst.next())
	        	  {
	        		  picture=rst.getString("picture_name");
	        	  }	        	  

	        }catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
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
		return picture;
	}
	public String get_self_intro(String id)
	{
		  String self_intro="";
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
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from stu_inf where id='"+id+"'");
	        	  while(rst.next())
	        	  {
	        		  self_intro=rst.getString("self_intro");
	        	  }	        	  

	        }catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
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
		return self_intro;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<Student> getSelected_me() {
		return selected_me;
	}
	public void setSelected_me(List<Student> selected_me) {
		this.selected_me = selected_me;
	}
	
	
	
}
