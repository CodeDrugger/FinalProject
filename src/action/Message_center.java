package action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;

import domain.Message;
import domain.Message_Service;
import domain.Teacher;

public class Message_center implements Action {
	List<Message> show = new ArrayList<>();
	private String id;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Message_Service m = new Message_Service();
		String message=null;
		message=m.get(id);
		System.out.println(id);
		System.out.println(message);
		if(message.contains("@@"))
			message=message.replaceAll("@@", "");
		String mid[]=message.split("##");
		int len=mid.length;
		for(int i=0;i<len;i++)
		{
			Message mm=new Message();
			String[] s=mid[i].split("\\^\\&\\^");
			mm.setId(s[0]);
			mm.setName(s[1]);
			mm.setMessage(s[2]);
			show.add(mm);
		}
		
		return SUCCESS;
	}
	
	public List<Message> getShow() {
		return show;
	}

	public void setShow(List<Message> show) {
		this.show = show;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
