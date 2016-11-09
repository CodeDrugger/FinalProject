package action;

import com.opensymphony.xwork2.Action;

import domain.Questions;
import service.QuestionService;

public class Create_ques implements Action {
	private Questions q;
	
	public Questions getQ() {
		return q;
	}
	public void setQ(Questions q) {
		this.q = q;
	}
	@Override
	public String execute() throws Exception {
		QuestionService qs = new QuestionService();
		qs.doSaveQues(q);
		return SUCCESS;
	}

}
