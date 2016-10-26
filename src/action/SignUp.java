package action;

import com.opensymphony.xwork2.Action;

import domain.Login;
import service.SignUpService;


public class SignUp implements Action {
	Login login;
	
	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	@Override
	public String execute() throws Exception {
		SignUpService ss = new SignUpService();
		int state = ss.doSignUp(login);
		if (state == 0)
			return ERROR;
		else 
			return SUCCESS;
	}

}
