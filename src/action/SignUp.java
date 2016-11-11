package action;



import com.opensymphony.xwork2.Action;

import domain.Login;
import service.SignUpService;


public class SignUp implements Action {
	private Login login;
	private String info;
	
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
		SignUpService ss = new SignUpService();
		int state = ss.doSignUp(login);
		if (state == 0)
			return ERROR;
		else if(state == 1)
		{
			setInfo("");
			return SUCCESS;
		}	
		else
		{
			setInfo("该账号已被注册！");
			return "signed";
		}
			
	}

}
