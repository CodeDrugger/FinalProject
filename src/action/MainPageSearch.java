package action;

import com.opensymphony.xwork2.Action;

import domain.Search;
import service.SearchService;

public class MainPageSearch implements Action {
	private Search sch;
	public Search getSch() {
		return sch;
	}
	public void setSch(Search sch) {
		this.sch = sch;
	}
	@Override
	public String execute() throws Exception {
		SearchService ss = new SearchService();
		
		return null;
	}

}
