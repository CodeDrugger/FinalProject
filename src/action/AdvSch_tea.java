package action;

import com.opensymphony.xwork2.Action;

import domain.AdvSearch_tea;
import service.AdvSchService_tea;

public class AdvSch_tea implements Action {
	private AdvSearch_tea advsch;
	
	public AdvSearch_tea getAdvsch() {
		return advsch;
	}

	public void setAdvsch(AdvSearch_tea advsch) {
		this.advsch = advsch;
	}

	@Override
	public String execute() throws Exception {
		AdvSchService_tea ass = new AdvSchService_tea();
		ass.doAdvSch_tea(advsch);
		return SUCCESS;
	}

}
