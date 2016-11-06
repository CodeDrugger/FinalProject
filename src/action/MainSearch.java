package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.Action;

import domain.Search;
import service.SearchService;

public class MainSearch implements Action {
	private Search search;
	private ArrayList<Object> list;
	
	public ArrayList<Object> getList() {
		return list;
	}
	public void setList(ArrayList<Object> list) {
		this.list = list;
	}
	public Search getSearch() {
		return search;
	}
	public void setSearch(Search search) {
		this.search = search;
	}

	@Override
	public String execute() throws Exception {
		SearchService ss = new SearchService();
		setList(ss.doSearch(search));
		if (getList().isEmpty())
			return "empty";
		else
			return SUCCESS;				
	}
}
