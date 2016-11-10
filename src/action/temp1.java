package action;

import com.opensymphony.xwork2.Action;

public class temp1 implements Action {
	private String message;
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		setMessage("lll");
		return SUCCESS;
	}

}
