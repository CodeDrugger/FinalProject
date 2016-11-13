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
	private String id_in;//主页面传入的学生id
	
	private Teacher teas = new Teacher();
	private Student stu = new Student();
	List<Teacher> select_tea = new ArrayList<>();
    List<Teacher> attention_tea = new ArrayList<>();
    List<Teacher> attention_me = new ArrayList<>();
    
	private String tea_inf_id;
	private Teacher tea_inf;
	
	private String teacher_id;
	private String student_id;
	
	private String message;
	
	
	public String Attention_tea(){
		//need things teacher id student id
		 
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String stu_name = null;
	      String stu_id = null;
	      String stu_attentioned_tea = null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_attentioned_me = null;
	      
	      
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
	       		  tea_attentioned_me=rst.getString("attentioned_me");
	       	  }
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
      	      {
      		  stu_name = rst2.getString("name");
      		  stu_id = rst2.getString(("id"));
      		  stu_attentioned_tea = rst2.getString("attentioned_tea");
      	      }
	          if(stu_attentioned_tea.contains(tea_name+" "+tea_id))
		      {
	        	  message = "已经选过该导师";
	        	  return "has attentioned";
		      }
		      String tea_beiguan = tea_attentioned_me+"/"+stu_name+" "+stu_id;
		      //格式 /name id 0:待定 1:同一 2:不同意
		      String stu_guan = stu_attentioned_tea+"/"+tea_name+" "+tea_id;
		      String sql_stu = "update stu_inf set attentioned_tea='"+stu_guan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set attentioned_me='"+tea_beiguan+ "' where id='"+tea_id +"'";
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
	message = "成功关注该导师";
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
	      String stu_attentioned_tea = null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_attentioned_me = null;
	      
	      
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
	       		  tea_attentioned_me=rst.getString("attentioned_me");
	       	  }
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
    	      {
    		  stu_name = rst2.getString("name");
    		  stu_id = rst2.getString(("id"));
    		  stu_attentioned_tea = rst2.getString("attentioned_tea");
    	      }
	          /*if(!stu_attentioned_tea.contains(tea_name+" "+tea_id))
		      		return "not attentioned";
		      */
		      String tea_beiguan = tea_attentioned_me.replaceAll("/"+stu_name+" "+stu_id,"");
		      //格式 /name id 0:待定 1:同一 2:不同意
		      String stu_guan = stu_attentioned_tea.replaceAll("/"+tea_name+" "+tea_id,"");
		      String sql_stu = "update stu_inf set attentioned_tea='"+stu_guan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set attentioned_me='"+tea_beiguan+ "' where id='"+tea_id +"'";
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
	message = "已取消关注该导师";
	return ret;
	}
	public String Choose_tea(){
		//need things teacher id student id
		String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String stu_name = null;
	      String stu_id = null;
	      String stu_selected_tea = null;
	      String stu_state=null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_selected_me = null;
	      String tea_attentioned_stu = null;
	      //String tea_enrollment = null;
	      //String tea_in_enrollment = null;
	      //int tea_num1;
	      //int tea_num2;
	      
	      
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
	       		  tea_selected_me=rst.getString("selected_me");
	       		  tea_attentioned_stu = rst.getString("attentioned_stu");
	       		  //tea_enrollment = rst.getString("enrollment");
	       		  //tea_in_enrollment = rst.getString("in_enrollment");
	       	  }
	          /*tea_num1 = Integer.parseInt(tea_in_enrollment);
	          tea_num2 = Integer.parseInt(tea_enrollment);
	          if(tea_num1>=tea_num2)
	        	  return "teacher full";
	          else 
	          {
	        	  tea_num1++;
	        	  tea_in_enrollment = tea_num1+"";
	          }
	          */
	          if(!tea_attentioned_stu.contains(stu_name+" "+stu_id))
	          {
	        	  message="该导师未关注你的情况下无法选择该导师";
	        	  return "teacher not attention you";
	          }
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
    	      {
    		  stu_name = rst2.getString("name");
    		  stu_id = rst2.getString(("id"));
    		  stu_selected_tea = rst2.getString("selected_tea");
    		  stu_state=rst2.getString("state");
    	      }
	          if(stu_state.equals("1"))
	          {
	        	  message="你已经和其他导师完成互选";
	        	  return "has been selected";
	          }
	          if(stu_selected_tea.contains(tea_name+" "+tea_id))
		      {
	        	  message="已经选择过该导师";
	        	  return "has selected";
		      }
		      String tea_beiguan = tea_selected_me+"/"+stu_name+" "+stu_id;
		      String stu_guan = stu_selected_tea+"/"+tea_name+" "+tea_id;
		      String sql_stu = "update stu_inf set selected_tea='"+stu_guan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set selected_me='"+tea_beiguan+"' where id='"+tea_id +"'";
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
	message="选择导师成功";
	return ret;
	}
	
	public String Cancel_choose(){
		//need things teacher id student id
		String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rst = null;
	      ResultSet rst2 = null;
	      String stu_name = null;
	      String stu_id = null;
	      String stu_state=null;
	      String stu_selected_tea = null;
	      String tea_name = null;
	      String tea_id = null;
	      String tea_selected_me = null;
	      //String tea_attentioned_stu = null;
	      //String tea_enrollment = null;
	      //String tea_in_enrollment = null;
	      //int tea_num1;
	      //int tea_num2;
	      
	      
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
	       		  tea_selected_me=rst.getString("selected_me");
	       		  //tea_attentioned_stu = rst.getString("attentioned_stu");
	       		  //tea_enrollment = rst.getString("enrollment");
	       		  //tea_in_enrollment = rst.getString("in_enrollment");
	       	  }
	          /*tea_num1 = Integer.parseInt(tea_in_enrollment);
	          tea_num2 = Integer.parseInt(tea_enrollment);
	          if(tea_num1>=tea_num2)
	        	  return "teacher full";
	          else 
	          {
	        	  tea_num1++;
	        	  tea_in_enrollment = tea_num1+"";
	          }
	          */
	          
	          rst2 = stmt.executeQuery("select * from stu_inf where id='"+stu_id+"'");
	          while(rst2.next())
	          {
	        	  stu_name = rst2.getString("name");
	        	  stu_id = rst2.getString(("id"));
	        	  stu_selected_tea = rst2.getString("selected_tea");
	        	  stu_state=rst2.getString("state");
	          }
	          
	          /*if(!stu_selected_tea.contains(tea_name+" "+tea_id))
		      {
	        	  setMessage("");
	        	  return "not selected";
		      }
		      */
	          if(stu_state.equals("1"))
	          {
	        	  message="你已经和导师完成互选";
	        	  return "has been selected";
	          }
		      String tea_beiguan = tea_selected_me.replaceAll("/"+stu_name+" "+stu_id,"");
		      String stu_guan = stu_selected_tea.replaceAll("/"+tea_name+" "+tea_id,"");
		      String sql_stu = "update stu_inf set selected_tea='"+stu_guan+ "' where id='"+stu_id +"'";
		      String sql_tea = "update tea_inf set selected_me='"+tea_beiguan+"' where id='"+tea_id +"'";
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
	setMessage("已取消选择该导师");
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
	          rst = stmt.executeQuery("select * from tea_inf where id='"+tea_inf_id+"'");
	        	  while(rst.next())
	        	  {
	        		  tea_inf.setEnrollment(rst.getString("enrollment"));
	        		  tea_inf.setIn_enrollment(rst.getString("in_enrollment"));
	        		  tea_inf.setName(rst.getString("name"));
	        		  tea_inf.setSex(rst.getString("sex"));
	        		  tea_inf.setId(rst.getString("id"));
	        		  tea_inf.setPicture_name(rst.getString("picture_name"));
	        		  tea_inf.setSelf_intro(rst.getString("self_intro"));
	        		  tea_inf.setResearch_field(rst.getString("research_field"));
	        		  tea_inf.setCollege(rst.getString("college"));
	        		  tea_inf.setXueyuan(rst.getString("xueyuan"));
	        		  tea_inf.setMajor(rst.getString("major"));
	        		  tea_inf.setTel(rst.getString("tel"));
	        		  tea_inf.setEmail(rst.getString("email"));
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
	        
	          for(int i=0;i<len1;i++)
	          {
	        	 Teacher t = new Teacher();
	        	 if(aml[i].equals("")||aml[i].equals(" "))
	        		 continue;
	        	 String s[] = aml[i].split(" "); 
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 select_tea.add(t);
	          }	  
	          for(int i=0;i<len2;i++)
	          {
	        	 Teacher t = new Teacher();
	        	 if(atl[i].equals("")||atl[i].equals(" "))
	        		 continue;
	        	 String s[] = atl[i].split(" ");  
	        	 t.setName(s[0]);
	        	 t.setId(s[1]);
	        	 attention_tea.add(t);
	          }	  
	          for(int i=0;i<len3;i++)
	          {
	        	 Teacher t = new Teacher();
	        	 if(stl[i].equals("")||stl[i].equals(" "))
	        		 continue;
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

	public String getTea_inf_id() {
		return tea_inf_id;
	}

	public void setTea_inf_id(String tea_inf_id) {
		this.tea_inf_id = tea_inf_id;
	}
	public Teacher getTea_inf() {
		return tea_inf;
	}

	public void setTea_inf(Teacher tea_inf) {
		this.tea_inf = tea_inf;
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
	
	
	
}
