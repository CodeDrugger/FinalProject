package action;

import com.opensymphony.xwork2.Action;

import domain.Answers;
import service.InitAnsService;

public class Exam_ans implements Action {
	private Answers a;
	private String id;
	public Answers getA() {
		return a;
	}
	public void setA(Answers a) {
		this.a = a;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String execute() throws Exception {
		InitAnsService is = new InitAnsService();
		is.doInitAns(a);
		return null;
	}

}
