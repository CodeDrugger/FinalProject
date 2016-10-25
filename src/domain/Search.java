package domain;
/*
 * 该类用于主页的搜索功能
 */
public class Search {
	private String keyword;//查询的关键字
	private int user;//执行查询时的用户类别：0：教师，1：学生
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
}
