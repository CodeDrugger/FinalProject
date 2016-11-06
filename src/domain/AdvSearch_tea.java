package domain;

public class AdvSearch_tea {
	private String benke_major;
	private String wish_major;
	private String zhibo;
	private String wish_class;
	private String bein_class;
	private double score;
	private int range;//0:bigger,1:smaller,2:equal
	
	public String getBenke_major() {
		return benke_major;
	}
	public void setBenke_major(String benke_major) {
		this.benke_major = benke_major;
	}
	public String getWish_major() {
		return wish_major;
	}
	public void setWish_major(String wish_major) {
		this.wish_major = wish_major;
	}
	public String getZhibo() {
		return zhibo;
	}
	public void setZhibo(String zhibo) {
		this.zhibo = zhibo;
	}
	public String getWish_class() {
		return wish_class;
	}
	public void setWish_class(String wish_class) {
		this.wish_class = wish_class;
	}
	public String getBein_class() {
		return bein_class;
	}
	public void setBein_class(String bein_class) {
		this.bein_class = bein_class;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	
}
