package domain;

public class Student {
	private String id;
	private String name;
	private String sex;
	private String age;
	private String benke_major;
	private String wish_major;
	private String zhibo;
	private String wish_class;
	private String bein_class;
	private String score;
	private String honor;
	private String self_intro;
	private String tel;
	private String email;
	private String picture_name;

	public Student() {}
	
	public Student(String id, String name, String sex, String age, String benke_major, String wish_major, String zhibo,
			String wish_class, String bein_class, String score, String honor, String self_intro, String tel,
			String email, String picture_name) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.benke_major = benke_major;
		this.wish_major = wish_major;
		this.zhibo = zhibo;
		this.wish_class = wish_class;
		this.bein_class = bein_class;
		this.score = score;
		this.honor = honor;
		this.self_intro = self_intro;
		this.tel = tel;
		this.email = email;
		this.picture_name = picture_name;
	}

	
	public String getPicture_name() {
		return picture_name;
	}
	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
