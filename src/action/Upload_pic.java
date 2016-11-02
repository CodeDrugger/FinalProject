package action;
import java.io.File;
import com.opensymphony.xwork2.Action;
import org.apache.commons.io.FileUtils;
import com.opensymphony.xwork2.ActionContext;

public class Upload_pic implements Action{
    private File image; //上传的文件
    private String imageFileName; //文件名称
    private String imageContentType; //文件类型
    private String id;
    private String visitfile;
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVisitfile() {
		return visitfile;
	}

	public void setVisitfile(String visitfile) {
		this.visitfile = visitfile;
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

	public String execute() throws Exception {
		id = "22";
        String realpath = "C:/bigproject/FinalProject/WebContent/photos/"+id;
        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
        System.out.println("realpath: "+realpath);
        if (image != null) {
            File savefile = new File(new File(realpath), imageFileName);
            if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            FileUtils.copyFile(image, savefile);
            ActionContext.getContext().put("message", "文件上传成功");
        }
        visitfile = "photos/"+id+"/"+imageFileName;
        return "success";
    }    
}