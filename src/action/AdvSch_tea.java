package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.Action;

import domain.AdvSearch_tea;
import service.AdvSchService_tea;

public class AdvSch_tea implements Action {
	private AdvSearch_tea advsch;
	private String id;
	private ArrayList<Object> list;
	
	public ArrayList<Object> getList() {
		return list;
	}

	public void setList(ArrayList<Object> list) {
		this.list = list;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AdvSearch_tea getAdvsch() {
		return advsch;
	}

	public void setAdvsch(AdvSearch_tea advsch) {
		this.advsch = advsch;
	}

	@Override
	public String execute() throws Exception {
		AdvSchService_tea ass = new AdvSchService_tea();
		setList(ass.doAdvSch_tea(advsch));
		return SUCCESS;
	}

}
