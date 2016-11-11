package action;

import com.opensymphony.xwork2.Action;

import domain.Login;
import service.LoginService;

public class LoginAction implements Action {
	private Login login;
	private String id;
	private String info = "";
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String execute() throws Exception {
		LoginService ls = new LoginService();
		int status = ls.doLogin(login);
		setId(login.getId());
		if (status == 1 && login.getUserclass().equals("1"))
			return "success_tea";
		else if(status == 1 && login.getUserclass().equals("2"))
			return "success_stu";
		else 
		{
			setInfo("账号或密码错误！");
			return "failed";
		}
			
	}

}
