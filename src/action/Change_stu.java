package action;


import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;

import domain.Student;

public class Change_stu implements Action {
	private Student stuc;
	private String id;
	private String message;
	
	private File image; //上传的文件
    private String imageFileName; //文件名称
    private String imageContentType; //文件类型
    private String visitfile;
	public String getMessage() {
		return message;
	}
	
	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getVisitfile() {
		return visitfile;
	}

	public void setVisitfile(String visitfile) {
		this.visitfile = visitfile;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Student getStuc() {
		return stuc;
	}

	public void setStuc(Student stuc) {
		this.stuc = stuc;
	}

	public String Show_stu(){
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
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          rst = stmt.executeQuery("select * from stu_inf where id='"+stuc.getId()+"'");
	        	  while(rst.next())
	        	  {
	        		  stuc.setName(rst.getString("name"));
	        		  stuc.setSex(rst.getString("sex"));
	        		  stuc.setAge(rst.getString("age"));
	        		  stuc.setBenke_major(rst.getString("benke_major"));
	        		  stuc.setWish_major(rst.getString("wish_major"));
	        		  stuc.setZhibo(rst.getString("zhibo"));
	        		  stuc.setWish_class(rst.getString("wish_class"));
	        		  stuc.setBein_class(rst.getString("bein_class"));
	        		  stuc.setScore(rst.getString("score"));
	        		  stuc.setHonor(rst.getString("honor"));
	        		  stuc.setSelf_intro(rst.getString("self_intro"));
	        		  stuc.setTel(rst.getString("tel"));
	        		  stuc.setEmail(rst.getString("email"));
	        		  stuc.setPicture_name(rst.getString("picture_name"));
	        		  stuc.setId(rst.getString("id"));
	        		  stuc.setWish_xueyuan(rst.getString("wish_xueyuan"));
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
	      
	
	return ret;
	}
	
	public String execute() throws Exception{
		  setId(getStuc().getId());
		  String ret = SUCCESS;
	      Connection con = null;
	      Statement stmt = null;
	      //ResultSet rst = null;
	      String type=null;
	      int judge=0;
	      String realpath = "C:/hostadmin/tomcat80/webapps/FinalProject/photos/" + id;
	      //String realpath = "D:/Eclipse/apache-tomcat-9.0.0.M10/webapps/FinalProject/photos/"+id;
	      //String realpath ="C:/Users/daisf/Documents/apache-tomcat-7.0.70/webapps/photos/"+id;
	      //C:\Users\daisf\Documents\apache-tomcat-7.0.70\webapps\FinalProject\photos
	        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
	      System.out.println("realpath: "+realpath);
	      System.out.println(type);
	      if (image != null) {
	    	 judge=1;
	    	 type=imageContentType.split("/")[1];
	         File savefile = new File(new File(realpath), id+"."+type);
	      if (savefile.getParentFile().exists())
	         savefile.getParentFile().delete();
	      savefile.getParentFile().mkdirs();
	      FileUtils.copyFile(image, savefile);
	      message="文件上传成功.";
	      visitfile = "photos/"+id+"/"+id+"."+type;
	        }
	      
	      String sql = "update stu_inf set "
	      		  + "name='"+stuc.getName()+"',"
	    		  +"sex='"+stuc.getSex()+"',"
	      		  +"age='"+stuc.getAge()+"',"
	    		  +"benke_major='"+stuc.getBenke_major()+"',"
	      		  +"wish_major='"+stuc.getWish_major()+"',"
	    		  +"zhibo='"+stuc.getZhibo()+"',"
	      		  +"wish_class='"+stuc.getWish_class()+"',"
	    		  +"bein_class='"+stuc.getBein_class()+"',"
	      		  +"score='"+stuc.getScore()+"',"
	    		  +"honor='"+stuc.getHonor()+"',"
	      		  +"self_intro='"+stuc.getSelf_intro()+"',"
	    		  +"tel='"+stuc.getTel()+"',"
	      		  +"email='"+stuc.getEmail()+"'," 
	      		  +"wish_xueyuan='"+stuc.getWish_xueyuan()+"'"
	    		  + " where id='"+stuc.getId() +"'";
	      String sql2="update stu_inf set picture_name='"+visitfile+"' where id='"+stuc.getId()+"'";
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://115.28.67.141:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
	          //int i=
	          stmt.executeUpdate(sql);
	          if(judge==1)
	        	  stmt.executeUpdate(sql2);
	          
	        }catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            //ret = ERROR;
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
