package action;

import com.opensymphony.xwork2.Action;

import domain.Questions;
import service.InitQuesService;

public class My_ques implements Action {
	private String id;
	private Questions q;
	
	public Questions getQ() {
		return q;
	}
	public void setQ(Questions q) {
		this.q = q;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String execute() throws Exception {
		InitQuesService is = new InitQuesService();
		is.doInitQues(q);
		return SUCCESS;
	}

}
