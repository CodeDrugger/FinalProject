package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.Message_Service;
import domain.Student;
import domain.Teacher;
//import packagea.Book;

public class Show_tea implements Action {
	private Teacher teas; //传入teas.id
	private Student stu_select=new Student();
	private String id_in;
	private String stu_id;
	private String stu_name;
	private String stu_attentioned_tea;
	private String message;
	//学生选老师
	public String Attention_on_tea(){//需要传参数 tea.rate tea.attentioned_me stu_select.attentioned_tea teas.id teas.name stu_selected.id name 
			  String ret = SUCCESS;
		      Connection con = null;
		      Statement stmt = null;
		      String tea_beiguan = teas.getAttentioned_me()+"/"+stu_select.getId();
		      //格式 /name id 0:待定 1:同一 2:不同意
		      int rate=Integer.parseInt(teas.getRate());
		      rate++;
		      String rates=rate+"";
		      String stu_guan = stu_select.getAttentioned_tea()+"/"+teas.getId();
		      String sql_stu = "update stu_inf set attentioned_tea='"+stu_guan+ "' where id='"+stu_select.getId() +"'";
		      String sql_tea = "update tea_inf set rate='"+rates+"',attentioned_me='"+tea_beiguan+ "' where id='"+teas.getId() +"'";
		      Message_Service m=new Message_Service();
		      m.set(teas.getId(),stu_select.getId()+"^&^"+stu_select.getName()+"^&^"+"关注了你");
		      if(stu_select.getAttentioned_tea().contains(teas.getId()))
		      {
		    	  return "has_selected";
			  }
		      try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
		      try{   
		    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
		    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
		          stmt=con.createStatement();   
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
		        
		
		return ret;
		}
		
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Teacher getTeas() {
		return teas;
	}
	public void setTeas(Teacher teas) {
		this.teas = teas;
	}


	public Student getStu_select() {
		return stu_select;
	}

	public void setStu_select(Student stu_select) {
		this.stu_select = stu_select;
	}

	

	public String getId_in() {
		return id_in;
	}

	public void setId_in(String id_in) {
		this.id_in = id_in;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_attentioned_tea() {
		return stu_attentioned_tea;
	}

	public void setStu_attentioned_tea(String stu_attentioned_tea) {
		this.stu_attentioned_tea = stu_attentioned_tea;
	}
	
}
