package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.Action;

import domain.AdvSearch_stu;
import service.AdvSchService_stu;

public class AdvSch_stu implements Action {
	private AdvSearch_stu advsch;
	private ArrayList<Object> list;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public ArrayList<Object> getList() {
		return list;
	}
	public void setList(ArrayList<Object> list) {
		this.list = list;
	}
	public AdvSearch_stu getAdvsch() {
		return advsch;
	}
	public void setAdvsch(AdvSearch_stu advsch) {
		this.advsch = advsch;
	}

	@Override
	public String execute() throws Exception {
		AdvSchService_stu ass = new AdvSchService_stu();
		setList(ass.doAdvSch_stu(advsch));
		return SUCCESS;
	}

}
