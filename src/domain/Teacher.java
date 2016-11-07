package domain;

public class Teacher {
	private String id;
	private String name;
	private String sex;
	private String picture_name;
	private String self_intro;//简介
	private String research_field;//研究方向
	private String college;//学校
	private String xueyuan;//学院
	private String major;//专业
	private String tel;
	private String email;
	private String enrollment;//招生人数
	private String in_enrollment;//已招人数
	private String selected_stu;
	private String attentioned_stu;
	private String attentioned_me;
	private String rate;
	
	public Teacher() {}

	public Teacher(String id, String name, String sex, String picture_name, String self_intro, String research_field,
			String college, String xueyuan, String major, String tel, String email, String enrollment,
			String in_enrollment, String selected_stu, String attentioned_stu, String attentioned_me, String rate) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.picture_name = picture_name;
		this.self_intro = self_intro;
		this.research_field = research_field;
		this.college = college;
		this.xueyuan = xueyuan;
		this.major = major;
		this.tel = tel;
		this.email = email;
		this.enrollment = enrollment;
		this.in_enrollment = in_enrollment;
		this.selected_stu = selected_stu;
		this.attentioned_stu = attentioned_stu;
		this.attentioned_me = attentioned_me;
		this.rate = rate;
	}

	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getSelected_stu() {
		return selected_stu;
	}
	public void setSelected_stu(String selected_stu) {
		this.selected_stu = selected_stu;
	}
	public String getAttentioned_stu() {
		return attentioned_stu;
	}
	public void setAttentioned_stu(String attentioned_stu) {
		this.attentioned_stu = attentioned_stu;
	}
	public String getAttentioned_me() {
		return attentioned_me;
	}
	public void setAttentioned_me(String attentioned_me) {
		this.attentioned_me = attentioned_me;
	}
	public String getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(String enrollment) {
		this.enrollment = enrollment;
	}
	public String getIn_enrollment() {
		return in_enrollment;
	}
	public void setIn_enrollment(String in_enrollment) {
		this.in_enrollment = in_enrollment;
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
	public String getPicture_name() {
		return picture_name;
	}
	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getResearch_field() {
		return research_field;
	}
	public void setResearch_field(String research_field) {
		this.research_field = research_field;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getXueyuan() {
		return xueyuan;
	}
	public void setXueyuan(String xueyuan) {
		this.xueyuan = xueyuan;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
}
