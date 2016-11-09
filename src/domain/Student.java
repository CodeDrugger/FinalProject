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
	private String selected_tea; //只能有一个，改变状态
	private String selected_me;
	private String attentioned_tea;
	private String attentioned_me;
	private String state;
	private String rate;
	
	public Student() {}

	public Student(String id, String name, String sex, String age, String benke_major, String wish_major, String zhibo,
			String wish_class, String bein_class, String score, String honor, String self_intro, String tel,
			String email, String picture_name, String selected_tea, String attentioned_tea, String attentioned_me,
			String state,String rate) {
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
		this.selected_tea = selected_tea;
		this.attentioned_tea = attentioned_tea;
		this.attentioned_me = attentioned_me;
		this.state = state;
		this.rate = rate;
	}
	
	public String getSelected_me() {
		return selected_me;
	}

	public void setSelected_me(String selected_me) {
		this.selected_me = selected_me;
	}

	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
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
	public String getPicture_name() {
		return picture_name;
	}
	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
	public String getSelected_tea() {
		return selected_tea;
	}
	public void setSelected_tea(String selected_tea) {
		this.selected_tea = selected_tea;
	}
	public String getAttentioned_tea() {
		return attentioned_tea;
	}
	public void setAttentioned_tea(String attentioned_tea) {
		this.attentioned_tea = attentioned_tea;
	}
	public String getAttentioned_me() {
		return attentioned_me;
	}
	public void setAttentioned_me(String attentioned_me) {
		this.attentioned_me = attentioned_me;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
