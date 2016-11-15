package action;

import com.opensymphony.xwork2.Action;

public class MainPage implements Action {
	private String id;
	private String userclass;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserclass() {
		return userclass;
	}
	public void setUserclass(String userclass) {
		this.userclass = userclass;
	}
	@Override
	public String execute() throws Exception {
		if (getUserclass().equals("1"))
			return "teacher";
		else 
			return "student";
	}

}
