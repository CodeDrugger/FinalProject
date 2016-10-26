package action;

import com.opensymphony.xwork2.Action;

import domain.Login;
import service.LoginService;

public class LoginAction implements Action {
	Login login = new Login();
	String info = "";
	
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
		if (status == 1)
			return SUCCESS;
		else 
		{
			setInfo("账号或密码错误！");
			return "failed";
		}
			
	}

}
