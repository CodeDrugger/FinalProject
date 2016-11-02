package action;

import com.opensymphony.xwork2.Action;

import domain.Search;
import service.SearchService;

public class MainSearch implements Action {
	private Search search;
	
	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}

	@Override
	public String execute() throws Exception {
		SearchService ss = new SearchService();
		return null;
	}

}
