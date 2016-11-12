package action;


import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;

import domain.Teacher;

public class Change_tea implements Action {
	private Teacher teac;
	private String id;
	
	private String message;
	
	private File image; //上传的文件
    private String imageFileName; //文件名称
    private String imageContentType; //文件类型
    private String visitfile;
    
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
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
	      //ResultSet rst2 = null;
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
	      String realpath = "C:/big/FinalProject/WebContent/photos_tea/"+id;
	        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
	      System.out.println("realpath: "+realpath);
	      if (image != null) {
	         File savefile = new File(new File(realpath), id+".png");
	      if (savefile.getParentFile().exists())
	         savefile.getParentFile().delete();
	      savefile.getParentFile().mkdirs();
	      FileUtils.copyFile(image, savefile);
	      message="文件上传成功.";
	        }
	      visitfile = "photos/"+id+"/"+id+".png";
	      String sql = "update tea_inf set "
	    		+"sex='"+teac.getSex()+"',"
	    	    +"name='"+teac.getName()+"',"
	    		+"self_intro='"+teac.getSelf_intro()+"',"
	      		+"research_field='"+teac.getResearch_field()+"',"
	    		+"college='"+teac.getCollege()+"',"+"xueyuan='"+teac.getXueyuan()+"',"
	      		+"major='"+teac.getMajor()+"',"
	    		+"tel='"+teac.getTel()+"',"
	      		+"email='"+teac.getEmail()+"'," 
	      		+"picture_name='"+visitfile+"'"
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
