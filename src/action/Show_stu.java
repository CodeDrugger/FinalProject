package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;

import domain.Student;
import domain.Teacher;
import service.SendMail;

public class Show_stu implements Action {
	private Student stus;
	private Teacher tea_select;
	private String id_in;
	private String tea_id;
	private String tea_name;
	private String tea_attentioned_stu;
	private String message;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Student getStus() {
		return stus;
	}
	public void setStus(Student stus) {
		this.stus = stus;
	}
	
	public Teacher getTea_select() {
		return tea_select;
	}
	public void setTea_select(Teacher tea_select) {
		this.tea_select = tea_select;
	}
	
	public String getId_in() {
		return id_in;
	}
	public void setId_in(String id_in) {
		this.id_in = id_in;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getTea_attentioned_stu() {
		return tea_attentioned_stu;
	}
	public void setTea_attentioned_stu(String tea_attentioned_stu) {
		this.tea_attentioned_stu = tea_attentioned_stu;
	}
	//老师选学生
	public String Attention_on_stu(){//需要传参数 tea.attentioned_me stu_select.attentioned_tea teas.id teas.name stu_selected.id name 
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      //ResultSet rst = null;
	      String rates=null;
	      String stu_email=null;
	      stu_email=stus.getEmail();
	      rates=stus.getRate();
	      int rate=Integer.parseInt(rates);
	      rate++;
	      rates=rate+"";
	      String stu_beiguan = stus.getAttentioned_me()+"/"+tea_select.getName()+" "+tea_select.getId();
	      //格式 /name id 0:待定 1:同一 2:不同意
	      String tea_guan = tea_select.getAttentioned_stu()+"/"+stus.getName()+" "+stus.getId();
	      String sql_tea = "update tea_inf set attentioned_stu='"+tea_guan+ "' where id='"+tea_select.getId() +"'";
	      String sql_stu = "update stu_inf set rate='"+rates+"',attentioned_me='"+stu_beiguan+ "' where id='"+stus.getId() +"'";
	      if(tea_select.getAttentioned_stu().contains(stus.getName()+" "+stus.getId()))
	      {
	    	  message="已经关注了该学生";
	    	  return "has_selected";
	      }
	      message="成功关注该学生.";
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
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
	        
	SendMail s = new SendMail();
	s.send_mail(stu_email,"有新导师关注了你!(来自研究生导师互选系统)","导师："+tea_select.getName()+"关注了你");
	return ret;
	}
	public String execute() throws Exception {	
		return SUCCESS;
	}

}
