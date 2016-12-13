package action;

import com.opensymphony.xwork2.Action;

import domain.Answers;
import domain.Questions;
import service.InitQuesService;

public class His_ques implements Action {
	private Questions q;
	private String id;
	private Answers a;
	public Answers getA() {
		return a;
	}
	public void setA(Answers a) {
		this.a = a;
	}
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
