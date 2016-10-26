package action;

import com.opensymphony.xwork2.Action;

public class SignUpInit implements Action {
	private String userclass;
	
	public String getUserclass() {
		return userclass;
	}

	public void setUserclass(String userclass) {
		this.userclass = userclass;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

}
