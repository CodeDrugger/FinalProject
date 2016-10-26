package domain;

public class Student {
	private int id;
	private String name;
	private String sex;
	private String age;
	private String benke_major;
	private String wish_major;
	private boolean zhibo;
	private int wish_class;//报考硕士类别（0：学硕、1；专硕、2：不确定）
	private String bein_class;//入选方式
	private String score;
	private String honor;
	private String self_intro;
	private String tel;
	private String email;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
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
	public boolean isZhibo() {
		return zhibo;
	}
	public void setZhibo(boolean zhibo) {
		this.zhibo = zhibo;
	}
	public int getWish_class() {
		return wish_class;
	}
	public void setWish_class(int wish_class) {
		this.wish_class = wish_class;
	}
	public String getBein_class() {
		return bein_class;
	}
	public void setBein_class(String bein_class) {
		this.bein_class = bein_class;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getHonor() {
		return honor;
	}
	public void setHonor(String honor) {
		this.honor = honor;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
}
