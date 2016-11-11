package action;
import java.io.File;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.Action;
import org.apache.commons.io.FileUtils;
import com.opensymphony.xwork2.ActionContext;

public class Upload_pic_tea implements Action{
    private File image; //上传的文件
    private String imageFileName; //文件名称
    private String imageContentType; //文件类型
    private String id;
    private String visitfile;
    
    
	public String execute() throws Exception {
		String ret = SUCCESS;
        String realpath = "C:/Software/WebProject/FinalProject/WebContent/photos_tea/"+id;
        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
        if (image != null) {
            File savefile = new File(new File(realpath), id+".png");
            if (savefile.getParentFile().exists())
            	savefile.getParentFile().delete();
            savefile.getParentFile().mkdirs();
            FileUtils.copyFile(image, savefile);
            ActionContext.getContext().put("message", "文件上传成功");
        }
        visitfile = "photos_tea/"+id+"/"+id+".png";
        
	      Connection con = null;
	      Statement stmt = null;
	      //ResultSet rst = null;
	      String sql = "update tea_inf set picture_name='"+visitfile+"' where id='"+id +"'";
	      try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	      try{   
	    	  //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb", "root", "daidai");
	    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
	          stmt=con.createStatement();   
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



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}    
}